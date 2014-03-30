class AddFieldsToMyRequests < ActiveRecord::Migration
  def change
    add_column :my_requests, :country, :string
    add_column :my_requests, :attack_type, :string
  end
end
