require "./popcorn/version"
require "./popcorn/casting"

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
# "123abc".to_int     # => 123
# "No".to_bool        # => false
# ```
#
# More methods to review `Popcorn::Casting`.
module Popcorn
  extend Casting
end
