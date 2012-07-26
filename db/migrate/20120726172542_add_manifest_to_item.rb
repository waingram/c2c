class AddManifestToItem < ActiveRecord::Migration
  def change
    add_column :items, :manifest, :string
  end
end
