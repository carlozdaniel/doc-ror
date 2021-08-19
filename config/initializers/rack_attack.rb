class Rack::Attack
Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

safelist('permitir-trafico-local') do |req|
  '127.0.0.1' == req.ip || '::1:' == req.ip
end
throttle('req/ip', limit: 5, period: 5) do |req|
  req.ip
end

self.throttled_response = -> (env) {
  retry_after = (env['rack.attack.match_data'] || {})[:period]
  [
    429,
    {'Content-Type' => 'application/json',
      'Retry_After' => retry_after.to_s},
      [{error: 'throttle reached retry later'}.to_json]
  ]
}

end