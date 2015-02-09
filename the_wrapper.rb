require 'httparty'
require 'pry'

class String
  def yellow
    "\e[33m#{self}\e[0m"
  end
end

class ThePlatform
  include HTTParty

  SCHEMA_VERSION = '1.2'
  FORMAT = 'json'

  def initialize
    @options = { query: {schema: SCHEMA_VERSION, form: FORMAT} }
    @account = "http://access.auth.theplatform.com/data/Account/2639090593"
    @token = 'abc123'
  end

  def auth_hash
    { basic_auth: { username: @account, password: @token } }
  end

  def log(*items)
    puts "", items, ""
  end
end

class ThePlatformMedia < ThePlatform
  base_uri 'data.media.theplatform.com/media/data/Media'

  def all_media
    log "GET '/'".yellow, @options.merge(auth_hash)
    self.class.get "/", @options.merge(auth_hash)
  end
end

tpm = ThePlatformMedia.new
# tpm.all_media

binding.pry
