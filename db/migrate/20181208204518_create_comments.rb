class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.integer :rating
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
