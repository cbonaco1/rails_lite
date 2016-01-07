require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    # byebug
    cookie = req.cookies["_rails_lite_app"]
    #cookie comes in as a string
    # byebug
     if cookie
       @data = JSON.parse(cookie) #creates a hash of cookie
     else
       @data = {}
     end

  end

  def [](key)
    @data[key]
  end

  def []=(key, val)
    @data[key] = val
  end

  # serialize the hash into json and save in a data
  # add to the responses cookies
  def store_session(res)
    res.set_cookie("_rails_lite_app", {path:'/', value: @data.to_json })
  end
end
