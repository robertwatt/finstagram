class FinstagramPost < ActiveRecord::Base

    belongs_to :user
    has_many :comments
    has_many :likes

   validates :photo_url, :user, presence: true

  def humanized_time_ago
  time_ago_in_seconds = (Time.now - self.created_at).to_i
  case time_ago_in_seconds
    when 0..59 then "#{time_ago_in_seconds} seconds ago"       
    when 60..119 then "#{time_ago_in_seconds / 60} minute ago"
    when 120..3599 then "#{time_ago_in_seconds / 60} minutes ago"
    when 3600..7199 then "#{time_ago_in_seconds / 3600} hour ago"
    when 7200..86399 then "#{time_ago_in_seconds / 3600} hours ago"
    when 86400..172799 then "#{time_ago_in_seconds / 86400} day ago"
    else "#{time_ago_in_seconds / 86400} days ago"
  end
end

    def like_count
        self.likes.size
    end

    def comment_count
        self.comments.size
    end

end