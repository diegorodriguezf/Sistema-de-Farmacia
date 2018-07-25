class Dashboard::DashboardController < ApplicationController
	#before_filter :authenticate_user!
	def index
		render 'dashboard/index'
	end
end
