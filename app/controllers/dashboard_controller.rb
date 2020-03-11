class DashboardController < ApplicationController
  def index
    render json: {
      text: "This is the dashboard"
    }
  end
end
