# frozen_string_literal: true

module TransitionCallbacks
  def after_processing
    return true

    ::TenantMailer.notify_tenant(tenant.id).deliver_now
  end

  def after_approving
    tenant.decrement_unit_applicants
    tenant.user.update!(role_id: 2)
  end

  def after_rejecting
    after_approving
  end
end
