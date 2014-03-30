json.array!(@my_requests) do |my_request|
  json.extract! my_request, :id, :client_id, :agent_id
  json.url my_request_url(my_request, format: :json)
end
