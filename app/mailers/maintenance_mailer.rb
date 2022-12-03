# frozen_string_literal: true

class MaintenanceMailer < ApplicationMailer
  def notify_on_hold(id)
    @user_name = Tenant.find(id).user.full_name
    mail(
      to: 'sr@selise.ch',
      subject: 'New Rentals Request Approved' # rubocop:disable Rails/I18nLocaleTexts
    )
  end
end
