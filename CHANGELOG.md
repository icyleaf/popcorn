# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

> TODO

## 0.1.0 (2018-07-24)

First beta version.

## Add

Provides methods:

- [x] to_int8
- [x] to_int16
- [x] to_int
- [x] to_int64
- [x] to_float32
- [x] to_float64
- [x] to_bool
- [x] to_time(location : Time::Location? = nil, formatters : Array(String)? = nil)

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
