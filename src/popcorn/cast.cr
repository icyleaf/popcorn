require "./cast/*"

module Popcorn
  module Cast
    # def cast?(raw, other : Int8.class) : Int8?
    #   to_int8?(raw)
    # end

    # def cast?(raw, other : Int16.class) : Int16?
    #   to_int16?(raw)
    # end

    # def cast?(raw, other : Int32.class) : Int32?
    #   to_int32?(raw)
    # end

    # def cast?(raw, other : Int64.class) : Int64?
    #   to_int64?(raw)
    # end

    # def cast?(raw, other : UInt8.class) : UInt8?
    #   to_uint8?(raw)
    # end

    # def cast?(raw, other : UInt16.class) : UInt16?
    #   to_uint16?(raw)
    # end

    # def cast?(raw, other : UInt32.class) : UInt32?
    #   to_uint32?(raw)
    # end

    # def cast?(raw, other : UInt64.class) : UInt64?
    #   to_uint64?(raw)
    # end

    # def cast?(raw, other : Float32.class) : Float32?
    #   to_float32?(raw)
    # end

    # def cast?(raw, other : Float64.class) : Float64?
    #   to_float64?(raw)
    # end

    # def cast?(raw, other : Bool.class) : Bool?
    #   to_bool?(raw)
    # end

    # def cast?(raw, other : Time.class) : Time?
    #   to_time?(raw)
    # end

    # def cast?(raw, other : String.class) : String
    #   raw.to_s
    # end

    # def cast?(raw, other : Array.class) : Array(String)
    #   raw.to_array?(raw)
    # end

    # def cast?(raw, other : Hash.class) : Hash(String, String)
    #   raw.to_hash?(raw)
    # end

    # Returns the target value or `Nil` represented by given data type.
    def cast?(raw, other)
      case other
      when Int8.class    then to_int8?(raw)
      when Int16.class   then to_int16?(raw)
      when Int32.class   then to_int32?(raw)
      when Int64.class   then to_int64?(raw)
      when UInt8.class   then to_uint8?(raw)
      when UInt16.class  then to_uint16?(raw)
      when UInt32.class  then to_uint32?(raw)
      when UInt64.class  then to_uint64?(raw)
      when Float32.class then to_float32?(raw)
      when Float64.class then to_float64?(raw)
      when Bool.class    then to_bool?(raw)
      when Time.class    then to_time?(raw)
      when Array.class   then to_array?(raw)
      when Hash.class    then to_hash?(raw)
      when String.class  then raw.to_s
      end
    rescue TypeCastError
      nil
    end

    # Returns the target value represented by given data type.
    def cast(raw, other)
      cast_error!(raw.class.to_s, other.to_s) unless value = cast?(raw, other)
      value
    end

    # Raise a `TypeCastError` exception.
    def cast_error!(source : String, other : String)
      raise TypeCastError.new("cast from #{source} to #{other} failed.")
    end

    # Generate to `to_xxx` methods from `to_xxx?`.
    macro generate!
      {% begin %}
        {% for method in @type.methods %}
          {% if method.name.starts_with?("to_") %}
            {% mname = method.name.tr("?", "") %}
            {% margs = method.args.map { |a| s = "#{a.name.id} : #{a.restriction.id}"; s = "#{s.id} = #{a.default_value}" if a.default_value == nil || a.default_value; s }.join(", ") %}
            {% rtype = method.args[0].restriction %}
            {% mtype = method.name.gsub(/^to_/, "").gsub(/\?$/, "").capitalize.gsub(/^Ui/, "UI") %}

            {% if @type.methods.select {|m| m.name.id == mname.id && m.args[0].restriction.id == rtype.id }.size == 0 %}
              # Returns the `{{ mtype.id }}` value represented by given `{{ rtype.id }}` type, else raise a `TypeCastError` exception.
              def {{ mname.id }}({{ margs.id }}){% if mname.includes?("to_array") || mname.includes?("to_hash") %} forall T{% end %}
                value = {{ method.name }}({{ method.args.map { |a| a.name }.join(", ").id }})
                cast_error!({{ rtype.id.stringify }}, {{ mtype.id.stringify }}) if value.nil?
                value
              end
            {% end %}

            {% if @type.methods.select {|m| m.name.id == "to_string".id && m.args[0].restriction.id == rtype.id }.size == 0 %}
              def to_string({{ method.args[0].name.id }} : {{ method.args[0].restriction.id }})
                {{ method.args[0].name.id }}.to_s
              end
            {% end %}
          {% end %}
        {% end %}
      {% end %}
    end

    generate!
  end
end
