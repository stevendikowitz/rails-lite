require 'rack'
require 'byebug'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  body = "Hello world!"
  res['Content-Type'] = 'text/html'
    if req.path_info == "/"
      res.write(body)
    else
      res.write(req.path)
    end
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
