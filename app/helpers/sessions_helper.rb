module SessionsHelper

	def log_in(user)
		session[:user_id]  = user.id 
	end

	def current_user
		#DBへの問い合わせの数を可能な限り減らしたい
		if session[:user_id]
			@current_user ||= User.find_by(id: session[:user_id])
		end
	end

	def logged_in?
		!current_user.nil? #current_userがnilでない
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

end
