class CreateConfirmations < ActiveRecord::Migration[6.0]
  def change
    create_table :confirmations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :token
      t.datetime :confirmed_at
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
