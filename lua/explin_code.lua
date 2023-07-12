-- requre nessesary modules for a telescope picker
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local tb = require('telescope.builtin')

local create_request_string = function (text)
    local str = [[
curl https://api.openai.com/v1/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
  "model": "code-davinci-002",
  "prompt": "]] .. text .. [[ \nHere is what the code above is doing:\n1.",
  "temperature": 0,
  "max_tokens": 64,
  "top_p": 1.0,
  "frequency_penalty": 0.0,
  "presence_penalty": 0.0,
  "stop": ["\n"]
}'
]]
    return str
end

function openai_explain_code(text)
    -- local request_string = create_request_string(text)
    -- local handle = io.popen(text)
    -- local result = handle:read("*a")
    -- handle:close()
    -- parse the result into a json object
    -- vim.fn.cmd('echo "hello"')
    -- local obj = vim.fn.json_decode(result)
    -- local obj = { "test", "test2" }
    --    { obj["choices"][1]["text"] }
    return text .. "   jalsfjdl"
end

local picker_for_openai =  function(opts, params)
    -- when opts are not passed in, set them to an empty table
    opts = opts or {}
    -- create a new picker
    pickers.new(opts, {
        prompt_title = 'colors',
        finder = finders.new_table {
            results = openai_explain_code(params),
        },
        sorter = conf.generic_sorter(opts),
    }):find()
end

function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

local keyset = vim.keymap.set
local opts = { noremap = true, silent = true }


keyset('v', '<space>G', function()
	local text = openai_explain_code(vim.getVisualSelection())
	tb.live_grep({ default_text = text })
end, opts)
