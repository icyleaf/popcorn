require "json/any"
require "yaml/any"

module Popcorn
  module Casting
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

    def to_int64(v : T) forall T
    end

    def to_float(v : T) forall T
    end

    def to_float32(v : T) forall T
    end

    def to_time(v : T) forall T
    end

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
        {{ method.name.id }}(v)
      rescue TypeCastError
        nil
      end
    {% end %}
  end
end
