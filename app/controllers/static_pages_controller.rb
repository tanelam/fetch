class StaticPagesController < ApplicationController

skip_before_action :require_login, only: [:help, :home]

  def help
    render :help
  end

  def home
    render :help
  end

end
