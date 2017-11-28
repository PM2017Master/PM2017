

module AuthHelper

  # App's client ID. Register the app in Application Registration Portal to get this value.
  CLIENT_ID = 'f7b61934-dfb9-4de5-a6df-73ef42e7ca1a'
  # App's client secret. Register the app in Application Registration Portal to get this value.
  CLIENT_SECRET = 'gaqtQSSA4840>#vzoOTW4:|'

  # Scopes required by the app
  SCOPES = [ 'openid',
           'profile',
           'offline_access',
           'User.Read',
           'Calendars.ReadWrite' ]

  # Generates the login URL for the app.
  def get_login_url
    client = OAuth2::Client.new(CLIENT_ID,
                                CLIENT_SECRET,
                                :site => "https://login.microsoftonline.com",
                                :authorize_url => "/common/oauth2/v2.0/authorize",
                                :token_url => "/common/oauth2/v2.0/token")

    login_url = client.auth_code.authorize_url(:redirect_uri => authorize_url, :scope => SCOPES.join(' '))
  end

# Exchanges an authorization code for a token
def get_token_from_code(auth_code)
  client = OAuth2::Client.new(CLIENT_ID,
                              CLIENT_SECRET,
                              :site => 'https://login.microsoftonline.com',
                              :authorize_url => '/common/oauth2/v2.0/authorize',
                              :token_url => '/common/oauth2/v2.0/token')

  token = client.auth_code.get_token(auth_code,
                                     :redirect_uri => authorize_url,
                                     :scope => SCOPES.join(' '))
end



# Gets the user's email from the /Me endpoint
def get_user_email(access_token)
  callback = Proc.new { |r| r.headers['Authorization'] = "Bearer #{access_token}"}

  graph = MicrosoftGraph.new(base_url: 'https://graph.microsoft.com/v1.0/me/',
                             cached_metadata_file: File.join(MicrosoftGraph::CACHED_METADATA_DIRECTORY, 'metadata_v1.0.xml'),
                             &callback)

  
  
return graph.me.user_principal_name







end



def get_access_token
  # Get the current token hash from session
 callback = Proc.new { |r| r.headers['Authorization'] = "Bearer #{access_token}"}

  graph = MicrosoftGraph.new(base_url: 'https://graph.microsoft.com/v1.0',
                             cached_metadata_file: File.join(MicrosoftGraph::CACHED_METADATA_DIRECTORY, 'metadata_v1.0.xml'),
                             &callback)

  me = graph.me
  return me.user_principal_name
end





end