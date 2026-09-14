class SessionsController < ApplicationController

  skip_before_action :require_authentication, only: :create

  def create
    user = User.authenticate_by(
      email_address: params[:email_address],
      password: params[:password]
    )

    if user
      session = user.sessions.create!(
        ip_address: request.remote_ip,
        user_agent: request.user_agent
      )

      token = session.signed_id(
        purpose: :api_auth
      )

      render json: {
        message: "Login successful",
        token: token,
        user: {
          id: user.id,
          email_address: user.email_address,
          role: user.role
        }
      }, status: :created

    else
      render json: {
        error: "Invalid email or password"
      }, status: :unauthorized
    end
  end

  def destroy
    token = request.headers["Authorization"]&.sub("Bearer ", "")

    if token.present?
      begin
        session = Session.find_signed!(
          token,
          purpose: :api_auth
        )

        session.destroy

      rescue ActiveSupport::MessageVerifier::InvalidSignature,
             ActiveRecord::RecordNotFound
      end
    end

    render json: {
      message: "Logged out successfully"
    }
  end
end