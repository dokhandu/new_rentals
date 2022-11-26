# frozen_string_literal: true

module TransitionCallbacks
  def after_processing
    ::TenantMailer.notify_tenant(tenant.id).deliver_now
  end

  def after_approving
    tenant.decrement_unit_applicants
  end

  def after_rejecting
    after_approving
  end
end
