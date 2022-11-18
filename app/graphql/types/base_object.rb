# frozen_string_literal: true

module Types
  class BaseObject < GraphQL::Schema::Object
    include GraphqlHelper

    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField

    protected

    def preload_association(object, association)
      AssociationLoader.for(object.class, association).load(object)
    end

    # def preload_attachment(object, attachment)
    #   ActiveStorageLoader.for(object.class, attachment).load(object)
    # end
  end
end
