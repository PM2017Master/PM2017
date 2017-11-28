#  atsushi's place
require 'net/https'
class SystemCalendarsController < SystemBaseController
    include AuthHelper
    
    def sendcalendar
        event_type = "レポート"
        event_title = "プロジェクトマネジメント論#{event_type}"
        event_start = Time.new(2017, 11, 29)
        event_end = Time.new(2017, 11, 30)
        email = Student.find_by(email: "pmstudent2017@outlook.com").email

        token = get_access_token(email)

        if token
        # If a token is present in the session, get events from the calendar
        callback = Proc.new do |r| 
            r.headers['Authorization'] = "Bearer #{token}"
            #r.headers['X-AnchorMailbox'] = email
            r.headers['Content-Type'] = "application/json"
        end

        event_content = {
            "subject" => event_title,
             "start" => {
             "dateTime": event_start,
             "timeZone": "UTC"
             },
            "end" => {
            "dateTime": event_end,
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
        redirect_to root_url
        else
        # If no token, redirect to the root url so user
        # can sign in.
        redirect_to root_url
        end
    end
end
