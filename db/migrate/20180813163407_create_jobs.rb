class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.integer :driver_id
      t.integer :car_id
      t.datetime :busy_from
      t.datetime :busy_to

      t.timestamps
    end
  end
end
