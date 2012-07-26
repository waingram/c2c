class AddAttachmentPayloadToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.has_attached_file :payload
    end
  end

  def self.down
    drop_attached_file :items, :payload
  end
end
