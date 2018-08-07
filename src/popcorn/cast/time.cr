module Popcorn::Cast
  # Alias to `to_int32?`
  def to_int?(raw : Time)
    to_int32?(raw)
  end

  # Returns the `Nil` value represented by given Time type.
  def to_int32?(raw : Time)
    nil
  end

  # Returns the `Nil` value represented by given Time type.
  def to_int8?(raw : Time)
    nil
  end

  # Returns the `Nil` value represented by given Time type.
  def to_int16?(raw : Time)
    nil
  end

  # Returns the `Int64` or `Nil` value represented by given Time type.
  def to_int64?(raw : Time)
    raw.epoch
  end

  # Returns the `UInt32` or `Nil` value represented by given Time type.
  def to_uint?(raw : Time)
    to_uint32?(raw)
  end

  # Alias to `to_uint?`
  def to_uint32?(raw : Time)
    nil
  end

  # Returns the `Nil` value represented by given Time type.
  def to_uint8?(raw : Time)
    nil
  end

  # Returns the `Nil` value represented by given Time type.
  def to_uint16?(raw : Time)
    nil
  end

  # Returns the `UInt64` or `Nil` value represented by given Time type.
  def to_uint64?(raw : Time)
    raw.epoch
  end

  # Returns the `Float64` or `Nil` value represented by given Time type.
  def to_float?(raw : Time)
    to_float64?(raw)
  end

  # Alias to `to_float64?`
  def to_float64?(raw : Time)
    raw.epoch_f
  end

  # Returns the `Nil` value represented by given Time type.
  def to_float32?(raw : Time)
    nil
  end

  # Returns the `Time` or `Nil` value represented by given Time type.
  #
  # - `location` argument applies for `Int`/`String` types
  # - `formatters` argument applies for `String` type.
  def to_time?(raw : Time, location : Time::Location? = nil, formatters : Array(String)? = nil)
    raw
  end

  # Returns the `Nil` value represented by given Time type.
  # It accepts true, t, yes, y, on, 1, false, f, no, n, off, 0. Any other value return an error.
  def to_bool?(raw : Time)
    nil
  end

  # Returns the `Array` or `Nil` value represented by given Time type.
  def to_array?(raw : Time, value_type : T.class = String) forall T
    [cast(raw, T).as(T)]
  end

  # Returns the `Hash` or `Nil` value represented by given Time type.
  def to_hash?(raw : Time, value_type : T.class = String) forall T
    nil
  end
end
