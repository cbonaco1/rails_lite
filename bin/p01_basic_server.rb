require 'rack'
require 'byebug'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'

  #writes the path of the request
  res.write(req.fullpath)
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
