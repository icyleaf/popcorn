require "json/any"
require "yaml/any"

module Popcorn
  module Casting
    # Returns the `Int32` value represented by given data type.
    def to_int(v : T) forall T
      case v
      when Bool
        v.as(Bool) ? 1 : 0
      when Int
        v.as(Int).to_i
      when Float
        v.as(Float).to_i
      when Nil
        0
      when String
        value = v.as(String).to_i?(strict: false)
        value ? value : 0
      else
        raise TypeCastError.new("cast from #{T} to Bool failed. at #{__FILE__}:#{__LINE__}")
      end
    end

    # Returns the `Int64` value represented by given data type.
    def to_int64(v : T) forall T
    end

    # Returns the `Float64` value represented by given data type.
    def to_float(v : T) forall T
    end

    # Returns the `Float32` value represented by given data type.
    def to_float32(v : T) forall T
    end

    # Returns the `Time` value represented by given data type.
    def to_time(v : T) forall T
    end

    # Returns the `Bool` value represented by given data type.
    # It accepts true, t, yes, y, on, 1, false, f, no, n, off, 0. Any other value return an error.
    def to_bool(v : T) forall T
      value = case v
      when Bool
        v.as(Bool)
      when Int
        !v.as(Int).zero?
      when Float
        !v.as(Float).zero?
      when Nil
        false
      when Symbol
        to_bool(v.as(Symbol).to_s)
      when JSON::Any
        v.as(JSON::Any).as_bool
      when YAML::Any
        if object = v.as(YAML::Any).as_s?
          to_bool(object)
        end
      when String
        object = v.as(String).downcase
        if %w(true t yes y on 1).includes?(object)
          true
        elsif %w(false f no n off 0).includes?(object)
          false
        end
      end

      raise TypeCastError.new("cast from #{T} to Bool failed. at #{__FILE__}:#{__LINE__}") if value.nil?

      value
    end

    {% for method in @type.methods %}
      def {{ method.name.id }}?(v : T) forall T
        # Returns the `{{ method.name }}` value represented by given data type. If can not convert return nil.
        {{ method.name.id }}(v)
      rescue TypeCastError
        nil
      end
    {% end %}
  end
end
