require "json/any"
require "yaml/any"
require "./ext/*"

module Popcorn
  module Cast
    # Returns the `Int32` or `Nil` value represented by given data type.
    def to_int?(v : T) forall T
      case v
      when Int
        v.as(Int).to_i
      when Float
        v.as(Float).to_i
      when Bool
        v.as(Bool) ? 1 : 0
      when Nil
        0
      when JSON::Any, YAML::Any
        value = parse_any_value(v)
        to_int?(value) unless value.nil?
      when String
        value = v.as(String).to_i?(strict: false)
        value ? value : 0
      end
    end

    # Alias to `to_int?`
    def to_int32?(v : T) forall T
      to_int?(v)
    end

    # Returns the `Int8` or `Nil` value represented by given data type.
    def to_int8?(v : T) forall T
      case v
      when Int
        v.as(Int).to_i8
      when Float
        v.as(Float).to_i8
      when Bool
        v.as(Bool) ? 1_i8 : 0_i8
      when Nil
        0_i8
      when JSON::Any, YAML::Any
        value = parse_any_value(v)
        to_int8?(value) unless value.nil?
      when String
        value = v.as(String).to_i8?(strict: false)
        value ? value : 0
      end
    end

    # Returns the `Int16` or `Nil` value represented by given data type.
    def to_int16?(v : T) forall T
      case v
      when Int
        v.as(Int).to_i16
      when Float
        v.as(Float).to_i16
      when Bool
        v.as(Bool) ? 1_i16 : 0_i16
      when Nil
        0_i16
      when JSON::Any, YAML::Any
        value = parse_any_value(v)
        to_int16?(value) unless value.nil?
      when String
        value = v.as(String).to_i16?(strict: false)
        value ? value : 0
      end
    end

    # Returns the `Int64` or `Nil` value represented by given data type.
    def to_int64?(v : T) forall T
      case v
      when Int
        v.as(Int).to_i64
      when Float
        v.as(Float).to_i64
      when Bool
        v.as(Bool) ? 1_i64 : 0_i64
      when Nil
        0_i64
      when JSON::Any, YAML::Any
        value = parse_any_value(v)
        to_int64?(value) unless value.nil?
      when String
        value = v.as(String).to_i64?(strict: false)
        value ? value : 0
      end
    end

    # Returns the `UInt32` or `Nil` value represented by given data type.
    def to_uint?(v : T) forall T
      case v
      when Int
        v.as(Int).to_u
      when Float
        v.as(Float).to_u
      when Bool
        v.as(Bool) ? 1_u32 : 0_u32
      when Nil
        0_u32
      when JSON::Any, YAML::Any
        value = parse_any_value(v)
        to_int?(value) unless value.nil?
      when String
        value = v.as(String).to_i?(strict: false)
        value ? value : 0
      end
    end

    # Alias to `to_uint?`
    def to_uint32?(v : T) forall T
      to_int?(v)
    end

    # Returns the `Int8` or `Nil` value represented by given data type.
    def to_uint8?(v : T) forall T
      case v
      when Int
        v.as(Int).to_u8
      when Float
        v.as(Float).to_u8
      when Bool
        v.as(Bool) ? 1_u8 : 0_u8
      when Nil
        0_u8
      when JSON::Any, YAML::Any
        value = parse_any_value(v)
        to_uint8?(value) unless value.nil?
      when String
        value = v.as(String).to_u8?(strict: false)
        value ? value : 0
      end
    end

    # Returns the `UInt16` or `Nil` value represented by given data type.
    def to_uint16?(v : T) forall T
      case v
      when Int
        v.as(Int).to_u16
      when Float
        v.as(Float).to_u16
      when Bool
        v.as(Bool) ? 1_u16 : 0_u16
      when Nil
        0_u16
      when JSON::Any, YAML::Any
        value = parse_any_value(v)
        to_uint16?(value) unless value.nil?
      when String
        value = v.as(String).to_u16?(strict: false)
        value ? value : 0
      end
    end

    # Returns the `UInt64` or `Nil` value represented by given data type.
    def to_uint64?(v : T) forall T
      case v
      when Int
        v.as(Int).to_u64
      when Float
        v.as(Float).to_u64
      when Bool
        v.as(Bool) ? 1_u64 : 0_u64
      when Nil
        0_u64
      when JSON::Any, YAML::Any
        value = parse_any_value(v)
        to_uint64?(value) unless value.nil?
      when String
        value = v.as(String).to_u64?(strict: false)
        value ? value : 0
      end
    end

    # Returns the `Float64` or `Nil` value represented by given data type.
    def to_float?(v : T) forall T
      case v
      when Int
        v.as(Int).to_f
      when Float
        v.as(Float).to_f
      when Nil
        0
      when JSON::Any, YAML::Any
        value = parse_any_value(v)
        to_float?(value) unless value.nil?
      when String
        value = v.as(String).to_f?(strict: false)
        value ? value : 0
      end
    end

    # Alias to `to_float64?`
    def to_float64?(v : T) forall T
      to_float64?(v)
    end

    # Returns the `Float32` or `Nil` value represented by given data type.
    def to_float32?(v : T) forall T
      case v
      when Int
        v.as(Int).to_f32
      when Float
        v.as(Float).to_f32
      when Nil
        0
      when JSON::Any, YAML::Any
        value = parse_any_value(v)
        to_float32?(value) unless value.nil?
      when String
        value = v.as(String).to_f32?(strict: false)
        value ? value : 0
      end
    end

    # Returns the `Time` or `Nil` value represented by given data type.
    #
    # - `location` argument applies for `Int`/`String` types
    # - `formatters` argument applies for `String` type.
    def to_time?(v : T, location : Time::Location? = nil, formatters : Array(String)? = nil) forall T
      case v
      when Time
        value = v.as(Time)
      when Int
        value = v.as(Int).to_i64
        if Math.log10(value) > 10
          location ? Time.epoch_ms(value, location: location) : Time.epoch_ms(value)
        else
          location ? Time.epoch(value, location: location) : Time.epoch(value)
        end
      when JSON::Any, YAML::Any
        value = parse_any_value(v)
        to_time?(value, location, formatters) unless value.nil?
      when String
        parse_time(v.as(String), location, formatters)
      end
    end

    # Returns the `Bool` or `Nil` value represented by given data type.
    # It accepts true, t, yes, y, on, 1, false, f, no, n, off, 0. Any other value return an error.
    def to_bool?(v : T) forall T
      case v
      when Bool
        v.as(Bool)
      when Int
        !v.as(Int).zero?
      when Float
        !v.as(Float).zero?
      when Nil
        false
      when Symbol
        to_bool?(v.as(Symbol).to_s)
      when JSON::Any, YAML::Any
        value = parse_any_value(v)
        to_bool?(value) unless value.nil?
      when String
        object = v.as(String).downcase
        if %w(true t yes y on 1).includes?(object)
          true
        elsif %w(false f no n off 0).includes?(object)
          false
        end
      end
    end

    {% begin %}
      {% for method in @type.methods %}
        # Returns the `{{ method.name.gsub(/^to_/, "").gsub(/\?$/, "").capitalize.gsub(/^Ui/, "UI").id }}` value represented by given data type.
        def {{ method.name.tr("?", "").id }}(v : T{% if method.name.starts_with?("to_time") %}, location : Time::Location? = nil, formatters : Array(String)? = nil{% end %}) forall T
          value = {{ method.name.id }}(v{% if method.name.starts_with?("to_time") %}, location, formatters{% end %})
          raise_error!(T.to_s, {{ method.name.gsub(/^to_/, "").gsub(/\?$/, "").capitalize.gsub(/^Ui/, "UI").id.stringify }}) if value.nil?
          value
        end
      {% end %}
    {% end %}

    def raise_error!(source : String, target : String)
      raise TypeCastError.new("cast from #{source} to #{target} failed.")
    end

    private def parse_time(v : String, location : Time::Location? = nil, formatters : Array(String)? = nil)
      location ||= Time::Location::UTC
      formatters = formatters ? formatters.not_nil!.concat(time_formatters) : time_formatters
      formatters.each do |formatter|
        begin
          return Time.parse(v, formatter, location)
        rescue Time::Format::Error
          next
        end
      end
    end

    private def time_formatters
      [
        "%a, %d %b %Y %T %z", # RFC 1123Z eg, Tue, 20 Jan 2018 01:20:33 +0800
        "%a, %d %b %Y %T",    # RFC 1123 eg, Tue, 20 Jan 2018 01:20:33 GMT
        "%A, %d-%b-%y %T",    # RFC 850 eg, Tuesday, 14-Feb-16 01:20:33 GMT
        "%d %b %y %H:%M %z",  # RFC 822Z 20 Jan 18 01:20 +0800
        "%d %b %y %H:%M",     # RFC 822 20 Jan 18 01:20 UTC
        "%a %b %d %T %z %Y",  # RubyDate
        "%a %b %d %T %Y",     # ANSIC/UnixDate
        "%FT%T%:z",           # ISO 8601 eg 2018-01-20T01:20:33Z+08:00
        "%F %T %z",           # RFC 3339
        "%FT%TZ",             # RFC 3339 nano
        "%F %H:%M:%S.%9N",    # Date Time Nano, eg 2018-01-20 01:20:33.000000000
        "%F %H:%M:%S.%6N",    # Date Time Macro, eg 2018-01-20 01:20:33.000000
        "%F %H:%M:%S.%3N",    # Date Time Milli, eg 2018-01-20 01:20:33.000
        "%F %T",              # Date Time, eg 2018-01-20 01:20:33
        "%F",                 # Date, eg 2018-01-20
        "%d %b %Y",           # Date, eg 20 Jan 2018
      ]
    end

    private def parse_any_value(v : JSON::Any | YAML::Any)
      case v
      when JSON::Any
        object = v.as(JSON::Any)

        if value = object.as_i64?
          return value
        end

        if value = object.as_i?
          return value
        end

        if value = object.as_f?
          return value
        end

        if value = object.as_f32?
          return value
        end

        value = object.as_bool?
        if !value.nil?
          return value
        end

        if value = object.as_s?
          return value
        end
      else
        object = v.as(YAML::Any)

        if value = object.as_i64?
          return value
        end

        if value = object.as_i?
          return value
        end

        if value = object.as_f?
          return value
        end

        if value = object.as_time?
          return value
        end

        # Fix YAML::Any.new(raw: _)
        if object.raw.is_a?(Bool)
          return object.raw.as(Bool)
        end

        if value = object.as_s?
          return value
        end
      end
    end
  end
end