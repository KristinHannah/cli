require_relative "cli/version"

module Cli
  class Error < StandardError; end
  # Your code goes here...
end

require_all 'lib'
require_relative './cli'
