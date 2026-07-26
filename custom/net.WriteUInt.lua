---Appends an unsigned integer with the specified number of bits to the current net message.
---
--- Use [net.WriteInt](https://wiki.facepunch.com/gmod/net.WriteInt) if you want to send negative and positive numbers. Use [net.WriteFloat](https://wiki.facepunch.com/gmod/net.WriteFloat) for a non-whole number (e.g. `2.25`).
---
--- **NOTE**: Unsigned numbers **do not** support negative numbers.
---@realm shared
---@source https://wiki.facepunch.com/gmod/net.WriteUInt
---@param unsignedInteger number The unsigned integer to be sent.
---@[call_arg("gmod.net_payload", "bits")]
---@param bitCount number The size of the integer to be sent, in bits. Acceptable values range from any number `1` to `32` inclusive.
--[[

For reference: `1` = bit, `4` = nibble, `8` = byte, `16` = short, `32` = long.

Consult the table below to determine the bit count you need. The minimum value for all bit counts is `0`.

| Bit Count |  Maximum value |
|-----------|:--------------:|
| 1 | 1  |
| 2 | 3  |
| 3 | 7  |
| 4 | 15 |
| 5 | 31 |
| 6 | 63 |
| 7 | 127 |
| 8 | 255 |
| 9 | 511 |
| 10 | 1,023 |
| 11 | 2,047 |
| 12 | 4,095 |
| 13 | 8,191 |
| 14 | 16,383 |
| 15 | 32,767 |
| 16 | 65,535 |
| 17 | 131,071 |
| 18 | 262,143 |
| 19 | 524,287  |
| 20 | 1,048,575  |
| 21 | 2,097,151  |
| 22 | 4,194,303  |
| 23 | 8,388,607  |
| 24 | 16,777,215  |
| 25 | 33,554,431  |
| 26 | 67,108,863  |
| 27 | 134,217,727  |
| 28 | 268,435,455  |
| 29 | 536,870,911  |
| 30 | 1,073,741,823 |
| 31 | 2,147,483,647 |
| 32 | 4,294,967,295 |
--]]
---@[net_payload("write", "uint")]
function net.WriteUInt(unsignedInteger, bitCount) end
