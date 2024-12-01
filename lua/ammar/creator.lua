local Path = require("plenary.path")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function prompt_creator()
  local created_paths = {} -- To store created files/folders
  local function format_absolute(path)
    return vim.fn.fnamemodify(path, ":~")
  end
  -- Function to create files or directories and update results
  local function create_path(input_path, prompt_bufnr)
    local path = Path:new(vim.fn.expand(input_path))
    if input_path:match("%.%w+$") then
        -- Create parent dirs if does not exist 
        if not path:parent():exists() then
            path:parent():mkdir({ parents = true })
            table.insert(created_paths, "Created parent directory '" .. format_absolute(path:parent():absolute()) .. "'")
        end
        -- File 
        if path:parent():exists() and not path:exists() then
            path:touch()
            table.insert(created_paths, "Created file '" .. format_absolute(path:absolute()) .. "'")
        else
            table.insert(created_paths, "Error: creating file '" .. format_absolute(path:absolute()) .. "'")
        end
    else
        -- Directory
        path:mkdir({ parents = true })
        table.insert(created_paths, "Created directory '" .. format_absolute(path:absolute()) .. "'")
    end

    -- Dynamically update the results
    local picker = action_state.get_current_picker(prompt_bufnr)
    picker:refresh(
      finders.new_table({
        results = created_paths,
      }),
      { reset_prompt = false } -- Keep the input prompt intact
    )
  end

  -- Telescope picker
  pickers.new({
    prompt_title = "Create File/Directory",
    results_title = "Files/Folders Created",
    prompt_prefix = format_absolute(vim.fn.getcwd()) .. "/",
    layout_config = {
      width = 0.5,
      height = 0.3,
    },
    layout_strategy = "center",
    sorting_strategy = "ascending",
    previewer = false,
  }, {
    finder = finders.new_table({
      results = created_paths,
    }),
    sorter = nil,
    attach_mappings = function(prompt_bufnr, map)
      local function accept_input()
        local input_path = action_state.get_current_line()
        if input_path and #input_path > 0 then
          create_path(vim.fn.getcwd() .. "/" .. input_path, prompt_bufnr)
          action_state.get_current_picker(prompt_bufnr):reset_prompt()
        end
      end

      -- Map Enter to create files/folders without closing
      map("i", "<CR>", accept_input)
      map("n", "<CR>", accept_input)

      -- Map Esc to close the picker
      actions.close:enhance({
        post = function()
          print("Exited prompt.")
        end,
      })

      return true
    end,
  }):find()
end

-- Create a user command
vim.api.nvim_create_user_command("PromptCreator", prompt_creator, {})
vim.keymap.set("n", "<leader>n", ":PromptCreator<CR>", { desc = "[N]ew File or Directory Prompt"})
