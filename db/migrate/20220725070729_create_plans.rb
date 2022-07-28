class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.integer :plan_type

      t.timestamps
    end
  end
end
