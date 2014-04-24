class HomesController < ApplicationController
  before_action :go_to_user, if: :signed_in?

  def show
  end

  private

  def go_to_user
    redirect_to current_user
  end
end
