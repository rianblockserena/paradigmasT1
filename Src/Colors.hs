module Src.Colors where

-- a repo of colors in ANSI format

-- retorna cor no formato ANSI de um index
translateColor :: Integer -> String
translateColor colorId = (colors !! ( fromIntegral colorId ))


colors = [eColor, white, green, yellow, blue, magenta, red, white, green, yellow, blue, magenta, red]

endColor  =    "\ESC[0m"
eColor    =    "\ESC[1;30m"

red       =    "\ESC[1;31m"
green     =    "\ESC[1;32m"
yellow    =    "\ESC[1;33m"
blue      =    "\ESC[1;34m"
magenta   =    "\ESC[1;35m"
white     =    "\ESC[1;37m"
