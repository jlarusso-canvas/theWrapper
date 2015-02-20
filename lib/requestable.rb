module Requestable
  private

  USERNAME = 'mpx/jlarusso@canvas.is'
  PASSWORD = 'wQN46ww/dref+iWiLCru'

  def auth_hash
    {
      basic_auth: {
        username: USERNAME,
        password: PASSWORD
      }
    }
  end

  def request(method, url, params)
    log("#{method.to_s.upcase} #{url}".yellow, params)
    self.class.send(method, url, params)
  end
end
