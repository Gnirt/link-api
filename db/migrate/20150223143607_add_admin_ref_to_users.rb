class AddAdminRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :admin, index: true
    add_foreign_key :users, :admins
  end
end
