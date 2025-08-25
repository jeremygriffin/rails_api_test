class CreateContainerHistories < ActiveRecord::Migration[7.2]
  def change
    create_table :container_histories do |t|
      t.string :name
      t.datetime :timestamp
      t.references :container, null: false, foreign_key: true

      t.timestamps
    end
  end
end
