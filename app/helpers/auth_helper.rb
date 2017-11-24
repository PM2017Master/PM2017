module AuthHelper

  # App's client ID. Register the app in Application Registration Portal to get this value.
  CLIENT_ID = '59e9d64c-c0cb-4499-8fd6-c760a54663c1'
  # App's client secret. Register the app in Application Registration Portal to get this value.
  CLIENT_SECRET = 'bkjurNJG585!!-jpQHFV34^'

  # Scopes required by the app
  SCOPES = [ 'openid',
             'profile',
             'User.Read',
             'Mail.Read' ]

  # Generates the login URL for the app.
  def get_login_url
    client = OAuth2::Client.new(CLIENT_ID,
                                CLIENT_SECRET,
                                :site => "https://login.microsoftonline.com",
                                :authorize_url => "/common/oauth2/v2.0/authorize",
                                :token_url => "/common/oauth2/v2.0/token")

    login_url = client.auth_code.authorize_url(:redirect_uri => authorize_url, :scope => SCOPES.join(' '))
  end
end