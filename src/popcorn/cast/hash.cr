module Popcorn::Cast
  # Alias to `to_int32?`
  def to_int?(raw : Hash)
    to_int32?(raw)
  end

  # Returns the `Int32` or `Nil` value represented by given data type.
  def to_int32?(raw : Hash)
    nil
  end

  # Returns the `Int8` or `Nil` value represented by given data type.
  def to_int8?(raw : Hash)
    nil
  end

  # Returns the `Int16` or `Nil` value represented by given data type.
  def to_int16?(raw : Hash)
    nil
  end

  # Returns the `Int64` or `Nil` value represented by given data type.
  def to_int64?(raw : Hash)
    nil
  end

  # Returns the `UInt32` or `Nil` value represented by given data type.
  def to_uint?(raw : Hash)
    to_uint32?(raw)
  end

  # Alias to `to_uint?`
  def to_uint32?(raw : Hash)
    nil
  end

  # Returns the `Int8` or `Nil` value represented by given data type.
  def to_uint8?(raw : Hash)
    nil
  end

  # Returns the `UInt16` or `Nil` value represented by given data type.
  def to_uint16?(raw : Hash)
    nil
  end

  # Returns the `UInt64` or `Nil` value represented by given data type.
  def to_uint64?(raw : Hash)
    nil
  end

  # Alias to `to_float64?`
  def to_float?(raw : Hash)
    to_float64?(raw)
  end

  # Returns the `Float64` or `Nil` value represented by given data type.
  def to_float64?(raw : Hash)
    nil
  end

  # Returns the `Float32` or `Nil` value represented by given data type.
  def to_float32?(raw : Hash)
    nil
  end

  # Returns the `Time` or `Nil` value represented by given data type.
  #
  # - `location` argument applies for `Int`/`String` types
  # - `formatters` argument applies for `String` type.
  def to_time?(raw : Array, location : Time::Location? = nil, formatters : Array(String)? = nil)
    nil
  end

  # Returns the `Bool` or `Nil` value represented by given data type.
  def to_bool?(raw : Hash)
    !raw.size.zero?
  end
end
