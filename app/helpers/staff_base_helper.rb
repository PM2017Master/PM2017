module StaffBaseHelper
  def is_need_backpath?
    if controller.controller_name == 'staff_homes'
      false
    else
      true
    end
  end

  def convert_intensive_tag flag
      if flag
        '集中'
      else
        '一般'
      end
  end
end
