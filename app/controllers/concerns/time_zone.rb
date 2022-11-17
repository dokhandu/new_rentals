# frozen_string_literal: true

module TimeZone
  extend ActiveSupport::Concern

  included do
    around_action :time_zone
  end

  private

  def time_zone(&)
    Time.use_zone(request_time_zone, &)
  end

  def request_time_zone
    ActiveSupport::TimeZone[request.headers.fetch('x-time-zone', '')] || Time.zone
  end
end
