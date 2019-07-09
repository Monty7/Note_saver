class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :user_id
      t.integer :category_id
    end
  end
end
