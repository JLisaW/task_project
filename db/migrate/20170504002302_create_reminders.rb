class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|
      t.string :to_do
      t.string :priority
      t.string :type

      t.timestamps
    end
  end
end
