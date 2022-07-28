class AddPlanIdToSubscriptions < ActiveRecord::Migration[7.0]
  def change
    add_reference :subscriptions, :plan, null: false, foreign_key: true
  end
end
