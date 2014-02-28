require "rhdfs/version"

Dir[File.expand_path("../jars/*.jar", __FILE__)].each { |jar| require jar }

module Rhdfs

end

require "rhdfs/client"