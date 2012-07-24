json.array!(@items) do |json, item|
  json.name item.file_file_name
  json.size item.file_file_size
  json.size item.file_content_type
  json.url item.file.url(:original)
  json.thumbnail_url item.file.url(:thumb)
  json.delete_url package_item_url(@package, item)
  json.delete_type "DELETE"
end