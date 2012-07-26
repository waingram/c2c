class Item < ActiveRecord::Base
  attr_accessible :manifest
  belongs_to :package
  mount_uploader :manifest, ManifestUploader

    #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:manifest),
      "size" => manifest.size,
      "delete_url" => package_item_path(@package, :id => id),
      "delete_type" => "DELETE"
    }
  end
end
