class AddFieldRequestParametersToMyRequests < ActiveRecord::Migration
  def change
    add_column :my_requests, :request_parameters, :string
  end
end
