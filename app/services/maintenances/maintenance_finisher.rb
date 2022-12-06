# frozen_string_literal: true

module Maintenances
  class MaintenanceFinisher < BaseService
    def call
      Maintenance.find_by(id: params[:id]).tap(&:finishing).save!
      true
    end
  end
end
