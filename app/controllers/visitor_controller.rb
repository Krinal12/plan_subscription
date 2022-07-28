class VisitorController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @plans = Plan.all
    @sub = Subscription.all
  end
end
