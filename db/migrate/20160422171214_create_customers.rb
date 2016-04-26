class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :lastname
      t.string :phone
      t.string :timein

      t.timestamps null: false
    end
  end
end
