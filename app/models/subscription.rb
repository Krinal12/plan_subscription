class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  enum plan_status: {not_active: 0, active: 1};
    # before_create :update_user_id
  after_create_commit :active
  # def plan_active
  #   deactivate_plan_one
  #   # activate_plan_two
  # end

  # def deactivate_plan_one
  #   p "2222222222222222222222222222222222222222222"
  #  if current_user.subscription.plan_status == "active"
  #      p  current_user.plan.plan_type,"11111111111111111111111111111111111111111111111"
  #   # sub.plans.active.where(name: plan_one).first.try(:deactivate)
  #  end
  # end

  # def activate_plan_two
  #   sub.plan.where(name: plan_two).add if sub.have_plan_two? == false
  # end


  private
  def active 
    update_attribute :plan_status, "active"
  end
  # def update_user_id 
  #    p "innnnnnnnnnnnnnnnnnnnnnn"
    
  #     p "after ifffffffffffffffffffff"
  #     update_attribute :user_id, "nil"
    
  # end
  
end

