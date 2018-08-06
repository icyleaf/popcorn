require "yaml/any"

module Popcorn::Cast
  # Alias to `to_int32?`
  def to_int?(raw : YAML::Any)
    to_int32?(raw)
  end

  # Returns the `Int32` or `Nil` value represented by given YAML::Any type.
  def to_int32?(raw : YAML::Any)
    value = as_value(raw)
    to_int?(value) unless value.nil?
  end

  # Returns the `Int8` or `Nil` value represented by given YAML::Any type.
  def to_int8?(raw : YAML::Any)
    value = as_value(raw)
    to_int8?(value) unless value.nil?
  end

  # Returns the `Int16` or `Nil` value represented by given YAML::Any type.
  def to_int16?(raw : YAML::Any)
    value = as_value(raw)
    to_int16?(value) unless value.nil?
  end

  # Returns the `Int64` or `Nil` value represented by given YAML::Any type.
  def to_int64?(raw : YAML::Any)
    value = as_value(raw)
    to_int64?(value) unless value.nil?
  end

  # Returns the `UInt32` or `Nil` value represented by given YAML::Any type.
  def to_uint?(raw : YAML::Any)
    to_uint32?(raw)
  end

  # Alias to `to_uint?`
  def to_uint32?(raw : YAML::Any)
    value = as_value(raw)
    to_uint32?(value) unless value.nil?
  end

  # Returns the `Int8` or `Nil` value represented by given YAML::Any type.
  def to_uint8?(raw : YAML::Any)
    value = as_value(raw)
    to_uint8?(value) unless value.nil?
  end

  # Returns the `UInt16` or `Nil` value represented by given YAML::Any type.
  def to_uint16?(raw : YAML::Any)
    value = as_value(raw)
    to_uint16?(value) unless value.nil?
  end

  # Returns the `UInt64` or `Nil` value represented by given YAML::Any type.
  def to_uint64?(raw : YAML::Any)
    value = as_value(raw)
    to_uint64?(value) unless value.nil?
  end

  # Alias to `to_float64?`
  def to_float?(raw : YAML::Any)
    to_float64?(raw)
  end

  # Returns the `Float64` or `Nil` value represented by given YAML::Any type.
  def to_float64?(raw : YAML::Any)
    value = as_value(raw)
    to_float64?(value) unless value.nil?
  end

  # Returns the `Float32` or `Nil` value represented by given YAML::Any type.
  def to_float32?(raw : YAML::Any)
    value = as_value(raw)
    to_float32?(value) unless value.nil?
  end

  # Returns the `Time` or `Nil` value represented by given YAML::Any type.
  #
  # - `location` argument applies for `Int`/`String` types
  # - `formatters` argument applies for `String` type.
  def to_time?(raw : YAML::Any, location : Time::Location? = nil, formatters : Array(String)? = nil)
    value = as_value(raw)
    to_time?(value, location, formatters) unless value.nil?
  end

  # Returns the `Bool` or `Nil` value represented by given YAML::Any type.
  # It accepts true, t, yes, y, on, 1, false, f, no, n, off, 0. Any other value return an error.
  def to_bool?(raw : YAML::Any)
    value = as_value(raw)
    to_bool?(value) unless value.nil?
  end

  # Returns the `Array` or `Nil` value represented by given YAML::Any type.
  def to_array?(raw : YAML::Any, value_type : T.class = String) forall T
    return unless data = raw.as_a?
    data.each_with_object(Array(T).new) do |v, obj|
      obj << cast(v, T).as(T)
    end
  end

  # Returns the `Hash` or `Nil` value represented by given YAML::Any type.
  def to_hash?(raw : YAML::Any, value_type : T.class = String) forall T
    return unless data = raw.as_h?
    data.each_with_object(Hash(String, T).new) do |(k, v), obj|
      obj[k.to_s] = cast(v, T).as(T)
    end
  end

  private def as_value(raw : YAML::Any)
    if value = raw.as_i64?
      return value
    end

    if value = raw.as_i?
      return value
    end

    if value = raw.as_f?
      return value
    end

    if value = raw.as_time?
      return value
    end

    # Fix YAML::Any.new(raw: _)
    if raw.raw.is_a?(Bool)
      return raw.raw.as(Bool)
    end

    if value = raw.as_s?
      return value
    end
  end
end
