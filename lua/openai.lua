
function curl(url)
--    local cmd = 'curl -s "' .. url .. '"'
    local handle = io.popen(url)
    local result = handle:read("*a")
    handle:close()
    -- parse the result into a json object
    local obj, err = vim.fn.json_decode(result)
    if err then
        print ("Error:", err)
        return nil
    else
        return obj
    end
    return result
end

-- create a multiline string with [[
local str = [[
curl https://api.openai.com/v1/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
  "model": "code-davinci-002",
  "prompt": "x = 4 \nHere is what the code above is doing:\n1.",
  "temperature": 0,
  "max_tokens": 64,
  "top_p": 1.0,
  "frequency_penalty": 0.0,
  "presence_penalty": 0.0,
  "stop": ["\n"]
}'
]]

print(curl(str)["choices"][1]["text"])
