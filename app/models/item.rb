class Item < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :payload
  belongs_to :package
  mount_uploader :payload, PayloadUploader

  # one convenient method to pass jq_upload the necessary information
  def to_jq_upload(package_id)
    {
      "type" => "payload",
      "name" => read_attribute(:payload),
      "size" => payload.size,
      "delete_url" => package_item_path(:package_id => package_id, :id => id),
      "delete_type" => "DELETE"
    }
  end
end
