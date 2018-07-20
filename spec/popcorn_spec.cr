require "./spec_helper"

private METHODS = [
  "to_bool", "to_i", "to_i64", "to_f", "to_f32", "to_time"
]

{% for method in METHODS %}
  private def it_{{ method.id }}(input, expected, file = __FILE__, line = __LINE__)
    it "should casts #{input}", file, line do
      Popcorn.{{ method.id }}(input).should eq expected
    end
  end

  private def it_{{ method.id }}?(input, expected, file = __FILE__, line = __LINE__)
    it "should casts #{input}", file, line do
      Popcorn.{{ method.id }}?(input).should eq expected
    end
  end

  private def it_raise_{{ method.id }}(input, file = __FILE__, line = __LINE__)
    it "throws an exception to casts #{input}", file, line do
      expect_raises TypeCastError, file: file, line: line do
        Popcorn.{{ method.id }}(input)
      end
    end
  end
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

  describe "to_i" do
    it_to_i 1, 1
    it_to_i -123, -123
    it_to_i 1.234567890, 1
    it_to_i 1.67890, 1
    it_to_i -1, -1
    it_to_i 123456789123456, -2045800064
    it_to_i -123456789123456, 2045800064
    it_to_i true, 1
    it_to_i false, 0
    it_to_i "123", 123
    it_to_i "123.4", 123
    it_to_i "123true", 123
    it_to_i "123true456", 123
    it_to_i "true", 0

    it_raise_to_i :foo
    it_raise_to_i([1,2,3])
    it_raise_to_i({"a" => "b"})
    it_raise_to_i({a: "b"})
  end

  # describe "to_f" do
  #   it_to_f 1, 1
  #   it_to_f -123, -123
  #   it_to_f 1.234567890, 1
  #   it_to_f 1.67890, 1
  #   it_to_f -1, -1
  #   it_to_f 123456789123456, -2045800064
  #   it_to_f -123456789123456, 2045800064
  #   it_to_f true, 1
  #   it_to_f false, 0
  #   it_to_f "123", 123
  #   it_to_f "123.4", 123
  #   it_to_f "123true", 123
  #   it_to_f "123true456", 123
  #   it_to_f "true", 0
  # end
end
