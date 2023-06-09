class AddAreaToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :area, :string
  end
end
