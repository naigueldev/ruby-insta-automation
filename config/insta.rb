class Insta
  def self.uri
    "https://www.instagram.com/graphql/query"
  end

  def self.query_hash(hash = "")
    "query_hash=#{hash}&variables=%7B%22"
  end

  def self.child_comment_count
    "child_comment_count%22%3A3%2C%22fetch_comment_count%22%3A40%2C%22parent_comment_count%22%3A24%2C%22has_threaded_comments%22%3Atrue%7D"
  end
end
