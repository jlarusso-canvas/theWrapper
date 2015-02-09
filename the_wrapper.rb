require 'httparty'
require 'pry'

class String
  def yellow
    "\e[33m#{self}\e[0m"
  end
end

class ThePlatform
  include HTTParty
  base_uri 'https://identity.auth.theplatform.com/idm/web/Authentication'

  SCHEMA_VERSION = '1.2'
  FORMAT = 'json'

  def initialize
    @options = { query: {schema: SCHEMA_VERSION, form: FORMAT} }

    # For getting a new token
    @username = 'jlarusso@canvas.is'
    @password = 'wQN46ww/dref+iWiLCru'

    # For making a request
    @account = "http://access.auth.theplatform.com/data/Account/2639090593"
    @token = nil
  end

  # Requests -----------------------------------------------------------------
  def token
    url = '/signIn'
    params = @options.merge auth_hash(@username, @password)

    request(:get, url, params)
  end

  private

  def auth_hash(username = @account, password = @token)
    { basic_auth: { username: username, password: password } }
  end

  def request(method, url, params)
    log("#{method.to_s.upcase} #{url}".yellow, params)
    self.class.send(method, url, params)
  end

  def log(*items)
    puts "", items, ""
  end
end

class ThePlatformMedia < ThePlatform
  base_uri 'data.media.theplatform.com/media/data/Media'

  # Requests -----------------------------------------------------------------
  def media
    url = '/'
    params = @options.merge(auth_hash)

    request(:get, url, params)
  end
end

tpm = ThePlatformMedia.new
# tpm.token
# tpm.media

binding.pry
