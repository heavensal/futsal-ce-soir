class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :start_time
      t.decimal :price, precision: 5, scale: 2
      t.integer :max_players
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
