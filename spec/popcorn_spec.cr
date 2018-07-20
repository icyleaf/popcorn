require "./spec_helper"

{% for method in Popcorn::Casting.methods %}
  private def it_{{ method.name.id }}(input, expected, file = __FILE__, line = __LINE__)
    it "should casts #{input}", file, line do
      Popcorn.{{ method.name.id }}(input).should eq(expected)
    end
  end

  {% if method.name.id.stringify != "?" %}
    private def it_raise_{{ method.name.id }}(input, file = __FILE__, line = __LINE__)
      it "throws an exception to casts #{input}", file, line do
        expect_raises TypeCastError, file: file, line: line do
          Popcorn.{{ method.name.id }}(input)
        end
      end
    end
  {% end %}
{% end %}

describe Popcorn do
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
    it_raise_to_bool([1,2,3])
    it_raise_to_bool({"a" => "b"})
    it_raise_to_bool({a: "b"})
  end

  describe "to_bool?" do
    it_to_bool? true, true
    it_to_bool? false, false
    it_to_bool? "true", true
    it_to_bool? "TRUE", true
    it_to_bool? "True", true
    it_to_bool? "false", false
    it_to_bool? "FALSE", false
    it_to_bool? "False", false
    it_to_bool? "T", true
    it_to_bool? "Yes", true
    it_to_bool? "Y", true
    it_to_bool? "on", true
    it_to_bool? "1", true
    it_to_bool? "f", false
    it_to_bool? "no", false
    it_to_bool? "off", false
    it_to_bool? "0", false
    it_to_bool? :true, true
    it_to_bool? :false, false
    it_to_bool? 1, true
    it_to_bool? 10.1, true
    it_to_bool? -1, true
    it_to_bool? 0, false

    it_to_bool? "foo", nil
    it_to_bool? :foo, nil
    it_to_bool?([1,2,3], nil)
    it_to_bool?({"a" => "b"}, nil)
    it_to_bool?({a: "b"}, nil)
  end

  describe "to_int" do
    it_to_int 1, 1
    it_to_int -123, -123
    it_to_int 1.234567890, 1
    it_to_int 1.67890, 1
    it_to_int -1, -1
    it_to_int 123456789123456, -2045800064
    it_to_int -123456789123456, 2045800064
    it_to_int true, 1
    it_to_int false, 0
    it_to_int "123", 123
    it_to_int "123.4", 123
    it_to_int "123true", 123
    it_to_int "123true456", 123
    it_to_int "true", 0

    it_raise_to_int :foo
    it_raise_to_int([1,2,3])
    it_raise_to_int({"a" => "b"})
    it_raise_to_int({a: "b"})
  end

  describe "to_int?" do
    it_to_int? 1, 1
    it_to_int? -123, -123
    it_to_int? 1.234567890, 1
    it_to_int? 1.67890, 1
    it_to_int? -1, -1
    it_to_int? 123456789123456, -2045800064
    it_to_int? -123456789123456, 2045800064
    it_to_int? true, 1
    it_to_int? false, 0
    it_to_int? "123", 123
    it_to_int? "123.4", 123
    it_to_int? "123true", 123
    it_to_int? "123true456", 123
    it_to_int? :foo, nil
    it_to_int?([1,2,3], nil)
    it_to_int?({"a" => "b"}, nil)
    it_to_int?({a: "b"}, nil)
  end

  # describe "to_float" do
  #   it_to_float 1, 1
  #   it_to_float -123, -123
  #   it_to_float 1.234567890, 1
  #   it_to_float 1.67890, 1
  #   it_to_float -1, -1
  #   it_to_float 123456789123456, -2045800064
  #   it_to_float -123456789123456, 2045800064
  #   it_to_float true, 1
  #   it_to_float false, 0
  #   it_to_float "123", 123
  #   it_to_float "123.4", 123
  #   it_to_float "123true", 123
  #   it_to_float "123true456", 123
  #   it_to_float "true", 0
  # end
end
