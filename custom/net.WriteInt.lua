---Appends a signed integer - a whole number, positive/negative - to the current net message. Can be read back with [net.ReadInt](https://wiki.facepunch.com/gmod/net.ReadInt) on the receiving end.
---
--- Use [net.WriteUInt](https://wiki.facepunch.com/gmod/net.WriteUInt) to send an unsigned number (that you know will **never** be negative). Use [net.WriteFloat](https://wiki.facepunch.com/gmod/net.WriteFloat) for a non-whole number (e.g. `2.25`).
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteInt
---@param integer number The integer to be sent.
---@[call_arg("gmod.net_payload", "bits")]
---@param bitCount number The amount of bits the number consists of. This must be **32** or less.
--[[

If you are unsure what to set, just set it to `32`.

Consult the table below to determine the bit count you need:

| Bit Count |  Minimum value |  Maximum value |
|-----------|:--------------:|:--------------:|
| 3 | -4 | 3 |
| 4 | -8 | 7 |
| 5 | -16 | 15 |
| 6 | -32 | 31 |
| 7 | -64 | 63 |
| 8 | -128 | 127 |
| 9 | -256 | 255 |
| 10 | -512 | 511 |
| 11 | -1,024 | 1,023 |
| 12 | -2,048 | 2,047 |
| 13 | -4,096 | 4,095 |
| 14 | -8,192 | 8,191 |
| 15 | -16,384 | 16,383 |
| 16 | -32,768 | 32,767 |
| 17 | -65,536 | 65,535 |
| 18 | -131,072 | 131,071 |
| 19 | -262,144 | 262,143 |
| 20 | -524,288 | 524,287 |
| 21 | -1,048,576 | 1,048,575 |
| 22 | -2,097,152 | 2,097,151 |
| 23 | -4,194,304 | 4,194,303 |
| 24 | -8,388,608 | 8,388,607 |
| 25 | -16,777,216 | 16,777,215 |
| 26 | -33,554,432 | 33,554,431 |
| 27 | -67,108,864 | 67,108,863 |
| 28 | -134,217,728 | 134,217,727 |
| 29 | -268,435,456 | 268,435,455 |
| 30 | -536,870,912 | 536,870,911 |
| 31 | -1,073,741,824 | 1,073,741,823 |
| 32 | -2,147,483,648 | 2,147,483,647 |
--]]
---@[net_payload("write", "int")]
function net.WriteInt(integer, bitCount) end
