module ApplicationHelper
  def fix_url(str)
    return "" unless str.present?
    str.start_with?("http://") ? str : "http://#{str}"
  end

  def display_datetime(datetime)
    datetime.strftime('%m/%d/%Y %l:%M%P %Z') # 07/21/2014 07:47am
  end
end
