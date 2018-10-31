class AddSocialNetworkAccountBind < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :social_id, :string, :default => 'None'
  end
end
