class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :actor, foreign_key: true, index: true	
      t.references :repo, foreign_key: true, index: true	
      t.string :public, boolean: true, default: false
      t.integer :event_type, null: false

      t.timestamps
    end
  end
end
