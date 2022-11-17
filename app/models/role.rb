# frozen_string_literal: true

class Role < ApplicationRecord
  enum role_name: { user: 0, tenant: 2, owner: 4 }
end
