require "net/http"
require "uri"
require "json"
require_relative "../../config/insta"
require_relative "../../config/credentials"
require_relative "../../http/request/get"
require_relative "./list"
require_relative "./delete"

module Media
  class Query
    attr_accessor :insta_uri, :query_hash, :child_comment_count, :authority, :cookie

    def initialize
      @insta_uri = Insta::uri
      @query_hash = Insta::query_hash
      @child_comment_count = Insta::child_comment_count
      @authority = Insta::authority
      @cookie = Credentials.new.cookie
      @str1_markerstring = "/p/"
      @str2_markerstring = "/"
    end

    def execute
      results = []
      href_list.each_with_index do |code, index|
        code = string_between_markers(code, @str1_markerstring, @str2_markerstring)
        puts "code [#{index}] = #{code}"
        results.push(code: code, media_id: make_request(code))
      end
      results
    end

    def execute_delete
      href_list.each_with_index do |code, index|
        code = string_between_markers(code, @str1_markerstring, @str2_markerstring)
        puts "code [#{index}] = #{code}"
        Media::Delete.new.make_request(code, make_request(code))
      end
    end

    def string_between_markers(input_string, marker1, marker2)
      input_string[/#{marker1}(.*?)#{marker2}/m, 1]
    end

    def make_request(code)
      uri = URI.parse("#{@insta_uri}/?#{@query_hash}shortcode%22%3A%22#{code}%22%2C%22#{@child_comment_count}")

      request = mount_request(uri, code)

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      puts "CODE: #{response.code}"

      media_id = get_media_id(JSON.parse(response.body))

      puts "RESPONSE MEDIA ID: #{media_id}"

      media_id
    end

    def mount_request(uri, code)
      Request::Get.new(uri, code).execute
    end

    def get_media_id(response_json)
      response_json["data"]["shortcode_media"]["id"]
    end

    def href_list
      Media::List.medias
    end
  end
end
