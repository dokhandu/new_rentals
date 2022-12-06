# frozen_string_literal: true

class MaintenanceMailer < ApplicationMailer
  def notify_received(id)
    maintenance = Maintenance.find(id)
    tenant = maintenance.tenant
    @user = tenant.user

    mail(
      to: @user.email,
      subject: 'Maintenance Request: Received' # rubocop:disable Rails/I18nLocaleTexts
    )
  end
end
