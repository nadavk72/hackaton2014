class AddFieldIsValidToMyRequests < ActiveRecord::Migration
  def change
    add_column :my_requests, :is_valid, :boolean
  end
end
