module Popcorn::Cast
  # Alias to `to_int32?`
  def to_int?(raw : Int)
    to_int32?(raw)
  end

  # Returns the `Int32` or `Nil` value represented by given Int type.
  def to_int32?(raw : Int)
    raw.to_i32
  end

  # Returns the `Int8` or `Nil` value represented by given Int type.
  def to_int8?(raw : Int)
    raw.to_i8
  end

  # Returns the `Int16` or `Nil` value represented by given Int type.
  def to_int16?(raw : Int)
    raw.to_i16
  end

  # Returns the `Int64` or `Nil` value represented by given Int type.
  def to_int64?(raw : Int)
    raw.to_i64
  end

  # Returns the `UInt32` or `Nil` value represented by given Int type.
  def to_uint?(raw : Int)
    to_uint32?(raw)
  end

  # Alias to `to_uint?`
  def to_uint32?(raw : Int)
    raw.to_u32
  end

  # Returns the `Int8` or `Nil` value represented by given Int type.
  def to_uint8?(raw : Int)
    raw.to_u8
  end

  # Returns the `UInt16` or `Nil` value represented by given Int type.
  def to_uint16?(raw : Int)
    raw.to_u16
  end

  # Returns the `UInt64` or `Nil` value represented by given Int type.
  def to_uint64?(raw : Int)
    raw.to_u64
  end

  # Returns the `Float64` or `Nil` value represented by given Int type.
  def to_float?(raw : Int)
    to_float64?(raw)
  end

  # Alias to `to_float64?`
  def to_float64?(raw : Int)
    raw.to_f
  end

  # Returns the `Float32` or `Nil` value represented by given Int type.
  def to_float32?(raw : Int)
    raw.to_f32
  end

  # Returns the `Time` or `Nil` value represented by given Int type.
  #
  # - `location` argument applies for `Int`/`String` types
  # - `formatters` argument applies for `String` type.
  def to_time?(raw : Int, location : Time::Location? = nil, formatters : Array(String)? = nil)
    v = raw.to_i64
    if Math.log10(raw) > 10
      location ? Time.unix_ms(v, location: location) : Time.unix_ms(raw)
    else
      location ? Time.unix(v, location: location) : Time.unix(raw)
    end
  end

  # Returns the `Bool` or `Nil` value represented by given Int type.
  # It accepts true, t, yes, y, on, 1, false, f, no, n, off, 0. Any other value return an error.
  def to_bool?(raw : Int)
    !raw.zero?
  end

  # Returns the `Array` or `Nil` value represented by given Int type.
  def to_array?(raw : Int, value_type : T.class = String) forall T
    [cast(raw, T).as(T)]
  end

  # Returns the `Hash` or `Nil` value represented by given Int type.
  def to_hash?(raw : Int, value_type : T.class = String) forall T
    nil
  end
end

struct Time
  def self.unix(seconds : Int, location = Location::UTC) : Time
    new(seconds: UNIX_EPOCH.total_seconds + seconds, nanoseconds: 0, location: location)
  end

  def self.unix_ms(milliseconds : Int, location = Location::UTC) : Time
    milliseconds = milliseconds.to_i64
    seconds = UNIX_EPOCH.total_seconds + (milliseconds / 1_000)
    nanoseconds = (milliseconds % 1000) * NANOSECONDS_PER_MILLISECOND
    new(seconds: seconds.to_i64, nanoseconds: nanoseconds.to_i, location: location)
  end
end
