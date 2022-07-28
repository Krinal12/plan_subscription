class Plan < ApplicationRecord
  
  enum plan_type: {weekly: 0, monthly: 1, yearly:2}
  has_many :subscriptions, dependent: :destroy
   has_many :users
end
