class AddSimpleTokenAuthenticationToUsers < ActiveRecord::Migration
  def change
    change_column :users, :authentication_token, :string, null: false
  end
end
