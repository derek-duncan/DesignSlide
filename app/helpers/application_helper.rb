module ApplicationHelper
	def markdown(text)
		this = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
		this.render(text).html_safe
	end
end
