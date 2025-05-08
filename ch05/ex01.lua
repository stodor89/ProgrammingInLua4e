sunday = "monday"; monday = "sunday"
t = {sunday = "monday", [sunday] = monday}
print(t.sunday, t[sunday], t[t.sunday])

--[[
prints: monday  sunday  sunday

This happens because lua differentiates
between `sunday` and `t.sunday`:
- t.sunday --> "monday" (from line 2)
- t[sunday] --> t["monday"] --> "sunday"
- t[t.sunday] --> t["monday"] --> "sunday"
--]]