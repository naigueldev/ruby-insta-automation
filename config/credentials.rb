class Credentials
  attr_accessor :cookie

  def initialize(cookie = nil)
    @cookie = cookie ? cookie : ""
  end

  def self.content_length
    "0"
  end

  def self.sec_ch_ua
    ""
  end

  def self.dnt
    "1"
  end

  def self.x_ig_www_claim
    ""
  end

  def self.x_ig_app_id
    ""
  end

  def self.sec_ch_ua_mobile
    "?0"
  end

  def self.x_instagram_ajax
    ""
  end

  def self.accept
    "*/*"
  end

  def self.x_requested_with
    "XMLHttpRequest"
  end

  def self.x_asbd_id
    ""
  end

  def self.user_agent
    ""
  end

  def self.x_csrftoken
    ""
  end

  def self.sec_ch_ua_platform
    ""
  end

  def self.origin
    ""
  end

  def self.sec_fetch_site
    ""
  end

  def self.sec_fetch_mode
    ""
  end

  def self.sec_fetch_dest
    ""
  end

  def self.referer(code = '')
    "https://www.instagram.com/p/#{code}/"
  end

  def self.accept_language
    ""
  end

  def self.authority
    "www.instagram.com"
  end
end
