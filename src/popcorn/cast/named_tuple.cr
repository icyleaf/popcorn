module Popcorn::Cast
  # Alias to `to_int32?`
  def to_int?(raw : NamedTuple)
    to_int32?(raw)
  end

  # Returns the `Nil` value represented by given NamedTuple type.
  def to_int32?(raw : NamedTuple)
    nil
  end

  # Returns the `Nil` value represented by given NamedTuple type.
  def to_int8?(raw : NamedTuple)
    nil
  end

  # Returns the `Nil` value represented by given NamedTuple type.
  def to_int16?(raw : NamedTuple)
    nil
  end

  # Returns the `Nil` value represented by given NamedTuple type.
  def to_int64?(raw : NamedTuple)
    nil
  end

  # Aliase to `to_uint32`
  def to_uint?(raw : NamedTuple)
    to_uint32?(raw)
  end

  # Returns the `Nil` value represented by given NamedTuple type.
  def to_uint32?(raw : NamedTuple)
    nil
  end

  # Returns the `Nil` value represented by given NamedTuple type.
  def to_uint8?(raw : NamedTuple)
    nil
  end

  # Returns the `Nil` value represented by given NamedTuple type.
  def to_uint16?(raw : NamedTuple)
    nil
  end

  # Returns the `Nil` value represented by given NamedTuple type.
  def to_uint64?(raw : NamedTuple)
    nil
  end

  # Alias to `to_float64?`
  def to_float?(raw : NamedTuple)
    to_float64?(raw)
  end

  # Returns the `Nil` value represented by given NamedTuple type.
  def to_float64?(raw : NamedTuple)
    nil
  end

  # Returns the `Nil` value represented by given NamedTuple type.
  def to_float32?(raw : NamedTuple)
    nil
  end

  # Returns the `Nil` value represented by given NamedTuple type.
  #
  # - `location` argument applies for `Int`/`String` types
  # - `formatters` argument applies for `String` type.
  def to_time?(raw : Array, location : Time::Location? = nil, formatters : Array(String)? = nil)
    nil
  end

  # Returns the `Bool` or `Nil` value represented by given data type.
  def to_bool?(raw : NamedTuple)
    !raw.size.zero?
  end
end
