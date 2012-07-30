class AddPackageIdToSpreadsheets < ActiveRecord::Migration
  def change
    add_column :spreadsheets, :package_id, :integer
  end
end
