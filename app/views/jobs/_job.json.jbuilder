json.extract! job, :id, :driver_id, :car_id, :busy_from, :busy_to, :created_at, :updated_at
json.url job_url(job, format: :json)
