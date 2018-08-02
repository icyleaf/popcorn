module Popcorn::Cast
  # Alias to `to_int32?`
  def to_int?(raw : Nil)
    to_int32?(raw)
  end

  # Returns the `Int32` or `Nil` value represented by given Nil type.
  def to_int32?(raw : Nil)
    0
  end

  # Returns the `Int8` or `Nil` value represented by given Nil type.
  def to_int8?(raw : Nil)
    0_i8
  end

  # Returns the `Int16` or `Nil` value represented by given Nil type.
  def to_int16?(raw : Nil)
    0_i16
  end

  # Returns the `Int64` or `Nil` value represented by given Nil type.
  def to_int64?(raw : Nil)
    0_i64
  end

  # Returns the `UInt32` or `Nil` value represented by given Nil type.
  def to_uint?(raw : Nil)
    to_uint32?(raw)
  end

  # Alias to `to_uint?`
  def to_uint32?(raw : Nil)
    0_u32
  end

  # Returns the `Int8` or `Nil` value represented by given Nil type.
  def to_uint8?(raw : Nil)
    0_u8
  end

  # Returns the `UInt16` or `Nil` value represented by given Nil type.
  def to_uint16?(raw : Nil)
    0_u16
  end

  # Returns the `UInt64` or `Nil` value represented by given Nil type.
  def to_uint64?(raw : Nil)
    0_u64
  end

  # Returns the `Float64` or `Nil` value represented by given Nil type.
  def to_float?(raw : Nil)
    to_float64?(raw)
  end

  # Alias to `to_float64?`
  def to_float64?(raw : Nil)
    0.0
  end

  # Returns the `Float32` or `Nil` value represented by given Nil type.
  def to_float32?(raw : Nil)
    0.0_f32
  end

  # Returns the `Nil` value represented by given Nil type.
  #
  # - `location` argument applies for `Int`/`String` types
  # - `formatters` argument applies for `String` type.
  def to_time?(raw : Nil, location : Time::Location? = nil, formatters : Array(String)? = nil)
    nil
  end

  # Returns the `Bool` value represented by given Nil type.
  # It accepts true, t, yes, y, on, 1, false, f, no, n, off, 0. Any other value return an error.
  def to_bool?(raw : Nil)
    false
  end
end
