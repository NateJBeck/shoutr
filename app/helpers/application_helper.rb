module ApplicationHelper
  def boldify_the_username(body)
    body.gsub(/@\w+/) { |result| "<strong>#{result}</strong>".html_safe }
  end
end
