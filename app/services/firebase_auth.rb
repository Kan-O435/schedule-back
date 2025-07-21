require 'google-id-token'

class FirebaseAuth
  SERVICE_ACCOUNT = Rails.root.join('config/firebase_service_account.json').to_s

  def self.app
    @app ||= Firebase::Admin::Sdk.configure do |config|
      config.credentials = Firebase::Admin::Sdk::Credentials.from_file(SERVICE_ACCOUNT)
    end
  end

  def self.verify(token)
    app
    auth_client = Firebase::Admin::Sdk::Auth.client(app) # トークン検証用
    auth_client.verify_id_token(token)
  rescue => e
    Rails.logger.warn "Firebase token invalid: #{e}"
    nil
  end
end
