class ChangeProfileColumnDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :customers, :profile, nil
  end
end
