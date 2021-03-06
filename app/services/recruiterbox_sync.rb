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
    Opening.active
  end

  def sync_openings(latest)
    active_openings = latest.map do |opening|
      unless Opening.find_by(service_id: opening['id'])
        create_opening_from(Recruiterbox::Openings.find(opening['id']))
      end
      opening['id']
    end

    deactivate_all_openings_except(active_openings)
  end

  def create_opening_from(data)
    Opening.create(
      service_id: data['id'],
      name: data['title'],
      test_stage_id: test_stage_id(data),
      passed_stage_id: passed_stage_id(data)
    )
  end

  def deactivate_all_openings_except(active_ids)
    Opening.where.not(service_id: active_ids).update_all(locked: true)
  end

  def sync_candidates
    current_openings.each do |opening|
      prospects = Recruiterbox::Candidates.where(
        opening_id: opening.service_id,
        stage_id: opening.test_stage_id,
        state: 'in_process'
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
    find_stage_id data, 'Examen General'
  end

  def passed_stage_id(data)
    find_stage_id data, 'Examen Aprobado'
  end

  def find_stage_id(data, name)
    data['stages'].select { |stage| stage['name'] == name }[0]['id']
  end
end
