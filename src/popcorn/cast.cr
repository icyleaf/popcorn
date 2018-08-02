require "./cast/*"

module Popcorn
  module Cast
    # Returns the target value or `Nil` represented by given data type.
    def cast?(raw : S, target : T.class) forall S, T
      case T
      when Int8.class    then to_int8?(raw)
      when Int16.class   then to_int16(raw)
      when Int32.class   then to_int32?(raw)
      when Int64.class   then to_int64?(raw)
      when UInt8.class   then to_uint8?(raw)
      when UInt16.class  then to_uint16(raw)
      when UInt32.class  then to_uint32?(raw)
      when UInt64.class  then to_uint64?(raw)
      when Float32.class then to_float32?(raw)
      when Float64.class then to_float64?(raw)
      when Bool.class    then to_bool?(raw)
      when Time.class    then to_time?(raw)
      when String.class  then raw.to_s
      else                    raw.as(T)
      end
    rescue TypeCastError
      nil
    end

    # Returns the target value represented by given data type.
    def cast(raw : S, target : T.class) forall S, T
      cast_error!(S.to_s, T.to_s) unless value = cast?(raw, target)
      value
    end

    # Raise a `TypeCastError` exception.
    def cast_error!(source : String, target : String)
      raise TypeCastError.new("cast from #{source} to #{target} failed.")
    end

    # Generate to `to_xxx` methods from `to_xxx?`.
    macro generate!
      {% begin %}
        {% for method in @type.methods %}
          {% if method.name.starts_with?("to_") %}
            # Returns the `{{ method.name.gsub(/^to_/, "").gsub(/\?$/, "").capitalize.gsub(/^Ui/, "UI").id }}` value represented by given data type.
            def {{ method.name.tr("?", "").id }}(raw : {{ method.args[0].restriction.id }}{% if method.name.starts_with?("to_time") %}, location : Time::Location? = nil, formatters : Array(String)? = nil{% end %})
              value = {{ method.name.id }}(raw{% if method.name.starts_with?("to_time") %}, location, formatters{% end %})
              cast_error!({{ method.args[0].restriction.id.stringify }}, {{ method.name.gsub(/^to_/, "").gsub(/\?$/, "").capitalize.gsub(/^Ui/, "UI").id.stringify }}) if value.nil?
              value
            end
          {% end %}
        {% end %}
      {% end %}
    end

    generate!
  end
end
