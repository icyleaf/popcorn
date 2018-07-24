require "./spec_helper"

{% for method in Popcorn::Cast.methods %}
  {% if method.name.starts_with?("to_") %}
    private def it_{{ method.name.id }}(input, expected{% if method.name.starts_with?("to_time") %}, location : Time::Location? = nil, formatters : Array(String)? = nil{% end %}, file = __FILE__, line = __LINE__)
      it "should casts #{input}", file, line do
        Popcorn.{{ method.name.id }}(input{% if method.name.starts_with?("to_time") %}, location, formatters{% end %}).should eq(expected)
      end
    end

    {% if !method.name.ends_with?("?") %}
      private def it_raise_{{ method.name.id }}(input, file = __FILE__, line = __LINE__)
        it "throws an exception to casts #{input}", file, line do
          expect_raises TypeCastError, file: file, line: line do
            Popcorn.{{ method.name.id }}(input)
          end
        end
      end
    {% end %}
  {% end %}
{% end %}

describe Popcorn do
  describe "to_int" do
    it_to_int 1_i8, 1_i32
    it_to_int -123_i16, -123
    it_to_int 123456789123456_i64, -2045800064
    it_to_int 1.234567890, 1
    it_to_int 1.67890_f32, 1
    it_to_int true, 1
    it_to_int false, 0
    it_to_int "123", 123
    it_to_int "123.4", 123
    it_to_int "123true", 123
    it_to_int "123true456", 123
    it_to_int "abc123true456", 0
    it_to_int "true", 0

    it_raise_to_int :foo
    it_raise_to_int([1, 2, 3])
    it_raise_to_int({"a" => "b"})
    it_raise_to_int({a: "b"})
  end

  describe "to_int?" do
    it_to_int? :foo, nil
    it_to_int?([1, 2, 3], nil)
    it_to_int?({"a" => "b"}, nil)
    it_to_int?({a: "b"}, nil)
  end

  describe "to_int8" do
    it_to_int8 1, 1_i8
    it_to_int8 -123_i16, -123_i8
    it_to_int8 123456789123456_i64, -128_i8
    it_to_int8 1.234567890, 1_i8
    it_to_int8 1.67890_f32, 1_i8
    it_to_int8 1, 1_i8
    it_to_int8 -123, -123_i8
    it_to_int8 1.234567890, 1_i8
    it_to_int8 1.67890, 1_i8
    it_to_int8 true, 1_i8
    it_to_int8 false, 0_i8
    it_to_int8 "123", 123_i8
    it_to_int8 "123.4", 123_i8
    it_to_int8 "123true", 123_i8
    it_to_int8 "123true456", 123_i8
    it_to_int8 "abc123true456", 0_i8
    it_to_int8 "true", 0_i8

    it_raise_to_int8 :foo
    it_raise_to_int8([1, 2, 3])
    it_raise_to_int8({"a" => "b"})
    it_raise_to_int8({a: "b"})
  end

  describe "to_int8?" do
    it_to_int8? :foo, nil
    it_to_int8?([1, 2, 3], nil)
    it_to_int8?({"a" => "b"}, nil)
    it_to_int8?({a: "b"}, nil)
  end

  describe "to_int16" do
    it_to_int16 1_i8, 1_i16
    it_to_int16 -123_i16, -123_i16
    it_to_int16 123, 123_i16
    it_to_int16 123456789123456_i64, -28288_i16
    it_to_int16 1.234567890, 1_i16
    it_to_int16 1.67890_f32, 1_i16
    it_to_int16 true, 1_i16
    it_to_int16 false, 0_i16
    it_to_int16 "123", 123_i16
    it_to_int16 "123.4", 123_i16
    it_to_int16 "123true", 123_i16
    it_to_int16 "123true456", 123_i16
    it_to_int16 "abc123true456", 0_i16
    it_to_int16 "true", 0_i16

    it_raise_to_int16 :foo
    it_raise_to_int16([1, 2, 3])
    it_raise_to_int16({"a" => "b"})
    it_raise_to_int16({a: "b"})
  end

  describe "to_int16?" do
    it_to_int16? :foo, nil
    it_to_int16?([1, 2, 3], nil)
    it_to_int16?({"a" => "b"}, nil)
    it_to_int16?({a: "b"}, nil)
  end

  describe "to_int64" do
    it_to_int64 1_i8, 1_i64
    it_to_int64 -123_i16, -123_i64
    it_to_int64 123, 123_i64
    it_to_int64 123456789123456_i64, 123456789123456_i64
    it_to_int64 1.234567890, 1_i64
    it_to_int64 1.67890_f32, 1_i64
    it_to_int64 true, 1_i64
    it_to_int64 false, 0_i64
    it_to_int64 "123", 123_i64
    it_to_int64 "123.4", 123_i64
    it_to_int64 "123true", 123_i64
    it_to_int64 "123true456", 123_i64
    it_to_int64 "abc123true456", 0_i64
    it_to_int64 "true", 0_i64

    it_raise_to_int64 :foo
    it_raise_to_int64([1, 2, 3])
    it_raise_to_int64({"a" => "b"})
    it_raise_to_int64({a: "b"})
  end

  describe "to_int64?" do
    it_to_int64? :foo, nil
    it_to_int64?([1, 2, 3], nil)
    it_to_int64?({"a" => "b"}, nil)
    it_to_int64?({a: "b"}, nil)
  end

  describe "to_float" do
    it_to_float 1_i8, 1.0_f64
    it_to_float -123_i16, -123.0_f64
    it_to_float 123, 123.0_f64
    it_to_float 123456789123456_i64, 123456789123456.0_f64
    it_to_float 1.234567890, 1.234567890_f64
    it_to_float "123", 123.0_f64
    it_to_float "123.4", 123.4_f64
    it_to_float "123true", 123.0_f64
    it_to_float "123true456", 123.0_f64
    it_to_float "abc123true456", 0.0_f64
    it_to_float "true", 0.0_f64

    it_raise_to_float :foo
    it_raise_to_float([1, 2, 3])
    it_raise_to_float({"a" => "b"})
    it_raise_to_float({a: "b"})
  end

  describe "to_float?" do
    it_to_float? :foo, nil
    it_to_float?([1, 2, 3], nil)
    it_to_float?({"a" => "b"}, nil)
    it_to_float?({a: "b"}, nil)
  end

  describe "to_float32" do
    it_to_float 1_i8, 1.0_f32
    it_to_float -123_i16, -123.0_f32
    it_to_float 123, 123.0_f32
    # it_to_float 123456789123456_i64, 123456790000000.0_f32
    # it_to_float 1.23_f64, 1.23_f32
    it_to_float 1.23_f32, 1.23_f32
    it_to_float "123", 123.0
    it_to_float "123.4", 123.4
    it_to_float "123true", 123.0
    it_to_float "123true456", 123.0
    it_to_float "abc123true456", 0.0
    it_to_float "true", 0.0

    it_raise_to_float :foo
    it_raise_to_float([1, 2, 3])
    it_raise_to_float({"a" => "b"})
    it_raise_to_float({a: "b"})
  end

  describe "to_float32?" do
    it_to_float32? :foo, nil
    it_to_float32?([1, 2, 3], nil)
    it_to_float32?({"a" => "b"}, nil)
    it_to_float32?({a: "b"}, nil)
  end

  describe "to_time" do
    it_to_time Time.new(2018, 1, 20, 1, 20, 33), Time.new(2018, 1, 20, 1, 20, 33)
    it_to_time 0, Time.new(1970, 1, 1, 0, 0, 0, location: Time::Location::UTC)
    it_to_time 1516411233, Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time 1516411233_i64, Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time 1516382433_i64, Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai")), Time::Location.load("Asia/Shanghai")
    it_to_time 1516411233000, Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time 1516382433000, Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai")), Time::Location.load("Asia/Shanghai")
    it_to_time "2018-01-20 01:20:33 +0000 UTC", Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "Tue Jan 20 01:20:33 2018", Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "Tue Jan 20 01:20:33 UTC 2018", Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "Tue Jan 20 01:20:33 +0800 2018", Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai"))
    it_to_time "20 Jan 18 01:20 UTC", Time.new(2018, 1, 20, 1, 20, 0, location: Time::Location::UTC)
    it_to_time "20 Jan 18 01:20 +0800", Time.new(2018, 1, 20, 1, 20, 0, location: Time::Location.load("Asia/Shanghai"))
    it_to_time "Tuesday, 20-Jan-18 01:20:33 UTC", Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "Tue, 20 Jan 2018 01:20:33 GMT", Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "Tue, 20 Jan 2018 01:20:33 +0800", Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai"))
    it_to_time "2018-01-20T01:20:33+08:00", Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai"))
    it_to_time "2018-01-20T01:20:33Z", Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "2018-01-20 01:20:33+08:00", Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "2018-01-20 01:20:33 +0800", Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai"))
    it_to_time "2018-01-20 01:20:33 +0000 UTC", Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "2018-01-20 01:20:33", Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "2018-01-20 01:20:33.000", Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "2018-01-20 01:20:33.000000", Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "2018-01-20 01:20:33.123456789", Time.new(2018, 1, 20, 1, 20, 33, nanosecond: 123456789, location: Time::Location::UTC)
    it_to_time "2018-01-20", Time.new(2018, 1, 20, 0, 0, 0, location: Time::Location::UTC)
    it_to_time "2018-01-20", Time.new(2018, 1, 20, 0, 0, 0, location: Time::Location::UTC)
    it_to_time "2018-01-20 01:20:33", Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai")), Time::Location.load("Asia/Shanghai")
    it_to_time "2018-01-20 01:20", Time.new(2018, 1, 20, 1, 20, 0, location: Time::Location.load("Asia/Shanghai")), Time::Location.load("Asia/Shanghai"), ["%F %H:%M"]

    it_raise_to_time(nil)
    it_raise_to_time("2018")
    it_raise_to_time("Nov 10 23:00:00")
    it_raise_to_time("11:00PM")
  end

  describe "to_time?" do
    it_to_time? nil, nil
    it_to_time? "2018", nil
    it_to_time? "Nov 10 23:00:00", nil
    it_to_time? "11:00PM", nil
  end

  describe "to_bool" do
    it_to_bool true, true
    it_to_bool false, false
    it_to_bool "true", true
    it_to_bool "TRUE", true
    it_to_bool "True", true
    it_to_bool "false", false
    it_to_bool "FALSE", false
    it_to_bool "False", false
    it_to_bool "T", true
    it_to_bool "Yes", true
    it_to_bool "Y", true
    it_to_bool "on", true
    it_to_bool "1", true
    it_to_bool "f", false
    it_to_bool "no", false
    it_to_bool "off", false
    it_to_bool "0", false
    it_to_bool :true, true
    it_to_bool :false, false
    it_to_bool 1, true
    it_to_bool 10.1, true
    it_to_bool -1, true
    it_to_bool 0, false

    it_raise_to_bool "foo"
    it_raise_to_bool :foo
    it_raise_to_bool([1, 2, 3])
    it_raise_to_bool({"a" => "b"})
    it_raise_to_bool({a: "b"})
  end

  describe "to_bool?" do
    it_to_bool? "foo", nil
    it_to_bool? :foo, nil
    it_to_bool?([1, 2, 3], nil)
    it_to_bool?({"a" => "b"}, nil)
    it_to_bool?({a: "b"}, nil)
  end
end
