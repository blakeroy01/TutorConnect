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

  def update_bio_subjects
    current_user.update(bio: params[:bio], subject:split_subjects)
    index
  end

  private
  def login_params
    params.require(:bio).permit(:subjects)
  end

  def split_subjects
    params[:subject].split(',') if params[:subject]
  end

end
