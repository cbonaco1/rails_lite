require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    # byebug
     unless req.cookies["_rails_lite_app"] == "null"
       byebug
       @cookie = JSON.parse(req.cookies["_rails_lite_app"]) #creates a hash
     else
       @cookie = {}
     end

  end

  def [](key)
    @cookie[key]
  end

  def []=(key, val)
    @cookie[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie("_rails_lite_app", {path:'/', value: @cookie.to_json })
  end
end
