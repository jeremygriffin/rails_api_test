class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string  :name
      t.integer :weight
      t.integer :container_no
      t.timestamps
    end
  end
end
