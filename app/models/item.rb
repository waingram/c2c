class Item < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :manifest, :payload
  belongs_to :package
  mount_uploader :manifest, ManifestUploader
  mount_uploader :payload, PayloadUploader

  # one convenient method to pass jq_upload the necessary information
  # @param [Package] package_id
  def to_jq_upload(package_id)
    type = "manifest" unless manifest.file.nil?
    type = "payload" unless payload.file.nil?
    {
      "type" => type,
      "name" => read_attribute(:manifest) || read_attribute(:payload),
      "size" => manifest.size || payload.size,
      "delete_url" => package_item_path(:package_id => package_id, :id => id),
      "delete_type" => "DELETE"
    }
  end
end
