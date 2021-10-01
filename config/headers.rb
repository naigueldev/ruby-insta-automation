class Headers
  def initialize(code = nil)
    @code = code
  end

  def get_set(request = nil)
    request["Authority"] = Credentials::authority
    request["Sec-Ch-Ua"] = Credentials::sec_ch_ua
    request["Dnt"] = Credentials::dnt
    request["X-Ig-Www-Claim"] = Credentials::x_ig_www_claim
    request["X-Ig-App-Id"] = Credentials::x_ig_app_id
    request["Sec-Ch-Ua-Mobile"] = Credentials::sec_ch_ua_mobile
    request["User-Agent"] = Credentials::user_agent
    request["Accept"] = Credentials::accept
    request["X-Requested-With"] = Credentials::x_requested_with
    request["X-Asbd-Id"] = Credentials::x_asbd_id
    request["X-Csrftoken"] = Credentials::x_csrftoken
    request["Sec-Ch-Ua-Platform"] = Credentials::sec_ch_ua_platform
    request["Sec-Fetch-Site"] = Credentials::sec_fetch_site
    request["Sec-Fetch-Mode"] = Credentials::sec_fetch_mode
    request["Sec-Fetch-Dest"] = Credentials::sec_fetch_dest
    request["Referer"] = Credentials::referer(@code)
    request["Accept-Language"] = Credentials::accept_language
    request["Cookie"] = Credentials.new.cookie
    request
  end

  def post_set(request = nil)
    request.content_type = "application/x-www-form-urlencoded"
    request["Authority"] = Credentials::authority
    request["Content-Length"] = Credentials::content_length
    request["Sec-Ch-Ua"] = Credentials::sec_ch_ua
    request["Dnt"] = Credentials::dnt
    request["X-Ig-Www-Claim"] = Credentials::x_ig_www_claim
    request["X-Ig-App-Id"] = Credentials::x_ig_app_id
    request["Sec-Ch-Ua-Mobile"] = Credentials::sec_ch_ua_mobile
    request["X-Instagram-Ajax"] = Credentials::x_instagram_ajax
    request["Accept"] = Credentials::accept
    request["X-Requested-With"] = Credentials::x_requested_with
    request["X-Asbd-Id"] = Credentials::x_asbd_id
    request["User-Agent"] = Credentials::user_agent
    request["X-Csrftoken"] = Credentials::x_csrftoken
    request["Sec-Ch-Ua-Platform"] = Credentials::sec_ch_ua_platform
    request["Origin"] = Credentials::origin
    request["Sec-Fetch-Site"] = Credentials::sec_fetch_site
    request["Sec-Fetch-Mode"] = Credentials::sec_fetch_mode
    request["Sec-Fetch-Dest"] = Credentials::sec_fetch_dest
    request["Referer"] = Credentials::referer(@code)
    request["Accept-Language"] = Credentials::accept_language
    request["Cookie"] = Credentials.new.cookie
    request
  end
end
