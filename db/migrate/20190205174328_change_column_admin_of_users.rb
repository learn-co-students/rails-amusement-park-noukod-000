
class ChangeColumnAdminOfUsers < ActiveRecord::Migration[5.2]
   change_column :users, :admin, :boolean, :default => false
end
