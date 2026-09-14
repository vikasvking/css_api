module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :require_authentication
  end

  private

  def require_authentication
    token = request.headers["Authorization"]&.sub("Bearer ", "")

    if token.blank?
      render json: {
        error: "Authentication required"
      }, status: :unauthorized

      return
    end

    begin
      session = Session.find_signed!(
        token,
        purpose: :api_auth
      )

      Current.session = session

    rescue ActiveSupport::MessageVerifier::InvalidSignature,
           ActiveRecord::RecordNotFound

      render json: {
        error: "Invalid or expired token"
      }, status: :unauthorized
    end
  end
end