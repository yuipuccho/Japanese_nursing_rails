module V1
  class ActivitiesController < ApplicationController
    before_action :authenticated!

    def index
      learning_histories = current_user.learning_histories.one_weeks.group('date(created_at)').count.map { |i| [i.first.to_time, i.second] }
      test_histories = current_user.test_histories.one_weeks.group('date(created_at)').count.map { |i| [i.first.to_time, i.second] }
      @activity_data = create_one_week_activity(learning_histories, test_histories)
      render 'api/v1/activities/index', handlers: 'jbuilder'
    end

    private

    def create_one_week_activity(learning_histories, test_histories)
      one_weeks = (0..6).to_a.map {|i| (Time.now.beginning_of_day - i.days) }
      data = []
      one_weeks.each do |day|
        learned = learning_histories.select { |ary| ary.first == day }
        tested = test_histories.select { |ary| ary.first == day }
        data << {
          date: day,
          learned_count: learned.blank? ? 0 : learned.first.second,
          tested_count: tested.blank? ? 0 : tested.first.second
        }
      end
      data
    end
  end
end
