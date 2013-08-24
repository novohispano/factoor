module ApplicationHelper
  def format_time(input)
    input.strftime("%B %d, %Y")
  end
end