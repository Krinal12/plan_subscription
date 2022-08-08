class SubscriptionsController < ApplicationController
  def create
    @plan = Plan.find(params[:plan_id])
          @sub = @plan.subscriptions.create(subscription_params) do |c|
            c.user_id = current_user.id
          end
          # redirect_to visitor_index_path , notice: "You have Subscribe The plan"
          if current_user.plan.plan_type == 'monthly'
            @sub = @plan.subscriptions.create(monthly_subscription_params) do |c|
            c.user_id = current_user.id
          end
        #  redirect_to '/subscriptions/yearly'
        redirect_to "/subscriptions/upgrade"
          end
           if current_user.plan.plan_type == 'weekly'
            @sub = @plan.subscriptions.create(weekly_subscription_params) do |c|
            c.user_id = current_user.id
          end
        #  redirect_to '/subscriptions/yearly'
        redirect_to "/subscriptions/upgrade"
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
    def monthly_subscription_params
      @plan = Plan.find(params[:plan_id])
          @end_date = Date.today + 1.year
      params.require(:subscription).permit(:start_date, :end_date, :plan_status).merge(start_date: Date.today , end_date: @end_date )
    end
   def weekly_subscription_params
     @plan = Plan.find(params[:plan_id])
          @end_date = Date.today + 1.month
      params.require(:subscription).permit(:start_date, :end_date, :plan_status).merge(start_date: Date.today , end_date: @end_date )
   end 
   
end
