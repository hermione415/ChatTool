class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :contents
      t.datetime :start_time
      t.datetime :finish_time
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
