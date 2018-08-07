require "json/any"

module Popcorn::Cast
  # Alias to `to_int32?`
  def to_int?(raw : JSON::Any)
    to_int32?(raw)
  end

  # Returns the `Int32` or `Nil` value represented by given JSON::Any type.
  def to_int32?(raw : JSON::Any)
    value = find(raw)
    to_int32?(value) unless value.nil?
  end

  # Returns the `Int8` or `Nil` value represented by given JSON::Any type.
  def to_int8?(raw : JSON::Any)
    value = find(raw)
    to_int8?(value) unless value.nil?
  end

  # Returns the `Int16` or `Nil` value represented by given JSON::Any type.
  def to_int16?(raw : JSON::Any)
    value = find(raw)
    to_int16?(value) unless value.nil?
  end

  # Returns the `Int64` or `Nil` value represented by given JSON::Any type.
  def to_int64?(raw : JSON::Any)
    value = find(raw)
    to_int64?(value) unless value.nil?
  end

  # Returns the `UInt32` or `Nil` value represented by given JSON::Any type.
  def to_uint?(raw : JSON::Any)
    to_uint32?(raw)
  end

  # Alias to `to_uint?`
  def to_uint32?(raw : JSON::Any)
    value = find(raw)
    to_uint32?(value) unless value.nil?
  end

  # Returns the `Int8` or `Nil` value represented by given JSON::Any type.
  def to_uint8?(raw : JSON::Any)
    value = find(raw)
    to_uint8?(value) unless value.nil?
  end

  # Returns the `UInt16` or `Nil` value represented by given JSON::Any type.
  def to_uint16?(raw : JSON::Any)
    value = find(raw)
    to_uint16?(value) unless value.nil?
  end

  # Returns the `UInt64` or `Nil` value represented by given JSON::Any type.
  def to_uint64?(raw : JSON::Any)
    value = find(raw)
    to_uint64?(value) unless value.nil?
  end

  # Returns the `Float64` or `Nil` value represented by given JSON::Any type.
  def to_float?(raw : JSON::Any)
    to_float64?(raw)
  end

  # Alias to `to_float64?`
  def to_float64?(raw : JSON::Any)
    value = find(raw)
    to_float64?(value) unless value.nil?
  end

  # Returns the `Float32` or `Nil` value represented by given JSON::Any type.
  def to_float32?(raw : JSON::Any)
    value = find(raw)
    to_float32?(value) unless value.nil?
  end

  # Returns the `Time` or `Nil` value represented by given JSON::Any type.
  #
  # - `location` argument applies for `Int`/`String` types
  # - `formatters` argument applies for `String` type.
  def to_time?(raw : JSON::Any, location : Time::Location? = nil, formatters : Array(String)? = nil)
    value = find(raw)
    to_time?(value, location, formatters) unless value.nil?
  end

  # Returns the `Bool` or `Nil` value represented by given JSON::Any type.
  # It accepts true, t, yes, y, on, 1, false, f, no, n, off, 0. Any other value return an error.
  def to_bool?(raw : JSON::Any)
    value = find(raw)
    to_bool?(value) unless value.nil?
  end

  # Returns the `Array` or `Nil` value represented by given JSON::Any type.
  def to_array?(raw : JSON::Any, value_type : T.class = String) forall T
    if data = raw.as_a?
      data.each_with_object(Array(T).new) do |v, obj|
        obj << cast(v.to_s, T).as(T)
      end
    elsif data = raw.as_h?
      data.each_with_object(Array(T).new) do |(k, v), obj|
        obj << cast(k.to_s, T).as(T) << cast(v.to_s, T).as(T)
      end
    else
      [cast(raw.to_s, T).as(T)]
    end
  end

  # Returns the `Hash` or `Nil` value represented by given JSON::Any type.
  def to_hash?(raw : JSON::Any, value_type : T.class = String) forall T
    return unless data = raw.as_h?
    data.each_with_object(Hash(String, T).new) do |(k, v), obj|
      obj[k.to_s] = cast(v, T).as(T)
    end
  end

  private def find(raw : JSON::Any)
    if value = raw.as_i64?
      return value
    end

    if value = raw.as_i?
      return value
    end

    if value = raw.as_f?
      return value
    end

    if value = raw.as_f32?
      return value
    end

    value = raw.as_bool?
    if !value.nil?
      return value
    end

    if value = raw.as_s?
      return value
    end
  end
end
