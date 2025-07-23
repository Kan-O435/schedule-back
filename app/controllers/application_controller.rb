class ApplicationController < ActionController::API
  #skip_before_action :authenticate_user!

  private

  def authenticate_user!
    token = request.headers['Authorization']&.split(' ')&.last
    payload = FirebaseAuth.verify(token)
    if payload
      @current_user_uid = payload['uid']
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
