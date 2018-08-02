module Popcorn::Cast
  # Alias to `to_int32?`
  def to_int?(raw : Symbol)
    to_int32?(raw)
  end

  # Returns the `Nil` value represented by given Symbol type.
  def to_int32?(raw : Symbol)
    nil
  end

  # Returns the `Nil` value represented by given Symbol type.
  def to_int8?(raw : Symbol)
    nil
  end

  # Returns the `Nil` value represented by given Symbol type.
  def to_int16?(raw : Symbol)
    nil
  end

  # Returns the `Nil` value represented by given Symbol type.
  def to_int64?(raw : Symbol)
    nil
  end

  # Returns the `Nil` value represented by given Symbol type.
  def to_uint?(raw : Symbol)
    to_uint32?(raw)
  end

  # Alias to `to_uint?`
  def to_uint32?(raw : Symbol)
    nil
  end

  # Returns the `Nil` value represented by given Symbol type.
  def to_uint8?(raw : Symbol)
    nil
  end

  # Returns the `Nil` value represented by given Symbol type.
  def to_uint16?(raw : Symbol)
    nil
  end

  # Returns the `Nil` value represented by given Symbol type.
  def to_uint64?(raw : Symbol)
    nil
  end

  # Returns the `Nil` value represented by given Symbol type.
  def to_float?(raw : Symbol)
    to_float64?(raw)
  end

  # Alias to `to_float64?`
  def to_float64?(raw : Symbol)
    nil
  end

  # Returns the `Nil` value represented by given Symbol type.
  def to_float32?(raw : Symbol)
    nil
  end

  # Returns the `Nil` value represented by given Symbol type.
  #
  # - `location` argument applies for `Int`/`String` types
  # - `formatters` argument applies for `String` type.
  def to_time?(raw : Symbol, location : Time::Location? = nil, formatters : Array(String)? = nil)
    nil
  end

  # Returns the `Bool` or `Nil` value represented by given Symbol type.
  # It accepts true, t, yes, y, on, 1, false, f, no, n, off, 0. Any other value return an error.
  def to_bool?(raw : Symbol)
    to_bool?(raw.to_s)
  end
end
