# frozen_string_literal: true

module Maintenances
  class MaintenanceOnHolder < BaseService
    def call
      Maintenance.find_by(id: params[:id]).tap(&:analyzing).save!
      true
    end
  end
end
