class Dashboard::DashboardController < ApplicationController
    before_action :authenticate_user
	def index
		render 'dashboard/index'
	end
end