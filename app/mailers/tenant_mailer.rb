# frozen_string_literal: true

class TenantMailer < ApplicationMailer
  def notify_tenant(id)
    @user_name = Tenant.find(id).user.full_name
    mail(
      to: 'sr@selise.ch',
      subject: 'New Rentals Request Approved'
    )
  end

  private

  def tenant
    @tenant = Tenant.find(id)
  end
end
