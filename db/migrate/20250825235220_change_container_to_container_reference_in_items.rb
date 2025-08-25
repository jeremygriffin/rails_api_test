class ChangeContainerToContainerReferenceInItems < ActiveRecord::Migration[7.2]
  def change
    add_reference :items, :container, foreign_key: true
    remove_column :items, :container, :integer
  end
end
