# Package

version       = "1.9.2"
author        = "RubyKyo"
description   = "Password Generator. Has options to enable special characters, and to only generate a string with only digits, and etc. You can also change the length."
license       = "MIT"
srcDir        = "src"
bin           = @["passwordgen"]


# Dependencies
requires "nim >= 1.6.12","cligen == 1.6.2","checksums == 0.1.0"
