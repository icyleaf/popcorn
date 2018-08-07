module Popcorn::Cast
  # Alias to `to_int32?`
  def to_int?(raw : Float)
    to_int32?(raw)
  end

  # Returns the `Int32` or `Nil` value represented by given Float type.
  def to_int32?(raw : Float)
    raw.to_i32
  end

  # Returns the `Int8` or `Nil` value represented by given Float type.
  def to_int8?(raw : Float)
    raw.to_i8
  end

  # Returns the `Int16` or `Nil` value represented by given Float type.
  def to_int16?(raw : Float)
    raw.to_i16
  end

  # Returns the `Int64` or `Nil` value represented by given Float type.
  def to_int64?(raw : Float)
    raw.to_i64
  end

  # Returns the `UInt32` or `Nil` value represented by given Float type.
  def to_uint?(raw : Float)
    to_uint32?(raw)
  end

  # Alias to `to_uint?`
  def to_uint32?(raw : Float)
    raw.to_u32
  end

  # Returns the `Int8` or `Nil` value represented by given Float type.
  def to_uint8?(raw : Float)
    raw.to_u8
  end

  # Returns the `UInt16` or `Nil` value represented by given Float type.
  def to_uint16?(raw : Float)
    raw.to_u16
  end

  # Returns the `UInt64` or `Nil` value represented by given Float type.
  def to_uint64?(raw : Float)
    raw.to_u64
  end

  # Returns the `Float64` or `Nil` value represented by given Float type.
  def to_float?(raw : Float)
    to_float64?(raw)
  end

  # Alias to `to_float64?`
  def to_float64?(raw : Float)
    raw
  end

  # Returns the `Float32` or `Nil` value represented by given Float type.
  def to_float32?(raw : Float)
    raw.to_f32
  end

  # Returns the `Nil` value represented by given Float type.
  #
  # - `location` argument applies for `Int`/`String` types
  # - `formatters` argument applies for `String` type.
  def to_time?(raw : Float, location : Time::Location? = nil, formatters : Array(String)? = nil)
    nil
  end

  # Returns the `Bool` or `Nil` value represented by given Float type.
  # It accepts true, t, yes, y, on, 1, false, f, no, n, off, 0. Any other value return an error.
  def to_bool?(raw : Float)
    !raw.zero?
  end

  # Returns the `Array` or `Nil` value represented by given Float type.
  def to_array?(raw : Float, value_type : T.class = String) forall T
    [cast(raw, T).as(T)]
  end

  # Returns the `Hash` or `Nil` value represented by given Float type.
  def to_hash?(raw : Float, value_type : T.class = String) forall T
    nil
  end
end
