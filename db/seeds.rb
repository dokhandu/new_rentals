# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Role.create(
  [
    {
      role_name: :user
    },
    {
      role_name: :tenant
    },
    {
      role_name: :owner
    }
  ]
)


# Tenant.where(state: %i[received interviewing]).group_by(&:unit_id).each do |key, value|
#   nos = value.size
#   Unit.find(key).update!(nos_of_applicants: nos)
# end
