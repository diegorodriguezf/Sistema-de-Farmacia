class Dashboard::DashboardController < ApplicationController
	before_action :require_login
	def index
		render 'dashboard/index'
	end
end