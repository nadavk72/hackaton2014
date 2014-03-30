class CreateMyRequests < ActiveRecord::Migration
  def change
    create_table :my_requests do |t|
      t.string :client_id
      t.string :agent_id

      t.timestamps
    end
  end
end
