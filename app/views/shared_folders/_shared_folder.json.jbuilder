json.extract! shared_folder, :id, :user_id, :shared_email, :shared_user_id, :holding_id, :message, :created_at, :updated_at
json.url shared_folder_url(shared_folder, format: :json)
