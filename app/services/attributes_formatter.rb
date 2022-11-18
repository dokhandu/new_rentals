# frozen_string_literal: true

module AttributesFormatter
  # Picks up key value definitions from nested_attributes.yml
  # FE sends nested requests without _attributes suffix.
  #
  # Eg.
  #   - { email: 'sofia@hey.com', profile: { id: 11, firstname: 'Sophie' } }
  #   gets formatted to
  #   - { email: 'sofia@hey.com', profile_attributes: { id: 11, firstname: 'Sophie' } }
  #
  def format_attributes!(key)
    NESTED_ATTRIBUTES[key].each do |value|
      next unless params[value]

      params["#{value}_attributes".to_sym] = params.delete(value)
    end
  end
end
