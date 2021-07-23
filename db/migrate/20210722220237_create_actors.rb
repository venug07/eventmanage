class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.string :name, null: false	
      t.string :email,              null: false
      t.string :password_digest,    null: false
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      t.timestamps
    end
  end
end
