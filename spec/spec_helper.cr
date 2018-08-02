require "spec"
require "json"
require "yaml"
require "../src/popcorn"
require "../src/popcorn/injection"

{% for method in Popcorn::Cast.methods %}
  {% if method.name.starts_with?("to_") %}
    private def it_{{ method.name.id }}(input : {{ method.args[0].restriction.id }}, expected{% if method.name.starts_with?("to_time") %}, location : Time::Location? = nil, formatters : Array(String)? = nil{% end %}, except = [] of String, file = __FILE__, line = __LINE__)
      it "should casts {% if method.args[0].restriction.id == "String".id %}\"#{input}\"{% else %}#{input}{% end %} from #{input.class}", file, line do
        Popcorn.{{ method.name.id }}(input{% if method.name.starts_with?("to_time") %}, location, formatters{% end %}).should eq(expected)
      end
    end

    {% if !method.name.ends_with?("?") %}
      private def it_raise_{{ method.name.id }}(input : {{ method.args[0].restriction.id }}, file = __FILE__, line = __LINE__)
        it "throws an exception to casts #{input.class}: #{input}", file, line do
          expect_raises TypeCastError, file: file, line: line do
            Popcorn.{{ method.name.id }}(input)
          end
        end
      end
    {% end %}
  {% end %}
{% end %}
