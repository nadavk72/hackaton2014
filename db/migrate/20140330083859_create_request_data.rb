class CreateRequestData < ActiveRecord::Migration
  def change
    create_table :request_data do |t|
      t.date :date
      t.string :client_id
      t.string :agent_id

      t.timestamps
    end
  end
end
