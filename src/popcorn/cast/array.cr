module Popcorn::Cast
  # Alias to `to_int32?`
  def to_int?(raw : Array)
    to_int32?(raw)
  end

  # Returns the `Int32` or `Nil` value represented by given data type.
  def to_int32?(raw : Array)
    return Popcorn.to_int32?(raw.first) if raw.size == 1
  end

  # Returns the `Int8` or `Nil` value represented by given data type.
  def to_int8?(raw : Array)
    return Popcorn.to_int8?(raw.first) if raw.size == 1
  end

  # Returns the `Int16` or `Nil` value represented by given data type.
  def to_int16?(raw : Array)
    return Popcorn.to_int16?(raw.first) if raw.size == 1
  end

  # Returns the `Int64` or `Nil` value represented by given data type.
  def to_int64?(raw : Array)
    return Popcorn.to_int64?(raw.first) if raw.size == 1
  end

  # Returns the `UInt32` or `Nil` value represented by given data type.
  def to_uint?(raw : Array)
    to_uint32?(raw)
  end

  # Alias to `to_uint?`
  def to_uint32?(raw : Array)
    return Popcorn.to_uint32?(raw.first) if raw.size == 1
  end

  # Returns the `Int8` or `Nil` value represented by given data type.
  def to_uint8?(raw : Array)
    return Popcorn.to_uint8?(raw.first) if raw.size == 1
  end

  # Returns the `UInt16` or `Nil` value represented by given data type.
  def to_uint16?(raw : Array)
    return Popcorn.to_uint16?(raw.first) if raw.size == 1
  end

  # Returns the `UInt64` or `Nil` value represented by given data type.
  def to_uint64?(raw : Array)
    return Popcorn.to_uint64?(raw.first) if raw.size == 1
  end

  # Alias to `to_float64?`
  def to_float?(raw : Array)
    to_float64?(raw)
  end

  # Returns the `Float64` or `Nil` value represented by given data type.
  def to_float64?(raw : Array)
    return Popcorn.to_float64?(raw.first) if raw.size == 1
  end

  # Returns the `Float32` or `Nil` value represented by given data type.
  def to_float32?(raw : Array)
    return Popcorn.to_float32?(raw.first) if raw.size == 1
  end

  # Returns the `Time` or `Nil` value represented by given data type.
  #
  # - `location` argument applies for `Int`/`String` types
  # - `formatters` argument applies for `String` type.
  def to_time?(raw : Array, location : Time::Location? = nil, formatters : Array(String)? = nil)
    return Popcorn.to_time?(raw.first) if raw.size == 1
  end

  # Returns the `Bool` or `Nil` value represented by given data type.
  def to_bool?(raw : Array)
    !raw.size.zero?
  end
end
