# frozen_string_literal: true

# Here we have all of the basic helper functions
module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def login(auth)
    user = User.find_or_initialize_by(uid: auth.uid)

    user.update(
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      email: auth.info.email,
      last_sign_in_at: Time.now
    )

    session[:user_id] = user.id
    @current_user = user
  end

  def logout
    session.delete :user_id
  end
end
