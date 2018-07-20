module Popcorn
  # :nodoc:
  module Injection
    CLASS_METHODS = [String]
    STRUCT_METHODS = [Int32, Int64, Float64, Bool]

    macro start
      {% for name in CLASS_METHODS %}
        Popcorn::Injection.inject({{ name.id }}, "class")
      {% end %}

      {% for name in STRUCT_METHODS %}
        Popcorn::Injection.inject({{ name.id }}, "struct")
      {% end %}
    end

    macro inject(name, type)
      {% begin %}
      # `{{ name.id }}` cast methods
      {{ type.id }} {{ name.id }}
        {% for method in Popcorn::Casting.methods %}
          # Alias to `Popcorn::Casting.{{ method.name.id }}`
          def {{ method.name.id }}
            Popcorn.{{ method.name.id }}(self)
          end
        {% end %}

        # Alias to `Object.to_s`
        def to_string
          to_s
        end
      end
      {% end %}
    end
  end
end

Popcorn::Injection.start
