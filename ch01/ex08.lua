--[[
script that prints its own name

usage: lua -i ex08.lua

note: If you use `lua -l` or `dofile()`,
it prints the path to the interpreter instead,
because technically that's the current program.
--]]
print(arg[0])
