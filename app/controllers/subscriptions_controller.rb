class SubscriptionsController < ApplicationController
  def create
    @plan = Plan.find(params[:plan_id])
    @check_sub = Subscription.find_by_sql ["SELECT user_id FROM subscriptions WHERE plan_status = 1"]
    if Subscription.exists?(:user_id => current_user)
      redirect_to visitor_index_path , notice: "You Have Alreay Subscribe"
    else
      if !@check_sub
          redirect_to visitor_index_path , notice: "You Have Alreay Subscribe"
      else 
          @sub = @plan.subscriptions.create(subscription_params) do |c|
            c.user_id = current_user.id
          end
          redirect_to visitor_index_path , notice: "You have Subscribe The plan"
      end
    end
  end

  

  private
    def subscription_params
       @plan = Plan.find(params[:plan_id])
       if @plan.plan_type == 'weekly'
          @end_date = Date.today + 7
       elsif  @plan.plan_type == 'monthly'
          @end_date = Date.today + 1.month
        elsif  @plan.plan_type == 'yearly'
          @end_date = Date.today + 1.year
       end
      params.require(:subscription).permit(:start_date, :end_date, :plan_status).merge(start_date: Date.today , end_date: @end_date )
    end
    
   
end
