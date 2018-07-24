module Popcorn
  # :nodoc:
  module Injection
    TARGETS = {
      "class" => [String],
      "struct"  => [Int8, Int16, Int32, Int64, Float64, Float32, Bool, Time, Symbol],
    }
    macro start
      {% for type, ivars in TARGETS %}
        {% for ivar in ivars %}
          Popcorn::Injection.inject({{ ivar.id }}, {{ type.id.stringify }})
        {% end %}
      {% end %}
    end

    macro inject(name, type)
      {% begin %}
      # `{{ name.id }}` cast methods
      {{ type.id }} {{ name.id }}
        {% for method in Popcorn::Cast.methods %}
          # Alias to `Popcorn::Cast.{{ method.name.id }}`
          {% if method.name.starts_with?("to_") %}
            {% if method.name.starts_with?("to_time") %}
              def {{ method.name.id }}(location : Time::Location = Time::Location::UTC, formatters : Array(String)? = nil)
                Popcorn.{{ method.name.id }}(self, location, formatters)
              end
            {% else %}
              def {{ method.name.id }}
                Popcorn.{{ method.name.id }}(self)
              end
            {% end %}
          {% end %}
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
