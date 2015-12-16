class DashboardController < ApplicationController
  def show
    @user = current_user.twitter
  end
end
