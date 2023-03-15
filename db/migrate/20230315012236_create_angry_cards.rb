class CreateAngryCards < ActiveRecord::Migration[7.0]
  def change
    create_table :angry_cards do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.string :image
      t.string :generated_card
      t.integer :level
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
