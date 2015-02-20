require 'httparty'
require 'pry'

require './lib/loggable'
require './lib/requestable'
require './lib/string'
require './lib/the_media'
require './lib/the_token'

# Usage ----------------------------------------------------------------------
tt = TheToken.new
thm = TheMedia.new(tt.token)

binding.pry
