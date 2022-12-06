# frozen_string_literal: true

module Maintenances
  class MaintenanceOnHolder < BaseService
    include TransitionCallbacks

    attr_accessor :maintenance

    def call
      @maintenance = Maintenance.find_by(id: params[:id]).tap(&:analyzing).save!
      maintenance.send(:after_analyzing) if respond_to?(:after_analyzing)
      true
    end
  end
end
