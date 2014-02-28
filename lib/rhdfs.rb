require "rhdfs/version"

Dir["jars/*.jar"].map { |jar| require jar }

module Rhdfs

end

require "rhdfs/client"