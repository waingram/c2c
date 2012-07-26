class AddAttachmentManifestToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.has_attached_file :manifest
    end
  end

  def self.down
    drop_attached_file :items, :manifest
  end
end
