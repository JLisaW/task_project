class CreateFamilyUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :family_users do |t|
      t.string :username
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
