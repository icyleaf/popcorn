module Popcorn::Cast
  # Alias to `to_int32?`
  def to_int?(raw : Bool)
    to_int32?(raw)
  end

  # Returns the `Int32` or `Nil` value represented by given Bool type.
  def to_int32?(raw : Bool)
    raw ? 1 : 0
  end

  # Returns the `Int8` or `Nil` value represented by given Bool type.
  def to_int8?(raw : Bool)
    raw ? 1_i8 : 0_i8
  end

  # Returns the `Int16` or `Nil` value represented by given Bool type.
  def to_int16?(raw : Bool)
    raw ? 1_i8 : 0_i16
  end

  # Returns the `Int64` or `Nil` value represented by given Bool type.
  def to_int64?(raw : Bool)
    raw ? 1_i8 : 0_i64
  end

  # Returns the `UInt32` or `Nil` value represented by given Bool type.
  def to_uint?(raw : Bool)
    to_uint32?(raw)
  end

  # Alias to `to_uint?`
  def to_uint32?(raw : Bool)
    raw ? 1_i8 : 0_u32
  end

  # Returns the `Int8` or `Nil` value represented by given Bool type.
  def to_uint8?(raw : Bool)
    raw ? 1_i8 : 0_u8
  end

  # Returns the `UInt16` or `Nil` value represented by given Bool type.
  def to_uint16?(raw : Bool)
    raw ? 1_i8 : 0_u16
  end

  # Returns the `UInt64` or `Nil` value represented by given Bool type.
  def to_uint64?(raw : Bool)
    raw ? 1_i8 : 0_u64
  end

  # Returns the `Float64` or `Nil` value represented by given Bool type.
  def to_float?(raw : Bool)
    to_float64?(raw)
  end

  # Alias to `to_float64?`
  def to_float64?(raw : Bool)
    nil
  end

  # Returns the `Nil` value represented by given Bool type.
  def to_float32?(raw : Bool)
    nil
  end

  # Returns the `Nil` value represented by given Bool type.
  #
  # - `location` argument applies for `Int`/`String` types
  # - `formatters` argument applies for `String` type.
  def to_time?(raw : Bool, location : Time::Location? = nil, formatters : Array(String)? = nil)
    nil
  end

  # Returns the `Bool` value represented by given Bool type.
  # It accepts true, t, yes, y, on, 1, false, f, no, n, off, 0. Any other value return an error.
  def to_bool?(raw : Bool)
    raw
  end

  # Returns the `Array` or `Nil` value represented by given Bool type.
  def to_array?(raw : Bool, value_type : T.class = String) forall T
    [cast(raw, T).as(T)]
  end

  # Returns the `Hash` or `Nil` value represented by given Bool type.
  def to_hash?(raw : Bool, value_type : T.class = String) forall T
    nil
  end
end
