class CreateNotes < ActiveRecord::Migration[8.1]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.text :body
      t.boolean :published, null: false, default: false

      t.timestamps
    end

    add_index :notes, :published
  end
end
