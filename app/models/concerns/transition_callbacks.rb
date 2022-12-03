# frozen_string_literal: true

module TransitionCallbacks
  # Tenant
  def after_processing
    ::TenantMailer.notify_tenant(tenant.id).deliver_now
  end

  def after_approving
    tenant.decrement_unit_applicants
    tenant.user.update!(role_id: 2)
  end

  def after_rejecting
    tenant.decrement_unit_applicants
  end

  # Maintenance

  def after_analyzing
    return
    
    tenant = maintenance.tenant
  end
end
