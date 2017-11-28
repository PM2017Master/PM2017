#  atsushi's place
require 'net/https'
class SystemCalendarController < SystemBaseController
    include AuthHelper
    
    def sendcalendar
        email = params[:email]#User.find_by(email: params[:email])

        token = get_access_token(email)

        email = #session[:user_email]
        if token
        # If a token is present in the session, get events from the calendar
        callback = Proc.new do |r| 
            r.headers['Authorization'] = "Bearer #{token}"
            #r.headers['X-AnchorMailbox'] = email
            r.headers['Content-Type'] = "application/json"
        end

        event_content = {
            "subject" => "My event2",
            "start" => {
            "dateTime": "2017-11-06T06:20:36.767Z",
            "timeZone": "UTC"
            },
            "end" => {
            "dateTime": "2017-11-13T06:20:36.767Z",
            "timeZone": "UTC"
            }
        }.to_json

        #graph = MicrosoftGraph.new(base_url: 'https://graph.microsoft.com/v1.0/me/events',
        #                          &callback)
        
        uri = URI.parse("https://graph.microsoft.com/v1.0/me/events")
        https = Net::HTTP.new(uri.host, uri.port)
    
        https.use_ssl = true
        https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
        req = Net::HTTP::Post.new(uri.path)
        req['Authorization'] = "Bearer #{token}"
        req['Content-Type'] = "application/json"

        req.body = event_content
    
        res = https.request(req)

        
        #@events = graph.me.events.order_by('start/dateTime asc')

        #print(@events)
        else
        # If no token, redirect to the root url so user
        # can sign in.
        redirect_to root_url
        end
    end
end
