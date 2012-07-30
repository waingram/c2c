class CreateSpreadsheets < ActiveRecord::Migration
  def change
    create_table :spreadsheets do |t|

      t.timestamps
    end
  end
end
