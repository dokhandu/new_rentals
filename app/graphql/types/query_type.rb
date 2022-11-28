# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Users
    field :users, resolver: Queries::Users
    field :user, resolver: Queries::User

    # Units
    field :units, resolver: Queries::Units
    field :unit, resolver: Queries::Unit

    # Property
    field :property, resolver: Queries::Property
    field :properties, resolver: Queries::Properties

    # Tenant
    field :tenant, resolver: Queries::Tenant
    field :tenants, resolver: Queries::Tenants

    # Maintenance
    # field :maintenance, resolve: Queries::Maintenance
    # field :maintenances, resolver: Queries::Maintenances
  end
end
