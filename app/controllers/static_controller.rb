class StaticController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :check_auth
  def check_auth
      if user_signed_in?
          redirect_to events_path
      end
  end
  def home
  end
end
