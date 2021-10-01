require "net/http"
require "uri"
require_relative "./query"
require_relative "../../http/request/post"

module Media
  class Delete
    def execute_with_medias
      Media::Query.new.execute.each_with_index do |media, index|
        puts "media code = #{media[:code]} , media id = #{media[:media_id]}"
        make_request(media[:code], media[:media_id])
      end
    end

    def execute_media
      Media::Query.new.execute_delete
    end

    def make_request(code = nil, media_id = nil)
      uri = URI.parse("https://www.instagram.com/create/#{media_id}/delete/")

      request = mount_request(uri, code)

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      response_body = JSON.parse(response.body)

      puts "DELETE RESPONSE: #{response_body}"

      deu_ruim if response_body["status"] === "fail"
    end

    def mount_request(uri, code)
      Request::Post.new(uri, code).execute
    end

    def deu_ruim
      puts ">>> DEU RUIM ... "
      exit(true)
    end
  end
end
