class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :sender, index: true, foreign_key: true
      t.references :recipient, index: true, foreign_key: true
      t.text :message

      t.timestamps null: false
    end
  end
end
