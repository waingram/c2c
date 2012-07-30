class AddPayloadToItems < ActiveRecord::Migration
  def change
    add_column :items, :payload, :string
  end
end
