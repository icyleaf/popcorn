![halite-logo](https://github.com/icyleaf/popcorn/raw/master/logo-small.png)

# Popcorn

[![Language](https://img.shields.io/badge/language-crystal-776791.svg)](https://github.com/crystal-lang/crystal)
[![Tag](https://img.shields.io/github/tag/icyleaf/popcorn.svg)](https://github.com/icyleaf/popcorn/blob/master/CHANGELOG.md)
[![Build Status](https://img.shields.io/circleci/project/github/icyleaf/popcorn/master.svg?style=flat)](https://circleci.com/gh/icyleaf/popcorn)

Easy and Safe popping from one type to another. Popcorn icon by HLD from the [Noun Project](https://thenounproject.com).

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  popcorn:
    github: icyleaf/popcorn
```

## Usage

Popcorn is easy and safe from one type to another tool.

Popcorn proviedes a handful of `to_xxx`/`to_xxx?` methods and `xxx` is full type name,
This is distinguish between built-in methods in Crystal.

- to_int8
- to_int16
- to_int (alias to to_int32)
- to_int64
- to_uint8
- to_uint16
- to_uint (alias to to_uint32)
- to_uint64
- to_float32
- to_float64
- to_bool
- to_time(location : Time::Location? = nil, formatters : Array(String)? = nil)
- to_array(target : T.class = String)
- to_hash(target : T.class = String)
- to_string (alias to to_s in Crystal).

```crystal
require "popcorn"

Popcorn.to_sting("foobar")                                                    # => "foobar"
Popcorn.to_string(8.31)                                                       # => "8.31"
Popcorn.to_int("1")                                                           # => 1
Popcorn.to_int("123abc")                                                      # => 123
Popcorn.to_bool("no")                                                         # => false
Popcorn.to_bool("unkown")                                                     # => raise a `TypeCastError` exception
Popcorn.to_bool?("unkown")                                                    # => nil
Popcorn.to_time("2018-07-23T10:11:22")                                        # => Time.new(2018, 7, 23, 10, 11, 22, location: Time::Location::UTC)
Popcorn.to_time("2018-07-23T10:11:22Z", Time::Location.load("Asia/Shanghai")) # => Time.new(2018, 7, 23, 10, 11, 22, location: Time::Location.load("Asia/Shanghai"))
Popcorn.to_time("Tue, 20 Jan 2018", formatter: ["%a, %d %b %Y"])              # => Time.new(2018, 7, 23, 10, 11, 22, location: Time::Location::UTC)
```

Also these methods had been inject to Crystal literals, you can call it directly, Monkey Patching list:

- String
- Int
- Float
- Bool
- Time
- Symbol
- NamedTupe
- Array
- Hash
- Nil
- JSON::Any
- YAML::Any

```crystal
require "popcorn"
require "popcorn/injection" # => make sure require it!

"foobar".to_string                                                   # => "foobar"
8.31.to_string                                                       # => "8.31"
"1".to_int                                                           # => 1
"123abc".to_int                                                      # => 123
"no".to_bool                                                         # => false
"unkown".to_bool                                                     # => raise a `TypeCastError` exception
"unkown".to_bool?                                                    # => nil
"2018-07-23T10:11:22".to_time                                        # => Time.new(2018, 7, 23, 10, 11, 22, location: Time::Location::UTC)
"2018-07-23T10:11:22Z".to_time(Time::Location.load("Asia/Shanghai")) # => Time.new(2018, 7, 23, 10, 11, 22, location: Time::Location.load("Asia/Shanghai"))
"Tue, 20 Jan 2018".to_time(formatter: ["%a, %d %b %Y"])              # => Time.new(2018, 7, 23, 10, 11, 22, location: Time::Location::UTC)
```

## Casting unmatch class

By desgin in Crystal, we can not match type with `T`(no override by alone type) and no time to match each shard type. so you can write your own.

Reference at [totem](https://github.com/icyleaf/totem/blob/b8bfca5f7a6ded111fc5074205dad7a205040b1d/src/totem/any.cr#L256).

## Contributing

1. Fork it (<https://github.com/icyleaf/popcorn/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [icyleaf](https://github.com/icyleaf) icyleaf - creator, maintainer

## You may also like

- [halite](https://github.com/icyleaf/halite) - Crystal HTTP Requests Client with a chainable REST API, built-in sessions and middlewares.
- [totem](https://github.com/icyleaf/totem) - Load and parse a configuration file or string in JSON, YAML, dotenv formats.
- [poncho](https://github.com/icyleaf/poncho) - A .env parser/loader improved for performance.
- [fast-crystal](https://github.com/icyleaf/fast-crystal) - 💨 Writing Fast Crystal 😍 -- Collect Common Crystal idioms.
