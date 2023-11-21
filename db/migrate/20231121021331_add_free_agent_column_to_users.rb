class AddFreeAgentColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :free_agent, :boolean, default: true
  end
end
