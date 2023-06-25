class ChangeProfileColumnNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :customers, :profile, true
  end
end
