class CreateItemStatuses < ActiveRecord::Migration[7.2]
  def change
    create_table :item_statuses do |t|
      t.string :status
      t.datetime :timestamp
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
