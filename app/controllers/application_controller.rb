class ApplicationController < ActionController::Base
  def markdown(content)
    @renderer ||= Redcarpet::Render::HTML.new
    @markdown ||= Redcarpet::Markdown.new(@renderer)

    @markdown.render(content).html_safe
  end
  helper_method :markdown
end
