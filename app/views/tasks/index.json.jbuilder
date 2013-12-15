json.array!(@tasks) do |task|
  json.extract! task, :id, :content, :priority, :due, :messages, :percentage
  json.url task_url(task, format: :json)
end
