class RemoveCurrentSignInIpColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :current_sign_in_ip, :datetime
  end
end
