json.items do
  json.array!(@items) do |item|
    json.title item.title
    json.description item.description
  end
end
