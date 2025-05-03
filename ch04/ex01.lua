code = [=[
<![CDATA[
Hello world
]]>
]=]

print(code)

--[[
Note: The multiline string ignores the newline
after the opening sequence, but not the one before
the closing sequence. So that's why the print statement
above ends with 2 newlines.
--]]

-- alternatively, you can do it the dumb way
code2 = "<![CDATA[\nHello world\n]]>\n"
print(code2)

-- Lua treats these two as equal:
print(code == code2)

