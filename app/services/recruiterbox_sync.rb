# frozen_string_literal: true

# This service syncs our candidates and openings with Recruiterbox's
class RecruiterboxSync
  def self.call
    new
  end

  def initialize
    sync_openings(latest_openings)
    sync_candidates
  end

  private

  def latest_openings
    Recruiterbox::Openings.where(tags: 'Tiene Examen')
  end

  def current_openings
    Opening.all
  end

  def sync_openings(latest)
    latest.each do |opening|
      next if Opening.find_by(service_id: opening['id'])

      full_opening_data = Recruiterbox::Openings.find(opening['id'])

      Opening.create(
        service_id: full_opening_data['id'],
        name: full_opening_data['title'],
        test_stage_id: test_stage_id(full_opening_data),
        passed_stage_id: passed_stage_id(full_opening_data)
      )
    end
  end

  def sync_candidates
    current_openings.each do |opening|
      prospects = Recruiterbox::Candidates.where(
        opening_id: opening.service_id, stage_id: opening.test_stage_id
      )
      prospects.each { |prospect| find_and_update_candidate(prospect, opening) }
    end
  end

  def find_and_update_candidate(data, opening)
    candidate = Candidate.find_or_initialize_by(service_id: data['id'])
    candidate.update(
      first_name: data['first_name'],
      last_name: data['last_name'],
      email: data['email'],
      opening: opening
    )
  end

  def test_stage_id(data)
    find_stage_id data, 'Examen'
  end

  def passed_stage_id(data)
    find_stage_id data, 'Examen Aprobado'
  end

  def find_stage_id(data, name)
    data['stages'].select { |stage| stage['name'] == name }[0]['id']
  end
end
