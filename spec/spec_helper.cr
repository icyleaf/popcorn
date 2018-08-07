require "spec"
require "json"
require "yaml"
require "../src/popcorn"
require "../src/popcorn/injection"

def it_cast(input, other, expected, file = __FILE__, line = __LINE__)
  it "should casts #{input} from {input.class} to #{other}", file, line do
    Popcorn.cast(input, other).should eq(expected)
  end
end

def it_cast?(input, other, expected, file = __FILE__, line = __LINE__)
  it "should casts #{input} from {input.class}", file, line do
    Popcorn.cast?(input, other).should eq(expected)
  end
end

def it_raises_cast(input, other, file = __FILE__, line = __LINE__)
  it "should casts #{input} from {input.class}", file, line do
    expect_raises TypeCastError, file: file, line: line do
      Popcorn.cast(input, other)
    end
  end
end

{% for method in Popcorn::Cast.methods %}
  {% if method.name.starts_with?("to_") %}
    def it_{{ method.name.id }}(input : {{ method.args[0].restriction.id }}, expected{% if method.name.starts_with?("to_time") %}, location : Time::Location? = nil, formatters : Array(String)? = nil{% elsif method.name.starts_with?("to_array") || method.name.starts_with?("to_hash") %}, target = String{% end %}, file = __FILE__, line = __LINE__)
      it "should casts {% if method.args[0].restriction.id == "String".id %}\"#{input}\"{% else %}#{input}{% end %} from #{input.class}", file, line do
        Popcorn.{{ method.name.id }}(input{% if method.name.starts_with?("to_time") %}, location, formatters{% elsif method.name.starts_with?("to_array") || method.name.starts_with?("to_hash") %}, target{% end %}).should eq(expected)
      end
    end

    {% if !method.name.ends_with?("?") %}
      def it_raise_{{ method.name.id }}(input : {{ method.args[0].restriction.id }}, file = __FILE__, line = __LINE__)
        it "throws an exception to casts #{input.class}: #{input}", file, line do
          expect_raises TypeCastError, file: file, line: line do
            Popcorn.{{ method.name.id }}(input)
          end
        end
      end
    {% end %}
  {% end %}
{% end %}
