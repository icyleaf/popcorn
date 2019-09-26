require "./spec_helper"

describe Popcorn do
  describe ".cast" do
    it_cast 1_i8, String, "1"
    it_cast "123abc456", Int32, 123
    it_cast "123.456abc789", Float64, 123.456
    it_cast 1, Bool, true
    it_cast "foo", Array, ["foo"]
  end

  describe ".to_int" do
    it_to_int 1_i8, 1_i32
    it_to_int -123_i16, -123
    it_to_int 123456789_i64, 123456789
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

    it_to_int JSON::Any.new(raw: 1_i64), 1_i32
    it_to_int JSON::Any.new(raw: 123456789_i64), 123456789
    it_to_int JSON::Any.new(raw: 1.234567890), 1
    it_to_int JSON::Any.new(raw: 1.67890_f32), 1
    it_to_int JSON::Any.new(raw: true), 1
    it_to_int JSON::Any.new(raw: false), 0
    it_to_int JSON::Any.new(raw: "123"), 123
    it_to_int JSON::Any.new(raw: "123.4"), 123
    it_to_int JSON::Any.new(raw: "123true"), 123
    it_to_int JSON::Any.new(raw: "123true456"), 123
    it_to_int JSON::Any.new(raw: "abc123true456"), 0
    it_to_int JSON::Any.new(raw: "true"), 0

    it_to_int YAML::Any.new(raw: 1_i64), 1_i32
    it_to_int YAML::Any.new(raw: 123456789_i64), 123456789
    it_to_int YAML::Any.new(raw: 1.234567890), 1
    it_to_int YAML::Any.new(raw: 1.67890_f32), 1
    it_to_int YAML::Any.new(raw: true), 1
    it_to_int YAML::Any.new(raw: false), 0
    it_to_int YAML::Any.new(raw: "123"), 123
    it_to_int YAML::Any.new(raw: "123.4"), 123
    it_to_int YAML::Any.new(raw: "123true"), 123
    it_to_int YAML::Any.new(raw: "123true456"), 123
    it_to_int YAML::Any.new(raw: "abc123true456"), 0
    it_to_int YAML::Any.new(raw: "true"), 0

    it_raise_to_int :foo
    it_raise_to_int([1, 2, 3])
    it_raise_to_int({"a" => "b"})
    it_raise_to_int({a: "b"})
    it_raise_to_int(JSON.parse(%Q{[1, 2, 3]}))
    it_raise_to_int(JSON.parse(%Q{{"a":"b"}}))
    it_raise_to_int(YAML.parse(%Q{---\n- 1\n- 2\n -3}))
    it_raise_to_int(YAML.parse(%Q{a:\n  b}))
  end

  describe ".to_int?" do
    it_to_int? :foo, nil
    it_to_int?([1, 2, 3], nil)
    it_to_int?({"a" => "b"}, nil)
    it_to_int?({a: "b"}, nil)
    it_to_int?(JSON.parse(%Q{[1, 2, 3]}), nil)
    it_to_int?(JSON.parse(%Q{{"a":"b"}}), nil)
    it_to_int?(YAML.parse(%Q{---\n- 1\n- 2\n -3}), nil)
    it_to_int?(YAML.parse(%Q{a:\n  b}), nil)
  end

  describe ".to_int8" do
    it_to_int8 1, 1_i8
    it_to_int8 -123_i16, -123_i8
    it_to_int8 127_i64, 127_i8
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

    it_to_int8 JSON::Any.new(raw: 1_i64), 1_i8
    it_to_int8 JSON::Any.new(raw: 127_i64), 127_i8
    it_to_int8 JSON::Any.new(raw: 1.234567890), 1_i8
    it_to_int8 JSON::Any.new(raw: 1.67890_f32), 1_i8
    it_to_int8 JSON::Any.new(raw: true), 1_i8
    it_to_int8 JSON::Any.new(raw: false), 0_i8
    it_to_int8 JSON::Any.new(raw: "123"), 123_i8
    it_to_int8 JSON::Any.new(raw: "123.4"), 123_i8
    it_to_int8 JSON::Any.new(raw: "123true"), 123_i8
    it_to_int8 JSON::Any.new(raw: "123true456"), 123_i8
    it_to_int8 JSON::Any.new(raw: "abc123true456"), 0_i8
    it_to_int8 JSON::Any.new(raw: "true"), 0_i8

    it_to_int8 YAML::Any.new(raw: 1_i64), 1_i8
    it_to_int8 YAML::Any.new(raw: 127_i64), 127_i8
    it_to_int8 YAML::Any.new(raw: 1.234567890), 1_i8
    it_to_int8 YAML::Any.new(raw: 1.67890_f32), 1_i8
    it_to_int8 YAML::Any.new(raw: true), 1_i8
    it_to_int8 YAML::Any.new(raw: false), 0_i8
    it_to_int8 YAML::Any.new(raw: "123"), 123_i8
    it_to_int8 YAML::Any.new(raw: "123.4"), 123_i8
    it_to_int8 YAML::Any.new(raw: "123true"), 123_i8
    it_to_int8 YAML::Any.new(raw: "123true456"), 123_i8
    it_to_int8 YAML::Any.new(raw: "abc123true456"), 0_i8
    it_to_int8 YAML::Any.new(raw: "true"), 0_i8

    it_raise_to_int8 :foo
    it_raise_to_int8([1, 2, 3])
    it_raise_to_int8({"a" => "b"})
    it_raise_to_int8({a: "b"})
    it_raise_to_int8(JSON.parse(%Q{[1, 2, 3]}))
    it_raise_to_int8(JSON.parse(%Q{{"a":"b"}}))
    it_raise_to_int8(YAML.parse(%Q{---\n- 1\n- 2\n -3}))
    it_raise_to_int8(YAML.parse(%Q{a:\n  b}))
  end

  describe ".to_int8?" do
    it_to_int8? :foo, nil
    it_to_int8?([1, 2, 3], nil)
    it_to_int8?({"a" => "b"}, nil)
    it_to_int8?({a: "b"}, nil)
    it_to_int8?(JSON.parse(%Q{[1, 2, 3]}), nil)
    it_to_int8?(JSON.parse(%Q{{"a":"b"}}), nil)
    it_to_int8?(YAML.parse(%Q{---\n- 1\n- 2\n -3}), nil)
    it_to_int8?(YAML.parse(%Q{a:\n  b}), nil)
  end

  describe ".to_int16" do
    it_to_int16 1_i8, 1_i16
    it_to_int16 -123_i16, -123_i16
    it_to_int16 123, 123_i16
    it_to_int16 1234_i64, 1234_i16
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

    it_to_int16 JSON::Any.new(raw: 1_i64), 1_i16
    it_to_int16 JSON::Any.new(raw: 1234_i64), 1234_i16
    it_to_int16 JSON::Any.new(raw: 1.234567890), 1_i16
    it_to_int16 JSON::Any.new(raw: 1.67890_f32), 1_i16
    it_to_int16 JSON::Any.new(raw: true), 1_i16
    it_to_int16 JSON::Any.new(raw: false), 0_i16
    it_to_int16 JSON::Any.new(raw: "123"), 123_i16
    it_to_int16 JSON::Any.new(raw: "123.4"), 123_i16
    it_to_int16 JSON::Any.new(raw: "123true"), 123_i16
    it_to_int16 JSON::Any.new(raw: "123true456"), 123_i16
    it_to_int16 JSON::Any.new(raw: "abc123true456"), 0_i16
    it_to_int16 JSON::Any.new(raw: "true"), 0_i16

    it_to_int16 YAML::Any.new(raw: 1_i64), 1_i16
    it_to_int16 YAML::Any.new(raw: 1234_i64), 1234_i16
    it_to_int16 YAML::Any.new(raw: 1.234567890), 1_i16
    it_to_int16 YAML::Any.new(raw: 1.67890_f32), 1_i16
    it_to_int16 YAML::Any.new(raw: true), 1_i16
    it_to_int16 YAML::Any.new(raw: false), 0_i16
    it_to_int16 YAML::Any.new(raw: "123"), 123_i16
    it_to_int16 YAML::Any.new(raw: "123.4"), 123_i16
    it_to_int16 YAML::Any.new(raw: "123true"), 123_i16
    it_to_int16 YAML::Any.new(raw: "123true456"), 123_i16
    it_to_int16 YAML::Any.new(raw: "abc123true456"), 0_i16
    it_to_int16 YAML::Any.new(raw: "true"), 0_i16

    it_raise_to_int16 :foo
    it_raise_to_int16([1, 2, 3])
    it_raise_to_int16({"a" => "b"})
    it_raise_to_int16({a: "b"})
    it_raise_to_int16(JSON.parse(%Q{[1, 2, 3]}))
    it_raise_to_int16(JSON.parse(%Q{{"a":"b"}}))
    it_raise_to_int16(YAML.parse(%Q{---\n- 1\n- 2\n -3}))
    it_raise_to_int16(YAML.parse(%Q{a:\n  b}))
  end

  describe ".to_int16?" do
    it_to_int16? :foo, nil
    it_to_int16?([1, 2, 3], nil)
    it_to_int16?({"a" => "b"}, nil)
    it_to_int16?({a: "b"}, nil)
    it_to_int16?(JSON.parse(%Q{[1, 2, 3]}), nil)
    it_to_int16?(JSON.parse(%Q{{"a":"b"}}), nil)
    it_to_int16?(YAML.parse(%Q{---\n- 1\n- 2\n -3}), nil)
    it_to_int16?(YAML.parse(%Q{a:\n  b}), nil)
  end

  describe ".to_int64" do
    it_to_int64 1_i8, 1_i64
    it_to_int64 -123_i16, -123_i64
    it_to_int64 123, 123_i64
    it_to_int64 123456789_i64, 123456789_i64
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

    it_to_int64 JSON::Any.new(raw: 1_i64), 1_i64
    it_to_int64 JSON::Any.new(raw: 123456789_i64), 123456789_i64
    it_to_int64 JSON::Any.new(raw: 1.234567890), 1_i64
    it_to_int64 JSON::Any.new(raw: 1.67890_f32), 1_i64
    it_to_int64 JSON::Any.new(raw: true), 1_i64
    it_to_int64 JSON::Any.new(raw: false), 0_i64
    it_to_int64 JSON::Any.new(raw: "123"), 123_i64
    it_to_int64 JSON::Any.new(raw: "123.4"), 123_i64
    it_to_int64 JSON::Any.new(raw: "123true"), 123_i64
    it_to_int64 JSON::Any.new(raw: "123true456"), 123_i64
    it_to_int64 JSON::Any.new(raw: "abc123true456"), 0_i64
    it_to_int64 JSON::Any.new(raw: "true"), 0_i64

    it_to_int64 YAML::Any.new(raw: 1_i64), 1_i64
    it_to_int64 YAML::Any.new(raw: 123456789_i64), 123456789_i64
    it_to_int64 YAML::Any.new(raw: 1.234567890), 1_i64
    it_to_int64 YAML::Any.new(raw: 1.67890_f32), 1_i64
    it_to_int64 YAML::Any.new(raw: true), 1_i64
    it_to_int64 YAML::Any.new(raw: false), 0_i64
    it_to_int64 YAML::Any.new(raw: "123"), 123_i64
    it_to_int64 YAML::Any.new(raw: "123.4"), 123_i64
    it_to_int64 YAML::Any.new(raw: "123true"), 123_i64
    it_to_int64 YAML::Any.new(raw: "123true456"), 123_i64
    it_to_int64 YAML::Any.new(raw: "abc123true456"), 0_i64
    it_to_int64 YAML::Any.new(raw: "true"), 0_i64

    it_raise_to_int64 :foo
    it_raise_to_int64([1, 2, 3])
    it_raise_to_int64({"a" => "b"})
    it_raise_to_int64({a: "b"})
    it_raise_to_int64(JSON.parse(%Q{[1, 2, 3]}))
    it_raise_to_int64(JSON.parse(%Q{{"a":"b"}}))
    it_raise_to_int64(YAML.parse(%Q{---\n- 1\n- 2\n -3}))
    it_raise_to_int64(YAML.parse(%Q{a:\n  b}))
  end

  describe ".to_int64?" do
    it_to_int64? :foo, nil
    it_to_int64?([1, 2, 3], nil)
    it_to_int64?({"a" => "b"}, nil)
    it_to_int64?({a: "b"}, nil)
    it_to_int64?(JSON.parse(%Q{[1, 2, 3]}), nil)
    it_to_int64?(JSON.parse(%Q{{"a":"b"}}), nil)
    it_to_int64?(YAML.parse(%Q{---\n- 1\n- 2\n -3}), nil)
    it_to_int64?(YAML.parse(%Q{a:\n  b}), nil)
  end

  describe ".to_uint" do
    it_to_uint 1_i8, 1_u32
    it_to_uint 123456789_i64, 123456789_u32
    it_to_uint 1.234567890, 1_u32
    it_to_uint 1.67890_f32, 1_u32
    it_to_uint true, 1_u32
    it_to_uint false, 0_u32
    it_to_uint "123", 123_u32
    it_to_uint "123.4", 123_u32
    it_to_uint "123true", 123_u32
    it_to_uint "123true456", 123_u32
    it_to_uint "abc123true456", 0_u32
    it_to_uint "true", 0_u32

    it_to_uint JSON::Any.new(raw: 1_i64), 1_u32
    it_to_uint JSON::Any.new(raw: 123456789_i64), 123456789_u32
    it_to_uint JSON::Any.new(raw: 1.234567890), 1_u32
    it_to_uint JSON::Any.new(raw: 1.67890_f32), 1_u32
    it_to_uint JSON::Any.new(raw: true), 1_u32
    it_to_uint JSON::Any.new(raw: false), 0_u32
    it_to_uint JSON::Any.new(raw: "123"), 123_u32
    it_to_uint JSON::Any.new(raw: "123.4"), 123_u32
    it_to_uint JSON::Any.new(raw: "123true"), 123_u32
    it_to_uint JSON::Any.new(raw: "123true456"), 123_u32
    it_to_uint JSON::Any.new(raw: "abc123true456"), 0_u32
    it_to_uint JSON::Any.new(raw: "true"), 0_u32

    it_to_uint YAML::Any.new(raw: 1_i64), 1_u32
    it_to_uint YAML::Any.new(raw: 123456789_i64), 123456789_u32
    it_to_uint YAML::Any.new(raw: 1.234567890), 1_u32
    it_to_uint YAML::Any.new(raw: 1.67890_f32), 1_u32
    it_to_uint YAML::Any.new(raw: true), 1_u32
    it_to_uint YAML::Any.new(raw: false), 0_u32
    it_to_uint YAML::Any.new(raw: "123"), 123_u32
    it_to_uint YAML::Any.new(raw: "123.4"), 123_u32
    it_to_uint YAML::Any.new(raw: "123true"), 123_u32
    it_to_uint YAML::Any.new(raw: "123true456"), 123_u32
    it_to_uint YAML::Any.new(raw: "abc123true456"), 0_u32
    it_to_uint YAML::Any.new(raw: "true"), 0_u32

    it_raise_to_uint :foo
    it_raise_to_uint([1, 2, 3])
    it_raise_to_uint({"a" => "b"})
    it_raise_to_uint({a: "b"})
    it_raise_to_uint(JSON.parse(%Q{[1, 2, 3]}))
    it_raise_to_uint(JSON.parse(%Q{{"a":"b"}}))
    it_raise_to_uint(YAML.parse(%Q{---\n- 1\n- 2\n -3}))
    it_raise_to_uint(YAML.parse(%Q{a:\n  b}))
  end

  describe ".to_uint?" do
    it_to_uint? :foo, nil
    it_to_uint?([1, 2, 3], nil)
    it_to_uint?({"a" => "b"}, nil)
    it_to_uint?({a: "b"}, nil)
    it_to_uint?(JSON.parse(%Q{[1, 2, 3]}), nil)
    it_to_uint?(JSON.parse(%Q{{"a":"b"}}), nil)
    it_to_uint?(YAML.parse(%Q{---\n- 1\n- 2\n -3}), nil)
    it_to_uint?(YAML.parse(%Q{a:\n  b}), nil)
  end

  describe ".to_uint8" do
    it_to_uint8 1_i8, 1_u8
    it_to_uint8 127_i64, 127_u8
    it_to_uint8 1.234567890, 1_u8
    it_to_uint8 1.67890_f32, 1_u8
    it_to_uint8 true, 1_u8
    it_to_uint8 false, 0_u8
    it_to_uint8 "123", 123_u8
    it_to_uint8 "123.4", 123_u8
    it_to_uint8 "123true", 123_u8
    it_to_uint8 "123true456", 123_u8
    it_to_uint8 "abc123true456", 0_u8
    it_to_uint8 "true", 0_u8

    it_to_uint8 JSON::Any.new(raw: 1_i64), 1_u8
    it_to_uint8 JSON::Any.new(raw: 127_i64), 127_u8
    it_to_uint8 JSON::Any.new(raw: 1.234567890), 1_u8
    it_to_uint8 JSON::Any.new(raw: 1.67890_f32), 1_u8
    it_to_uint8 JSON::Any.new(raw: true), 1_u8
    it_to_uint8 JSON::Any.new(raw: false), 0_u8
    it_to_uint8 JSON::Any.new(raw: "123"), 123_u8
    it_to_uint8 JSON::Any.new(raw: "123.4"), 123_u8
    it_to_uint8 JSON::Any.new(raw: "123true"), 123_u8
    it_to_uint8 JSON::Any.new(raw: "123true456"), 123_u8
    it_to_uint8 JSON::Any.new(raw: "abc123true456"), 0_u8
    it_to_uint8 JSON::Any.new(raw: "true"), 0_u8

    it_to_uint8 YAML::Any.new(raw: 1_i64), 1_u8
    it_to_uint8 YAML::Any.new(raw: 127_i64), 127_u8
    it_to_uint8 YAML::Any.new(raw: 1.234567890), 1_u8
    it_to_uint8 YAML::Any.new(raw: 1.67890_f32), 1_u8
    it_to_uint8 YAML::Any.new(raw: true), 1_u8
    it_to_uint8 YAML::Any.new(raw: false), 0_u8
    it_to_uint8 YAML::Any.new(raw: "123"), 123_u8
    it_to_uint8 YAML::Any.new(raw: "123.4"), 123_u8
    it_to_uint8 YAML::Any.new(raw: "123true"), 123_u8
    it_to_uint8 YAML::Any.new(raw: "123true456"), 123_u8
    it_to_uint8 YAML::Any.new(raw: "abc123true456"), 0_u8
    it_to_uint8 YAML::Any.new(raw: "true"), 0_u8

    it_raise_to_uint8 :foo
    it_raise_to_uint8([1, 2, 3])
    it_raise_to_uint8({"a" => "b"})
    it_raise_to_uint8({a: "b"})
    it_raise_to_uint8(JSON.parse(%Q{[1, 2, 3]}))
    it_raise_to_uint8(JSON.parse(%Q{{"a":"b"}}))
    it_raise_to_uint8(YAML.parse(%Q{---\n- 1\n- 2\n -3}))
    it_raise_to_uint8(YAML.parse(%Q{a:\n  b}))
  end

  describe ".to_uint8?" do
    it_to_uint8? :foo, nil
    it_to_uint8?([1, 2, 3], nil)
    it_to_uint8?({"a" => "b"}, nil)
    it_to_uint8?({a: "b"}, nil)
    it_to_uint8?(JSON.parse(%Q{[1, 2, 3]}), nil)
    it_to_uint8?(JSON.parse(%Q{{"a":"b"}}), nil)
    it_to_uint8?(YAML.parse(%Q{---\n- 1\n- 2\n -3}), nil)
    it_to_uint8?(YAML.parse(%Q{a:\n  b}), nil)
  end

  describe ".to_uint16" do
    it_to_uint16 1_i8, 1_u16
    it_to_uint16 1234_i64, 1234_u16
    it_to_uint16 1.234567890, 1_u16
    it_to_uint16 1.67890_f32, 1_u16
    it_to_uint16 true, 1_u16
    it_to_uint16 false, 0_u16
    it_to_uint16 "123", 123_u16
    it_to_uint16 "123.4", 123_u16
    it_to_uint16 "123true", 123_u16
    it_to_uint16 "123true456", 123_u16
    it_to_uint16 "abc123true456", 0_u16
    it_to_uint16 "true", 0_u16

    it_to_uint16 JSON::Any.new(raw: 1_i64), 1_u16
    it_to_uint16 JSON::Any.new(raw: 1234_i64), 1234_u16
    it_to_uint16 JSON::Any.new(raw: 1.234567890), 1_u16
    it_to_uint16 JSON::Any.new(raw: 1.67890_f32), 1_u16
    it_to_uint16 JSON::Any.new(raw: true), 1_u16
    it_to_uint16 JSON::Any.new(raw: false), 0_u16
    it_to_uint16 JSON::Any.new(raw: "123"), 123_u16
    it_to_uint16 JSON::Any.new(raw: "123.4"), 123_u16
    it_to_uint16 JSON::Any.new(raw: "123true"), 123_u16
    it_to_uint16 JSON::Any.new(raw: "123true456"), 123_u16
    it_to_uint16 JSON::Any.new(raw: "abc123true456"), 0_u16
    it_to_uint16 JSON::Any.new(raw: "true"), 0_u16

    it_to_uint16 YAML::Any.new(raw: 1_i64), 1_u16
    it_to_uint16 YAML::Any.new(raw: 1234_i64), 1234_u16
    it_to_uint16 YAML::Any.new(raw: 1.234567890), 1_u16
    it_to_uint16 YAML::Any.new(raw: 1.67890_f32), 1_u16
    it_to_uint16 YAML::Any.new(raw: true), 1_u16
    it_to_uint16 YAML::Any.new(raw: false), 0_u16
    it_to_uint16 YAML::Any.new(raw: "123"), 123_u16
    it_to_uint16 YAML::Any.new(raw: "123.4"), 123_u16
    it_to_uint16 YAML::Any.new(raw: "123true"), 123_u16
    it_to_uint16 YAML::Any.new(raw: "123true456"), 123_u16
    it_to_uint16 YAML::Any.new(raw: "abc123true456"), 0_u16
    it_to_uint16 YAML::Any.new(raw: "true"), 0_u16

    it_raise_to_uint16 :foo
    it_raise_to_uint16([1, 2, 3])
    it_raise_to_uint16({"a" => "b"})
    it_raise_to_uint16({a: "b"})
    it_raise_to_uint16(JSON.parse(%Q{[1, 2, 3]}))
    it_raise_to_uint16(JSON.parse(%Q{{"a":"b"}}))
    it_raise_to_uint16(YAML.parse(%Q{---\n- 1\n- 2\n -3}))
    it_raise_to_uint16(YAML.parse(%Q{a:\n  b}))
  end

  describe ".to_uint16?" do
    it_to_uint16? :foo, nil
    it_to_uint16?([1, 2, 3], nil)
    it_to_uint16?({"a" => "b"}, nil)
    it_to_uint16?({a: "b"}, nil)
    it_to_uint16?(JSON.parse(%Q{[1, 2, 3]}), nil)
    it_to_uint16?(JSON.parse(%Q{{"a":"b"}}), nil)
    it_to_uint16?(YAML.parse(%Q{---\n- 1\n- 2\n -3}), nil)
    it_to_uint16?(YAML.parse(%Q{a:\n  b}), nil)
  end

  describe ".to_uint64" do
    it_to_uint64 1_i8, 1_u64
    it_to_uint64 123456789_i64, 123456789_i64
    it_to_uint64 1.234567890, 1_u64
    it_to_uint64 1.67890_f32, 1_u64
    it_to_uint64 true, 1_u64
    it_to_uint64 false, 0_u64
    it_to_uint64 "123", 123_u64
    it_to_uint64 "123.4", 123_u64
    it_to_uint64 "123true", 123_u64
    it_to_uint64 "123true456", 123_u64
    it_to_uint64 "abc123true456", 0_u64
    it_to_uint64 "true", 0_u64

    it_to_uint64 JSON::Any.new(raw: 1_i64), 1_u64
    it_to_uint64 JSON::Any.new(raw: 123456789_i64), 123456789_i64
    it_to_uint64 JSON::Any.new(raw: 1.234567890), 1_u64
    it_to_uint64 JSON::Any.new(raw: 1.67890_f32), 1_u64
    it_to_uint64 JSON::Any.new(raw: true), 1_u64
    it_to_uint64 JSON::Any.new(raw: false), 0_u64
    it_to_uint64 JSON::Any.new(raw: "123"), 123_u64
    it_to_uint64 JSON::Any.new(raw: "123.4"), 123_u64
    it_to_uint64 JSON::Any.new(raw: "123true"), 123_u64
    it_to_uint64 JSON::Any.new(raw: "123true456"), 123_u64
    it_to_uint64 JSON::Any.new(raw: "abc123true456"), 0_u64
    it_to_uint64 JSON::Any.new(raw: "true"), 0_u64

    it_to_uint64 YAML::Any.new(raw: 1_i64), 1_u64
    it_to_uint64 YAML::Any.new(raw: 123456789_i64), 123456789_i64
    it_to_uint64 YAML::Any.new(raw: 1.234567890), 1_u64
    it_to_uint64 YAML::Any.new(raw: 1.67890_f32), 1_u64
    it_to_uint64 YAML::Any.new(raw: true), 1_u64
    it_to_uint64 YAML::Any.new(raw: false), 0_u64
    it_to_uint64 YAML::Any.new(raw: "123"), 123_u64
    it_to_uint64 YAML::Any.new(raw: "123.4"), 123_u64
    it_to_uint64 YAML::Any.new(raw: "123true"), 123_u64
    it_to_uint64 YAML::Any.new(raw: "123true456"), 123_u64
    it_to_uint64 YAML::Any.new(raw: "abc123true456"), 0_u64
    it_to_uint64 YAML::Any.new(raw: "true"), 0_u64

    it_raise_to_uint64 :foo
    it_raise_to_uint64([1, 2, 3])
    it_raise_to_uint64({"a" => "b"})
    it_raise_to_uint64({a: "b"})
    it_raise_to_uint64(JSON.parse(%Q{[1, 2, 3]}))
    it_raise_to_uint64(JSON.parse(%Q{{"a":"b"}}))
    it_raise_to_uint64(YAML.parse(%Q{---\n- 1\n- 2\n -3}))
    it_raise_to_uint64(YAML.parse(%Q{a:\n  b}))
  end

  describe ".to_uint64?" do
    it_to_uint64? :foo, nil
    it_to_uint64?([1, 2, 3], nil)
    it_to_uint64?({"a" => "b"}, nil)
    it_to_uint64?({a: "b"}, nil)
    it_to_uint64?(JSON.parse(%Q{[1, 2, 3]}), nil)
    it_to_uint64?(JSON.parse(%Q{{"a":"b"}}), nil)
    it_to_uint64?(YAML.parse(%Q{---\n- 1\n- 2\n -3}), nil)
    it_to_uint64?(YAML.parse(%Q{a:\n  b}), nil)
  end

  describe ".to_float" do
    it_to_float 1_i8, 1.0_f64
    it_to_float -123_i16, -123.0_f64
    it_to_float 123, 123.0_f64
    it_to_float 123456789_i64, 123456789.0_f64
    it_to_float 1.234567890, 1.234567890_f64
    it_to_float "123", 123.0_f64
    it_to_float "123.4", 123.4_f64
    it_to_float "123true", 123.0_f64
    it_to_float "123true456", 123.0_f64
    it_to_float "abc123true456", 0.0_f64
    it_to_float "true", 0.0_f64

    it_to_float JSON::Any.new(raw: 123_i64), 123.0_f64
    it_to_float JSON::Any.new(raw: 123456789_i64), 123456789.0_f64
    it_to_float JSON::Any.new(raw: 1.234567890), 1.234567890_f64
    it_to_float JSON::Any.new(raw: "123"), 123_f64
    it_to_float JSON::Any.new(raw: "123.4"), 123.4_f64
    it_to_float JSON::Any.new(raw: "123true"), 123_f64
    it_to_float JSON::Any.new(raw: "123true456"), 123_f64
    it_to_float JSON::Any.new(raw: "abc123true456"), 0_f64
    it_to_float JSON::Any.new(raw: "true"), 0_f64

    it_to_float YAML::Any.new(raw: 123_i64), 123.0_f64
    it_to_float YAML::Any.new(raw: 123456789_i64), 123456789.0_f64
    it_to_float YAML::Any.new(raw: 1.234567890), 1.234567890_f64
    it_to_float YAML::Any.new(raw: "123"), 123.0_f64
    it_to_float YAML::Any.new(raw: "123.4"), 123.4_f64
    it_to_float YAML::Any.new(raw: "123true"), 123_f64
    it_to_float YAML::Any.new(raw: "123true456"), 123_f64
    it_to_float YAML::Any.new(raw: "abc123true456"), 0_f64
    it_to_float YAML::Any.new(raw: "true"), 0_f64

    it_raise_to_float :foo
    it_raise_to_float([1, 2, 3])
    it_raise_to_float({"a" => "b"})
    it_raise_to_float({a: "b"})
    it_raise_to_float(JSON::Any.new(raw: true))
    it_raise_to_float(JSON::Any.new(raw: false))
    it_raise_to_float(YAML::Any.new(raw: true))
    it_raise_to_float(YAML::Any.new(raw: false))
    it_raise_to_float(JSON.parse(%Q{[1, 2, 3]}))
    it_raise_to_float(JSON.parse(%Q{{"a":"b"}}))
    it_raise_to_float(YAML.parse(%Q{---\n- 1\n- 2\n -3}))
    it_raise_to_float(YAML.parse(%Q{a:\n  b}))
  end

  describe ".to_float?" do
    it_to_float? :foo, nil
    it_to_float?([1, 2, 3], nil)
    it_to_float?({"a" => "b"}, nil)
    it_to_float?({a: "b"}, nil)
    it_to_float?(JSON::Any.new(raw: true), nil)
    it_to_float?(JSON::Any.new(raw: false), nil)
    it_to_float?(YAML::Any.new(raw: true), nil)
    it_to_float?(YAML::Any.new(raw: false), nil)
    it_to_float?(JSON.parse(%Q{[1, 2, 3]}), nil)
    it_to_float?(JSON.parse(%Q{{"a":"b"}}), nil)
    it_to_float?(YAML.parse(%Q{---\n- 1\n- 2\n -3}), nil)
    it_to_float?(YAML.parse(%Q{a:\n  b}), nil)
  end

  describe ".to_float32" do
    it_to_float32 1_i8, 1.0_f32
    it_to_float32 -123_i16, -123.0_f32
    it_to_float32 123, 123.0_f32
    it_to_float32 123456789_i64, 123456790.0_f32
    it_to_float32 1.23_f64, 1.23_f32
    it_to_float32 1.23_f32, 1.23_f32
    it_to_float32 "123", 123.0_f32
    it_to_float32 "123.4", 123.4_f32
    it_to_float32 "123true", 123.0_f32
    it_to_float32 "123true456", 123.0_f32
    it_to_float32 "abc123true456", 0.0_f32
    it_to_float32 "true", 0.0_f32

    it_to_float32 JSON::Any.new(raw: 123_i64), 123.0_f32
    it_to_float32 JSON::Any.new(raw: 123456789_i64), 123456789.0_f32
    it_to_float32 JSON::Any.new(raw: 1.234567890), 1.234567890_f32
    it_to_float32 JSON::Any.new(raw: "123"), 123_f32
    it_to_float32 JSON::Any.new(raw: "123.4"), 123.4_f32
    it_to_float32 JSON::Any.new(raw: "123true"), 123_f32
    it_to_float32 JSON::Any.new(raw: "123true456"), 123_f32
    it_to_float32 JSON::Any.new(raw: "abc123true456"), 0_f32
    it_to_float32 JSON::Any.new(raw: "true"), 0_f32

    it_to_float32 YAML::Any.new(raw: 123_i64), 123.0_f32
    it_to_float32 YAML::Any.new(raw: 123456789_i64), 123456789.0_f32
    it_to_float32 YAML::Any.new(raw: 1.234567890), 1.234567890_f32
    it_to_float32 YAML::Any.new(raw: "123"), 123.0_f32
    it_to_float32 YAML::Any.new(raw: "123.4"), 123.4_f32
    it_to_float32 YAML::Any.new(raw: "123true"), 123_f32
    it_to_float32 YAML::Any.new(raw: "123true456"), 123_f32
    it_to_float32 YAML::Any.new(raw: "abc123true456"), 0_f32
    it_to_float32 YAML::Any.new(raw: "true"), 0_f32

    it_raise_to_float32 :foo
    it_raise_to_float32([1, 2, 3])
    it_raise_to_float32({"a" => "b"})
    it_raise_to_float32({a: "b"})
    it_raise_to_float32(JSON::Any.new(raw: true))
    it_raise_to_float32(JSON::Any.new(raw: false))
    it_raise_to_float32(YAML::Any.new(raw: true))
    it_raise_to_float32(YAML::Any.new(raw: false))
    it_raise_to_float32(JSON.parse(%Q{[1, 2, 3]}))
    it_raise_to_float32(JSON.parse(%Q{{"a":"b"}}))
    it_raise_to_float32(YAML.parse(%Q{---\n- 1\n- 2\n -3}))
    it_raise_to_float32(YAML.parse(%Q{a:\n  b}))
  end

  describe ".to_float32?" do
    it_to_float32? :foo, nil
    it_to_float32?([1, 2, 3], nil)
    it_to_float32?({"a" => "b"}, nil)
    it_to_float32?({a: "b"}, nil)
    it_to_float32?(JSON::Any.new(raw: true), nil)
    it_to_float32?(JSON::Any.new(raw: false), nil)
    it_to_float32?(YAML::Any.new(raw: true), nil)
    it_to_float32?(YAML::Any.new(raw: false), nil)
    it_to_float32?(JSON.parse(%Q{[1, 2, 3]}), nil)
    it_to_float32?(JSON.parse(%Q{{"a":"b"}}), nil)
    it_to_float32?(YAML.parse(%Q{---\n- 1\n- 2\n -3}), nil)
    it_to_float32?(YAML.parse(%Q{a:\n  b}), nil)
  end

  describe ".to_time" do
    it_to_time Time.local(2018, 1, 20, 1, 20, 33), Time.local(2018, 1, 20, 1, 20, 33)
    it_to_time 0, Time.local(1970, 1, 1, 0, 0, 0, location: Time::Location::UTC)
    it_to_time 1516411233, Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time 1516411233_i64, Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time 1516382433_i64, Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai")), Time::Location.load("Asia/Shanghai")
    it_to_time 1516411233000, Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time 1516382433000, Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai")), Time::Location.load("Asia/Shanghai")
    it_to_time "2018-01-20 01:20:33 +0000 UTC", Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "Tue Jan 20 01:20:33 2018", Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "Tue Jan 20 01:20:33 UTC 2018", Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "Tue Jan 20 01:20:33 +0800 2018", Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai"))
    it_to_time "20 Jan 18 01:20 UTC", Time.local(2018, 1, 20, 1, 20, 0, location: Time::Location::UTC)
    it_to_time "20 Jan 18 01:20 +0800", Time.local(2018, 1, 20, 1, 20, 0, location: Time::Location.load("Asia/Shanghai"))
    it_to_time "Tuesday, 20-Jan-18 01:20:33 UTC", Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "Tue, 20 Jan 2018 01:20:33 GMT", Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "Tue, 20 Jan 2018 01:20:33 +0800", Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai"))
    it_to_time "2018-01-20T01:20:33+08:00", Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai"))
    it_to_time "2018-01-20T01:20:33Z", Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "2018-01-20 01:20:33+08:00", Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "2018-01-20 01:20:33 +0800", Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai"))
    it_to_time "2018-01-20 01:20:33 +0000 UTC", Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "2018-01-20 01:20:33", Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "2018-01-20 01:20:33.000", Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "2018-01-20 01:20:33.000000", Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time "2018-01-20 01:20:33.123456789", Time.local(2018, 1, 20, 1, 20, 33, nanosecond: 123456789, location: Time::Location::UTC)
    it_to_time "2018-01-20", Time.local(2018, 1, 20, 0, 0, 0, location: Time::Location::UTC)
    it_to_time "2018-01-20", Time.local(2018, 1, 20, 0, 0, 0, location: Time::Location::UTC)
    it_to_time "2018-01-20 01:20:33", Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai")), Time::Location.load("Asia/Shanghai")
    it_to_time "2018-01-20 01:20", Time.local(2018, 1, 20, 1, 20, 0, location: Time::Location.load("Asia/Shanghai")), Time::Location.load("Asia/Shanghai"), ["%F %H:%M"]

    it_to_time JSON::Any.new(raw: 0_i64), Time.local(1970, 1, 1, 0, 0, 0, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: 1516411233_i64), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: 1516382433_i64), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai")), Time::Location.load("Asia/Shanghai")
    it_to_time JSON::Any.new(raw: 1516411233000), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: 1516382433000), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai")), Time::Location.load("Asia/Shanghai")
    it_to_time JSON::Any.new(raw: "2018-01-20 01:20:33 +0000 UTC"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: "Tue Jan 20 01:20:33 2018"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: "Tue Jan 20 01:20:33 UTC 2018"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: "Tue Jan 20 01:20:33 +0800 2018"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai"))
    it_to_time JSON::Any.new(raw: "20 Jan 18 01:20 UTC"), Time.local(2018, 1, 20, 1, 20, 0, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: "20 Jan 18 01:20 +0800"), Time.local(2018, 1, 20, 1, 20, 0, location: Time::Location.load("Asia/Shanghai"))
    it_to_time JSON::Any.new(raw: "Tuesday, 20-Jan-18 01:20:33 UTC"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: "Tue, 20 Jan 2018 01:20:33 GMT"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: "Tue, 20 Jan 2018 01:20:33 +0800"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai"))
    it_to_time JSON::Any.new(raw: "2018-01-20T01:20:33+08:00"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai"))
    it_to_time JSON::Any.new(raw: "2018-01-20T01:20:33Z"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: "2018-01-20 01:20:33+08:00"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: "2018-01-20 01:20:33 +0800"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai"))
    it_to_time JSON::Any.new(raw: "2018-01-20 01:20:33 +0000 UTC"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: "2018-01-20 01:20:33"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: "2018-01-20 01:20:33.000"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: "2018-01-20 01:20:33.000000"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: "2018-01-20 01:20:33.123456789"), Time.local(2018, 1, 20, 1, 20, 33, nanosecond: 123456789, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: "2018-01-20"), Time.local(2018, 1, 20, 0, 0, 0, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: "2018-01-20"), Time.local(2018, 1, 20, 0, 0, 0, location: Time::Location::UTC)
    it_to_time JSON::Any.new(raw: "2018-01-20 01:20:33"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai")), Time::Location.load("Asia/Shanghai")
    it_to_time JSON::Any.new(raw: "2018-01-20 01:20"), Time.local(2018, 1, 20, 1, 20, 0, location: Time::Location.load("Asia/Shanghai")), Time::Location.load("Asia/Shanghai"), ["%F %H:%M"]

    it_to_time YAML::Any.new(raw: Time.local(2018, 1, 20, 1, 20, 33)), Time.local(2018, 1, 20, 1, 20, 33)
    it_to_time YAML::Any.new(raw: 0_i64), Time.local(1970, 1, 1, 0, 0, 0, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: 1516411233_i64), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: 1516382433_i64), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai")), Time::Location.load("Asia/Shanghai")
    it_to_time YAML::Any.new(raw: 1516411233000), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: 1516382433000), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai")), Time::Location.load("Asia/Shanghai")
    it_to_time YAML::Any.new(raw: "2018-01-20 01:20:33 +0000 UTC"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: "Tue Jan 20 01:20:33 2018"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: "Tue Jan 20 01:20:33 UTC 2018"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: "Tue Jan 20 01:20:33 +0800 2018"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai"))
    it_to_time YAML::Any.new(raw: "20 Jan 18 01:20 UTC"), Time.local(2018, 1, 20, 1, 20, 0, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: "20 Jan 18 01:20 +0800"), Time.local(2018, 1, 20, 1, 20, 0, location: Time::Location.load("Asia/Shanghai"))
    it_to_time YAML::Any.new(raw: "Tuesday, 20-Jan-18 01:20:33 UTC"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: "Tue, 20 Jan 2018 01:20:33 GMT"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: "Tue, 20 Jan 2018 01:20:33 +0800"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai"))
    it_to_time YAML::Any.new(raw: "2018-01-20T01:20:33+08:00"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai"))
    it_to_time YAML::Any.new(raw: "2018-01-20T01:20:33Z"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: "2018-01-20 01:20:33+08:00"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: "2018-01-20 01:20:33 +0800"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai"))
    it_to_time YAML::Any.new(raw: "2018-01-20 01:20:33 +0000 UTC"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: "2018-01-20 01:20:33"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: "2018-01-20 01:20:33.000"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: "2018-01-20 01:20:33.000000"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: "2018-01-20 01:20:33.123456789"), Time.local(2018, 1, 20, 1, 20, 33, nanosecond: 123456789, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: "2018-01-20"), Time.local(2018, 1, 20, 0, 0, 0, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: "2018-01-20"), Time.local(2018, 1, 20, 0, 0, 0, location: Time::Location::UTC)
    it_to_time YAML::Any.new(raw: "2018-01-20 01:20:33"), Time.local(2018, 1, 20, 1, 20, 33, location: Time::Location.load("Asia/Shanghai")), Time::Location.load("Asia/Shanghai")
    it_to_time YAML::Any.new(raw: "2018-01-20 01:20"), Time.local(2018, 1, 20, 1, 20, 0, location: Time::Location.load("Asia/Shanghai")), Time::Location.load("Asia/Shanghai"), ["%F %H:%M"]

    it_raise_to_time(nil)
    it_raise_to_time("2018")
    it_raise_to_time("Nov 10 23:00:00")
    it_raise_to_time("11:00PM")
  end

  describe ".to_time?" do
    it_to_time? nil, nil
    it_to_time? "2018", nil
    it_to_time? "Nov 10 23:00:00", nil
    it_to_time? "11:00PM", nil
  end

  describe ".to_bool" do
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
    it_to_bool({a: "b"}, true)
    it_to_bool([1, 2, 3], true)
    it_to_bool(Array(String).new, false)
    it_to_bool({"a" => "b"}, true)
    it_to_bool(Hash(String, String).new, false)

    it_to_bool JSON::Any.new(raw: true), true
    it_to_bool JSON::Any.new(raw: false), false
    it_to_bool JSON::Any.new(raw: "true"), true
    it_to_bool JSON::Any.new(raw: "TRUE"), true
    it_to_bool JSON::Any.new(raw: "True"), true
    it_to_bool JSON::Any.new(raw: "false"), false
    it_to_bool JSON::Any.new(raw: "FALSE"), false
    it_to_bool JSON::Any.new(raw: "False"), false
    it_to_bool JSON::Any.new(raw: "T"), true
    it_to_bool JSON::Any.new(raw: "Yes"), true
    it_to_bool JSON::Any.new(raw: "Y"), true
    it_to_bool JSON::Any.new(raw: "on"), true
    it_to_bool JSON::Any.new(raw: "1"), true
    it_to_bool JSON::Any.new(raw: "f"), false
    it_to_bool JSON::Any.new(raw: "no"), false
    it_to_bool JSON::Any.new(raw: "off"), false
    it_to_bool JSON::Any.new(raw: "0"), false
    it_to_bool JSON::Any.new(raw: 1_i64), true
    it_to_bool JSON::Any.new(raw: 10.1), true
    it_to_bool JSON::Any.new(raw: -1_i64), true
    it_to_bool JSON::Any.new(raw: 0_i64), false

    it_to_bool YAML::Any.new(raw: true), true
    it_to_bool YAML::Any.new(raw: false), false
    it_to_bool YAML::Any.new(raw: "true"), true
    it_to_bool YAML::Any.new(raw: "TRUE"), true
    it_to_bool YAML::Any.new(raw: "True"), true
    it_to_bool YAML::Any.new(raw: "false"), false
    it_to_bool YAML::Any.new(raw: "FALSE"), false
    it_to_bool YAML::Any.new(raw: "False"), false
    it_to_bool YAML::Any.new(raw: "T"), true
    it_to_bool YAML::Any.new(raw: "Yes"), true
    it_to_bool YAML::Any.new(raw: "Y"), true
    it_to_bool YAML::Any.new(raw: "on"), true
    it_to_bool YAML::Any.new(raw: "1"), true
    it_to_bool YAML::Any.new(raw: "f"), false
    it_to_bool YAML::Any.new(raw: "no"), false
    it_to_bool YAML::Any.new(raw: "off"), false
    it_to_bool YAML::Any.new(raw: "0"), false
    it_to_bool YAML::Any.new(raw: 1_i64), true
    it_to_bool YAML::Any.new(raw: 10.1), true
    it_to_bool YAML::Any.new(raw: -1_i64), true
    it_to_bool YAML::Any.new(raw: 0_i64), false

    it_raise_to_bool "foo"
    it_raise_to_bool :foo
    it_raise_to_bool(JSON.parse(%Q{[1, 2, 3]}))
    it_raise_to_bool(JSON.parse(%Q{{"a":"b"}}))
    it_raise_to_bool(YAML.parse(%Q{---\n- 1\n- 2\n- 3}))
    it_raise_to_bool(YAML.parse(%Q{a:\n  b}))
  end

  describe ".to_bool?" do
    it_to_bool? "foo", nil
    it_to_bool? :foo, nil
  end

  describe ".to_array" do
    it_to_array "foo", ["foo"]
    it_to_array :foo, ["foo"]
    it_to_array 1_i8, ["1"]
    it_to_array 1.23, ["1.23"]
    it_to_array 1.23, [1.23], Float64
    it_to_array 1, [true], Bool
    it_to_array [1, 2, 3], [1, 2, 3]
    it_to_array({"a" => "b"}, ["a", "b"])

    it_to_array JSON::Any.new(raw: true), ["true"]
    it_to_array JSON::Any.new(raw: true), [true], Bool
    it_to_array JSON::Any.new(raw: false), [0], Int32
    it_to_array JSON.parse(%Q{[1, 2, 3]}), [1, 2, 3], Int32
    it_to_array JSON.parse(%Q{{"a":"b"}}), ["a", "b"]

    it_to_array YAML::Any.new(raw: true), ["true"]
    it_to_array YAML::Any.new(raw: true), [true], Bool
    it_to_array YAML::Any.new(raw: false), [0], Int32
    it_to_array YAML.parse(%Q{---\n- 1\n- 2\n- 3\n}), [1, 2, 3], Int32
    it_to_array YAML.parse(%Q{---\na: b}), ["a", "b"]
  end

  describe ".to_hash" do
    it_to_hash({"a" => "1", "b" => 2}, {"a" => "1", "b" => 2})

    it_raise_to_hash "foo"
    it_raise_to_hash :foo
    it_raise_to_hash 1_i8
    it_raise_to_hash 1.23
    it_raise_to_hash 1.23
    it_raise_to_hash 1
    it_raise_to_hash [1, 2, 3]
  end

  describe ".to_hash?" do
    it_to_hash? "foo", nil
    it_to_hash? :foo, nil
    it_to_hash? 1_i8, nil
    it_to_hash? 1.23, nil
    it_to_hash? 1.23, nil
    it_to_hash? 1, nil
    it_to_hash? [1, 2, 3], nil
  end

  describe ".to_string" do
    it_to_string 123_i8, "123"
    it_to_string 123_i64, "123"
    it_to_string 123.45, "123.45"
    it_to_string false, "false"
    it_to_string :foo, "foo"
    it_to_string nil, ""
    it_to_string [1,2,3], "[1, 2, 3]"
    it_to_string({"a" => "b", "c" => "d"}, %Q{{"a" => "b", "c" => "d"}})
  end
end
