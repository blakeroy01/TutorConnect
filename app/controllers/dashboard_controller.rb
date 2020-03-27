class DashboardController < ApplicationController
  def index
    render 'dashboard/dashboard'
  end

  def pre_index
    render 'dashboard/pre_index'
  end

  def pre_index_tutor
    render 'dashboard/pre_index_tutor'
  end

  def update_bio
    current_user.update_attributes(bio: params[:user][:bio])
    index
  end

  def update_bio_subjects
    current_user.update_attributes(bio: params[:user][:bio], subjects:params[:user][:subjects])
    redirect_to '/dashboard'
  end

  private
  def login_params
    params.require(:login, :bio).permit(:email, :password)
  end
end
