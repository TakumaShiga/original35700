class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string  :event_name,    null: false
      t.integer :fee,           null: false
      t.text    :description,   null: false
      t.integer :category_id,   null: false
      t.integer :prefecture_id, null: false
      t.string  :place_number,  null: false
      t.string  :place_name,    null: false
      t.date    :event_date,    null: false
      t.time    :start_time,    null: false
      t.time    :finish_time,   null: false
      t.date    :deadline,      null: false
      t.timestamps
    end
  end
end
