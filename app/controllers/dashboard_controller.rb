class DashboardController < ApplicationController
  def index
    render 'dashboard/dashboard'
  end

  def pre_index
    render 'dashboard/pre_index'
  end

  def update_bio
    current_user.update_attributes(bio: params[:bio])
    index
  end

end
