# frozen_string_literal: true

module Maintenances
  class MaintenanceConfirmer < BaseService
    def call
      Maintenance.find_by(id: params[:id]).tap(&:confirming).save!
      true
    end
  end
end
