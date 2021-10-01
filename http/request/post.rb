require "net/http"
require_relative "../../config/headers"

module Request
  class Post
    def initialize(uri = nil, code = nil)
      @uri = uri
      @code = code
    end

    def execute
      request = Net::HTTP::Post.new(@uri)
      Headers.new(@code).post_set(request)
    end
  end
end
