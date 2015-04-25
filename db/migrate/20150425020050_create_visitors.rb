class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :name
      t.string :email
      t.datetime :time
      t.string :purpose
      t.string :poc

      t.timestamps null: false
    end
  end
end
