# frozen_string_literal: true

class TenantMailer < ApplicationMailer
  def notify_tenant(id)
    return

    @user_name = Tenant.find(id).user.full_name
    mail(
      to: 'sr@selise.ch',
      subject: 'New Rentals Request Approved' # rubocop:disable Rails/I18nLocaleTexts
    )
  end

  def notify_tenant_occupied(id)
    return

    @user_name = Tenant.find(id)
    mail(
      to: 'sr@selise.ch',
      subject: 'New Rentals Unit Already Occupied' # rubocop:disable Rails/I18nLocaleTexts
    )
  end
end
