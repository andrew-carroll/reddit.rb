require 'rails_helper'
include ActiveSupport::Testing::TimeHelpers

describe CommentsHelper do
  describe '#submitted_time_ago' do
    before(:example) { @comment = create(:comment) }
    ['second', 'minute', 'hour', 'day', 'month', 'year'].each do |time_unit|
      context "#{time_unit}s after creation" do
        it "returns a string detailing #{time_unit}s since creation" do
          age_string = "submitted 5 #{time_unit}s ago"
          travel 5.send("#{time_unit}s")
          time_ago = helper.submitted_time_ago(@comment)
        end
      end
    end
  end
end
