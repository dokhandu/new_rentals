# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable,
    :jwt_authenticatable,
    jwt_revocation_strategy: self
  )

  include Devise::JWT::RevocationStrategies::JTIMatcher

  belongs_to :role
  has_one :profile, dependent: :destroy
  has_one :subscription_plan, dependent: :destroy
  has_one :portal_setting, dependent: :destroy

  has_one(
    :profile_pic,
    -> { where(category: :avatar) },
    class_name: 'Attachment',
    as: :attachable,
    dependent: :destroy,
    inverse_of: :user
  )

  has_one(
    :profile_background,
    -> { where(category: :avatar_background) },
    class_name: 'Attachment',
    as: :attachable,
    dependent: :destroy,
    inverse_of: :user
  )

  enum status: { inactive: 0, active: 2 }

  accepts_nested_attributes_for(
    :profile,
    :subscription_plan,
    :portal_setting,
    allow_destroy: true
  )
end
