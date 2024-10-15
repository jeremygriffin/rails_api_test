class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string  :name
      t.integer :weight
      t.integer :container
      t.timestamps
    end
  end
end
