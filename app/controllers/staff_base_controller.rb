#　事務ベースコントローラ
# その他の事務コントローラはこのコントローラを継承すること。
class StaffBaseController < ApplicationController
  layout 'staff_base'
  #rescue_from Exception, with: :render_500

  def render_500
  render template: 'errors/error_500', status: 500, layout: 'staff_base', content_type: 'text/html'
end

end
