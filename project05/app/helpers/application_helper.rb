module ApplicationHelper
	
	def create_referer_link
		unless session[:previous_page]
			if request.env['HTTP_REFERER']
				session[:previous_page] = request.env['HTTP_REFERER']
			else
				session[:previous_page] = articles_url
			end
		end
	end

end
