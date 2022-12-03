class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :login, null: false, index: { unique: true }
      t.string :username, null: false
      t.string :password, null: false

      t.timestamps
    end
  end
end
