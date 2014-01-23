json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :last_seen_at
  json.url pet_url(pet, format: :json)
end
