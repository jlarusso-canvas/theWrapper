class TheMedia
  include HTTParty
  include Requestable
  include Loggable

  base_uri 'data.media.theplatform.com/media/data/Media'

  def initialize(token)
    @options = {
      query: {
        schema: 1.0,
        form: 'json',
        token: token
      }
    }

    # # For making a request
    # @account = "http://access.auth.theplatform.com/data/Account/2639090593"
  end

  def media
    url = '/'
    params = @options.merge(auth_hash)

    request(:get, url, params)
  end
end
