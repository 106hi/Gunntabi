class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :customer_id, null: false
      t.string :post_name, null: false, default: ""
      t.text :introduction, null: false, default: ""
      t.string :address, null: false, default: ""
      t.float :latitude
      t.float :longitude
      t.boolean :is_release, null: false, default: false

      t.timestamps
    end
  end
end
