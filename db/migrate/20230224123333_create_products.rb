class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :author
      t.integer :user_id

      t.timestamps
    end
  end
end
