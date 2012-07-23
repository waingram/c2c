class AddPackageIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :package_id, :integer
  end
end
