module ApplicationHelper
  def fixed_url(str)
    return "" unless str.present?
    str.start_with?("http://") ? str : "http://#{str}"
  end
end
