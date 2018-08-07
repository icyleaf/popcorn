module Popcorn
  # :nodoc:
  module Injection
    TARGETS = {
      "class"  => [String],
      "struct" => [
        Int8, Int16, Int32, Int64, UInt8, UInt16, UInt32, UInt64,
        Float64, Float32, Bool, Time, Symbol, JSON::Any, YAML::Any,
      ],
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
            {% margs = method.args[1..-1].map { |a| s = "#{a.name.id} : #{a.restriction.id}"; s = "#{s.id} = #{a.default_value}" if a.default_value == nil || a.default_value; s }.join(", ") %}
            {% rtype = method.args[0].restriction %}
            {% mtype = method.name.gsub(/^to_/, "").gsub(/\?$/, "").capitalize.gsub(/^Ui/, "UI") %}

            # Returns the `{{ mtype.id }}` value represented by given `{{ rtype.id }}` type, else raise a `TypeCastError` exception.
            def {{ method.name.id }}({{ margs.id }}){% if method.name.includes?("to_array") || method.name.includes?("to_hash") %} forall T{% end %}
              Popcorn.{{ method.name.id }}(self{% if method.args.size > 1 %}, {{ method.args[1..-1].map { |a| a.name }.join(", ").id }}{% end %})
            end
          {% end %}
        {% end %}

        # Alias to `Object.to_s`
        def to_string
          to_s
        end

        def cast?(other)
          Popcorn.cast?(self, other)
        end

        def cast(other)
          Popcorn.cast(self, other)
        end
      end
      {% end %}
    end
  end
end

Popcorn::Injection.start
