a = {}; a.a = a

print(a.a.a.a)

--[[
a = {} --> make `a` a table
a.a = a --> `a.a` is the same table as `a`
a.a.a --> (a.a).a --> a.a --> same table
a.a.a.a --> (a.a).a.a --> a.a.a --> same table
--]]

a.a.a.a = 3

-- this makes `a.a` to be 3:
print(a.a)

-- and now `a.a.a.a` is invalid, because it evaluates to `(3.a).a`
print(a.a.a.a)