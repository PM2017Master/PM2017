require 'net/https'
module SystemCalendarsHelper

  include AuthHelper

  def calendar(event_type, lecture, start)
      #event_type = "レポート"
      #lecture = "プロジェクトマネジメント論"
      d_start = Date.strptime(start, '%Y/%m/%d')
      d_end = d_start.tomorrow
      event_title = "#{lecture}#{event_type}"
      #event_start = DateTime.new(d_start.year, d_start.month, d_start.day)
      #event_end = event_start.tomorrow
      #event_end.day = event_end.day+1
      event_start = Time.new(d_start.year, d_start.month, d_start.day)
      event_end = Time.new(d_end.year, d_end.month, d_end.day)
      students = Lecture.find_by(name: lecture).students
      students.each do |s|
          unless s.azure_token.nil? #azure_tokenがnilでない
              sendcalendar(event_title, event_start, event_end, s.email)
          end
      end
      #redirect_to root_url
  end

  def sendcalendar(event_title, event_start, event_end, email)

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
      end
  end

end
