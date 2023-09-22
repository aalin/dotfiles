Pry.config.editor = proc { |file, line| "nvim +#{line} #{file}" }

# Some things I commonly use
require "securerandom"
require "base64"
require "base64"
require "digest/sha2"
require "cgi"

# Some prepared objects to use when trying things
a = %w(foo bar baz waz)
h = { foo: 1, bar: 2, baz: { waz: 3 } }
s = "foo bar baz waz"
x = ["foo", { bar: 123 }, baz: { waz: %w(cat hat bat) }]
Vec3 = Data.define(:x, :y, :z)
