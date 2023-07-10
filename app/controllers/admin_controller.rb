class AdminController < ApplicationController
  before_action :is_admin

  def users_count
    @users_count = User.count
  end
end
