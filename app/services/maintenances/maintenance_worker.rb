# frozen_string_literal: true

module Maintenances
  class MaintenanceWorker < BaseService
    def call
      Maintenance.find_by(id: params[:id]).tap(&:working).save!
      true
    end
  end
end
