# frozen_string_literal: true

class TenantMailer < ApplicationMailer
  def notify_tenant(id)
    tenant = Tenant.find(id)
    @user_name = tenant.user.full_name
    @property = tenant.property.name
    mail(
      to: 'dk2+1@selise.ch',
      subject: 'New Rentals Request Approved' # rubocop:disable Rails/I18nLocaleTexts
    )
  end

  def notify_tenant_occupied(id)
    tenant = Tenant.find(id)
    @user_name = tenant.user.full_name
    @property = tenant.property.name

    mail(
      to: 'dk2+1@selise.ch',
      subject: 'New Rentals Unit Already Occupied' # rubocop:disable Rails/I18nLocaleTexts
    )
  end
end
