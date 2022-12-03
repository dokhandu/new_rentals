# frozen_string_literal: true

class TenantMailer < ApplicationMailer
  def notify_tenant_interviewing(id)
    tenant = Tenant.find(id)
    @user = tenant.user
    @property = tenant.property

    mail(
      to: @user.email,
      subject: 'New Rentals: Interviewing' # rubocop:disable Rails/I18nLocaleTexts
    )
  end

  def notify_tenant_rejected(id)
    tenant = Tenant.find(id)
    @user = tenant.user
    @property = tenant.property

    mail(
      to: @user.email,
      subject: 'New Rentals: Approved' # rubocop:disable Rails/I18nLocaleTexts
    )
  end

  def notify_tenant(id)
    tenant = Tenant.find(id)
    @user = tenant.user
    @property = tenant.property

    mail(
      to: @user.email,
      subject: 'New Rentals: Request Approved' # rubocop:disable Rails/I18nLocaleTexts
    )
  end

  def notify_tenant_occupied(id)
    tenant = Tenant.find(id)
    @user = tenant.user
    @property = tenant.property

    mail(
      to: @user.email,
      subject: 'New Rentals: Already Occupied' # rubocop:disable Rails/I18nLocaleTexts
    )
  end
end
