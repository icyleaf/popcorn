require "./popcorn/version"
require "./popcorn/cast"

# Popcorn is easy and safe from one type to another tool.
#
# Popcorn proviedes a handful of `to_xxx`/`to_xxx?` methods and `xxx` is full type name,
# This is distinguish between built-in methods in Crystal.
#
# - to_int
# - to_int8
# - to_int16
# - to_int64
# - to_float
# - to_float32
# - to_bool
# - to_string (alias to to_s in Crystal).
# - to_time
#
# Also these methods had been inject to Crystal literals, you can call it directly, such like:
#
# ```
# Popcorn.to_int("123abc")                # => 123
# Popcorn.to_bool("No")                   # => false
# Popcorn.to_time("2018-01-20T01:20:33Z") # => Time.new(2018, 1, 20, 1, 20, 33, location: Time::Location::UTC)
# ```
#
# More methods to review `Popcorn::Cast`.
module Popcorn
  extend Cast
end
