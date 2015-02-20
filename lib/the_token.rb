class TheToken
  include HTTParty
  include Requestable
  include Loggable

  base_uri 'https://identity.auth.theplatform.com/idm/web/Authentication'
  @@token = nil

  def initialize
    @options = {
      query: {
        schema: '1.0',
        form: 'json',
        _duration: 600_000
      }
    }


    # # For making a request
    # @account = "http://access.auth.theplatform.com/data/Account/2639090593"
    # @token = nil
  end

  # TODO: Handle expired tokens seamlessly
  def token
    unless @@token
      url = '/signIn'
      params = @options.merge auth_hash

      response = request(:get, url, params)
      @@token = response['signInResponse']['token']
    end

    @@token
  end
end
