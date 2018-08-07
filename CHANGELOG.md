# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

> TODO

## [0.2.0] (2018-08-07)

## Added

- Add `cast(raw : S, target_type : T.class = String)`/`cast?` methods to casts Type easily.
- Add `to_array`/`to_hash`/`to_string` methods.

## Changed

- Split all methods to each file by type, it is not to accpets all Type.
- Rename `raise_error!` to `cast_error!`

## Fixed

- Fix duplicate to_xxx methods during multi-call `generate!` method

## [0.1.1] (2018-07-24)

## Added

- to_uint8
- to_uint16
- to_uint (alias to to_uint32)
- to_uint64

Monkey Patching list:

- UInt8/UInt16/UInt32/UInt64

## [0.1.0] (2018-07-24)

First beta version.

## Added

Provides methods:

- to_int8
- to_int16
- to_int (alias to to_int32)
- to_int64
- to_float32
- to_float64
- to_bool
- to_time(location : Time::Location? = nil, formatters : Array(String)? = nil)
- to_string (alias to to_s in Crystal).

Monkey Patching list:

- String
- Int8/Int16/Int32/Int64
- Float32/Float64
- Bool
- Time
- JSON::Any
- YAML::Any

[Unreleased]: https://github.com/icyleaf/popcorn/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/icyleaf/popcorn/compare/25a00baffd41f4ac8a071330038916375904b46d...v0.1.0
