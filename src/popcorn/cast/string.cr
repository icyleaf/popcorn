module Popcorn::Cast
  # Alias to `to_int32?`
  def to_int?(raw : String)
    to_int32?(raw)
  end

  # Returns the `Int32` or `Nil` value represented by given String type.
  def to_int32?(raw : String)
    value = raw.to_i?(strict: false)
    value ? value : 0
  end

  # Returns the `Int8` or `Nil` value represented by given String type.
  def to_int8?(raw : String)
    value = raw.to_i8?(strict: false)
    value ? value : 0
  end

  # Returns the `Int16` or `Nil` value represented by given String type.
  def to_int16?(raw : String)
    value = raw.to_i16?(strict: false)
    value ? value : 0
  end

  # Returns the `Int64` or `Nil` value represented by given String type.
  def to_int64?(raw : String)
    value = raw.to_i64?(strict: false)
    value ? value : 0
  end

  # Returns the `UInt32` or `Nil` value represented by given String type.
  def to_uint?(raw : String)
    to_uint32?(raw)
  end

  # Alias to `to_uint?`
  def to_uint32?(raw : String)
    value = raw.to_i?(strict: false)
    value ? value : 0
  end

  # Returns the `Int8` or `Nil` value represented by given String type.
  def to_uint8?(raw : String)
    value = raw.to_u8?(strict: false)
    value ? value : 0
  end

  # Returns the `UInt16` or `Nil` value represented by given String type.
  def to_uint16?(raw : String)
    value = raw.to_u16?(strict: false)
    value ? value : 0
  end

  # Returns the `UInt64` or `Nil` value represented by given String type.
  def to_uint64?(raw : String)
    value = raw.to_u64?(strict: false)
    value ? value : 0
  end

  # Returns the `Float64` or `Nil` value represented by given String type.
  def to_float?(raw : String)
    to_float64?(raw)
  end

  # Alias to `to_float64?`
  def to_float64?(raw : String)
    value = raw.to_f?(strict: false)
    value ? value : 0
  end

  # Returns the `Float32` or `Nil` value represented by given String type.
  def to_float32?(raw : String)
    value = raw.to_f32?(strict: false)
    value ? value : 0
  end

  # Returns the `Time` or `Nil` value represented by given String type.
  #
  # - `location` argument applies for `Int`/`String` types
  # - `formatters` argument applies for `String` type.
  def to_time?(raw : String, location : Time::Location? = nil, formatters : Array(String)? = nil)
    parse_time(raw, location, formatters)
  end

  # Returns the `Bool` or `Nil` value represented by given String type.
  # It accepts true, t, yes, y, on, 1, false, f, no, n, off, 0. Any other value return an error.
  def to_bool?(raw : String)
    raw = raw.downcase
    if %w(true t yes y on 1).includes?(raw)
      true
    elsif %w(false f no n off 0).includes?(raw)
      false
    end
  end

  def to_array?(raw : String, value_type : T.class = String) forall T
    [cast(raw, T).as(T)]
  end

  def to_hash?(raw : String, value_type : T.class = String) forall T
    nil
  end

  private def parse_time(raw : String, location : Time::Location? = nil, formatters : Array(String)? = nil)
    location ||= Time::Location::UTC
    formatters = formatters ? formatters.not_nil!.concat(time_formatters) : time_formatters
    formatters.each do |formatter|
      begin
        return Time.parse(raw, formatter, location)
      rescue Time::Format::Error
        next
      end
    end
  end

  private def time_formatters
    [
      "%a, %d %b %Y %T %z", # RFC 1123Z eg, Tue, 20 Jan 2018 01:20:33 +0800
      "%a, %d %b %Y %T",    # RFC 1123 eg, Tue, 20 Jan 2018 01:20:33 GMT
      "%A, %d-%b-%y %T",    # RFC 850 eg, Tuesday, 14-Feb-16 01:20:33 GMT
      "%d %b %y %H:%M %z",  # RFC 822Z 20 Jan 18 01:20 +0800
      "%d %b %y %H:%M",     # RFC 822 20 Jan 18 01:20 UTC
      "%a %b %d %T %z %Y",  # RubyDate
      "%a %b %d %T %Y",     # ANSIC/UnixDate
      "%FT%T%:z",           # ISO 8601 eg 2018-01-20T01:20:33Z+08:00
      "%F %T %z",           # RFC 3339
      "%FT%TZ",             # RFC 3339 nano
      "%F %H:%M:%S.%9N",    # Date Time Nano, eg 2018-01-20 01:20:33.000000000
      "%F %H:%M:%S.%6N",    # Date Time Macro, eg 2018-01-20 01:20:33.000000
      "%F %H:%M:%S.%3N",    # Date Time Milli, eg 2018-01-20 01:20:33.000
      "%F %T",              # Date Time, eg 2018-01-20 01:20:33
      "%F",                 # Date, eg 2018-01-20
      "%d %b %Y",           # Date, eg 20 Jan 2018
    ]
  end
end
