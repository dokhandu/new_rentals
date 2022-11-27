# frozen_string_literal: true

class Tenant < ApplicationRecord
  include AASM
  include TenantState
  include Helpers::Tenant

  after_create :increment_unit_applicants, if: :incrementable?
  after_destroy :decrement_unit_applicants, if: :decrementable?

  belongs_to :property
  belongs_to :unit
  belongs_to :user

  has_many :maintenances, dependent: :destroy, inverse_of: :tenant

  enum state: { received: 0, interviewing: 5, accepted: 10, declined: 15 }

  def decrementable?
    received? || interviewing?
  end

  def incrementable?
    decrementable?
  end

  def decrement_unit_applicants
    return if unit.nos_of_applicants.negative? || unit.blank?

    unit.decrement!(:nos_of_applicants)
  end

  def increment_unit_applicants
    return if unit.blank?

    unit.increment!(:nos_of_applicants)
  end
end
