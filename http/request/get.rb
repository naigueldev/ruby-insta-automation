require "net/http"
require_relative "../../config/headers"

module Request
  class Get
    def initialize(uri = nil, code = nil)
      @uri = uri
      @code = code
    end

    def execute
      request = Net::HTTP::Get.new(@uri)
      Headers.new(@code).get_set(request)
    end
  end
end
