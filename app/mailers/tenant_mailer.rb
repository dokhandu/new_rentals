# frozen_string_literal: true

class TenantMailer < ApplicationMailer
  def notify_tenant(id)
    @user_name = Tenant.find(id).user.full_name
    mail(
      to: email_address_with_name('dk2+45@selise.ch', 'Dorji Khandu'),
      subject: 'Request Approved'
    )
  end
end
