module CommentsHelper
  def submitted_time_ago(comment)
    ago = Time.now - comment.created_at
    ['second', 'minute', 'hour', 'day', 'month', 'year'].each_cons(2) do |smaller, bigger|
      if ago < 1.send(bigger)
        time = (ago / 1.send(smaller)).round
        return "submitted #{pluralize(time, smaller)} ago"
      end
    end
    years = (ago / 1.year).round
    return "submitted #{pluralize(years, 'year')} ago"
  end
end
