---@alias HTTPRequestHeaderValue string
---@alias HTTPRequestHeaders table<string, HTTPRequestHeaderValue>

---@alias HTTPResponseHeaderValue string
---@alias HTTPResponseHeaders table<string, HTTPResponseHeaderValue>

---@alias HTTPRequestParameterValue string|number|boolean
---@alias HTTPRequestParameters table<string, HTTPRequestParameterValue>

---@alias HTTPRequestFailureCallback fun(reason: string)
---@alias HTTPRequestSuccessCallback fun(code: number, body: string, headers: HTTPResponseHeaders)

---@alias HTTPRequestMethodWithParameters
---| "GET"
---| "POST"
---| "HEAD"
---| "get"
---| "post"
---| "head"

---@alias HTTPRequestMethodWithoutParameters
---| "PUT"
---| "DELETE"
---| "PATCH"
---| "OPTIONS"
---| "put"
---| "delete"
---| "patch"
---| "options"

---@alias HTTPRequestMethod HTTPRequestMethodWithParameters|HTTPRequestMethodWithoutParameters

--- Table used by [Global.HTTP](https://wiki.facepunch.com/gmod/Global.HTTP) function.
--- Common request fields shared by all supported HTTP methods.
---@realm shared
---@realm menu
---@source https://wiki.facepunch.com/gmod/Structures/HTTPRequest
---@class (partial) HTTPRequest
---Function to be called on failure.
---
--- Function argument(s):
--- * string `reason` - Reason for the failure.
---@field failed? HTTPRequestFailureCallback
---Function to be called on success.
---
--- Function argument(s):
--- * number `code` - The HTTP result code
--- * string `body` - The document data, usually HTML or JSON contents.
--- * table `headers` - List of headers the server provided.
---@field success? HTTPRequestSuccessCallback
---Request method, case insensitive. Common values are:
--- * GET
--- * POST
--- * HEAD
--- * PUT
--- * DELETE
--- * PATCH
--- * OPTIONS
---@field method string="GET"
---The target url.
---@field url string
---KeyValue table for [URL parameters](https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams).
---
--- Valid only for `GET`, `POST`, and `HEAD`.
--- For `POST`, `body` takes precedence and parameters are ignored when both are supplied.
---@field parameters? HTTPRequestParameters
---KeyValue table for headers.
---@field headers? HTTPRequestHeaders
---Body string for request data.
--- Supported by methods such as `POST`, `PUT`, `PATCH`, and `DELETE`.
---@field body? string
---Content type for body.
---@field type string="text/plain; charset=utf-8"
---The timeout for the connection.
---@field timeout number=60
local HTTPRequest = {}

---`GET`, `POST`, and `HEAD` requests may include URL parameters.
--- Omitting `method` is treated as `GET`.
---@class (exact) HTTPRequestWithParameters : HTTPRequest
---Request method, case insensitive.
---@field method HTTPRequestMethodWithParameters="GET"
---KeyValue table for [URL parameters](https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams).
---
--- Valid only for `GET`, `POST`, and `HEAD`.
--- For `POST`, `body` takes precedence and parameters are ignored when both are supplied.
---@field parameters? HTTPRequestParameters

---Methods that do not support the `parameters` field.
---@class (exact) HTTPRequestWithoutParameters : HTTPRequest
---Request method, case insensitive.
---@field method HTTPRequestMethodWithoutParameters
---@field parameters nil
