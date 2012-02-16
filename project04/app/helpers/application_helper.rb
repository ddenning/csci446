module ApplicationHelper
	def create_referer_link
		session[:previous_page] = request.env['HTTP_REFERER'] || articles_url
	end
end
