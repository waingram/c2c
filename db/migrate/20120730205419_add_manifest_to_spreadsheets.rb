class AddManifestToSpreadsheets < ActiveRecord::Migration
  def change
    add_column :spreadsheets, :manifest, :string
  end
end
