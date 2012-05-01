class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :venue
      t.date :date
      t.time :time
      t.integer :contact

      t.timestamps
    end
  end
end
