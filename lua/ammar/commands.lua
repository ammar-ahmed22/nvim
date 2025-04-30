
-- Highlight when copying text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Uncomment below to re-nable autosave
-- -- Saves file if it is modified 
-- local function save_if_modified()
--     if vim.bo.modified and vim.bo.buftype == "" and vim.bo.buftype ~= "TelescopePrompt" then
--         vim.cmd("write")
--     end
-- end
--
-- -- Autosave if file is modified in normal or visual mode 
-- vim.api.nvim_create_autocmd("TextChanged", {
--     pattern = "*",
--     callback = save_if_modified
-- })
--
-- -- Autosave after insert mode is left (if the file is changed)
-- -- i.e. only save after insert mode is left and the file is changed
-- vim.api.nvim_create_autocmd("InsertLeave", {
--     pattern = "*",
--     callback = save_if_modified
-- })

-- Custom command functions for running stuff in the terminal 
-- Used with :R/:Run 
-- If no argument provided, tries to use saved command 
function HandleRun(args)
    -- No argument but there is saved command 
    if args.args == "" and vim.g.run_command then
        -- Confirm, maybe it was an accident? 
        local confirm = vim.fn.confirm("Do you want to run `" .. vim.g.run_command .. "`?", "&Yes\n&No", 1)
        if confirm == 1 then
            vim.cmd("split | terminal " .. vim.g.run_command)
        end
        return
    end
    -- Give preference to passed argument
    local command = args.args ~= "" and args.args or vim.g.run_command
    if command == nil or command == "" then
        print("No command to run. Set command with :SetRun <CMD>.")
        return
    end
    vim.cmd("split | terminal " .. command)
end
-- Put into insert mode whenever a terminal is opened
-- This allows for exiting with enter after a terminal command is run 
-- or when a new terminal is opened it is ready for use 
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function ()
        vim.cmd("startinsert")
    end
})

-- Used with :SR/:SetRun 
function HandleSetRun(args)
    vim.g.run_command = args.args
    print("Run command set to: `" .. args.args .. "`")
end

-- Used with :GR/GetRun 
function HandleGetRun()
   local cmd = vim.g.run_command
   if cmd ~= nil then
       print("Run command: `" .. cmd .. "`")
   else
       print("No command set. Set command with :SetRun <CMD>")
   end
end

-- All the above commands
vim.api.nvim_create_user_command("R", HandleRun, { nargs = "?" })
vim.api.nvim_create_user_command("Run", HandleRun, { nargs = "?" })
vim.api.nvim_create_user_command("SetRun", HandleSetRun, { nargs = 1 })
vim.api.nvim_create_user_command("SR", HandleSetRun, { nargs = 1 })
vim.api.nvim_create_user_command("GetRun", HandleGetRun, { nargs = 0 })
vim.api.nvim_create_user_command("GR", HandleGetRun, { nargs = 0 })


-- Custom terminal command to run/open in horizontal window 
function HandleTerminal(args)
    vim.cmd("split | terminal " .. (args.args or ""))
end

vim.api.nvim_create_user_command("Term", HandleTerminal, { nargs = "?" })
vim.api.nvim_create_user_command("Terminal", HandleTerminal, { nargs = "?" })


function HandleGitCommit()
  local commit_msg = vim.fn.input("Provide a commit message: ")

  if commit_msg ~= "" then
    vim.cmd("!git commit -m \"" .. commit_msg .. "\"")
  else
    print("No commit message provided. Aborting.")
  end
end

vim.api.nvim_create_user_command("Commit", HandleGitCommit, { nargs = 0 })
vim.api.nvim_create_user_command("Aider", function(args)
    local arguments = (#args.fargs > 0) and table.concat(args.fargs, " ") or ""
    local cmd = "aider" .. (arguments ~= "" and (" " .. arguments) or "")
    vim.cmd("vsplit")
    vim.cmd("terminal " .. cmd)
    local term_buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(term_buf, "bufhidden", "hide")
    vim.g.aider_buf = term_buf
    vim.api.nvim_create_autocmd("TermClose", {
         buffer = term_buf,
         callback = function(event)
             vim.api.nvim_buf_delete(event.buf, { force = true })
             if vim.g.aider_buf == event.buf then
                 vim.g.aider_buf = nil
             end
         end,
    })
end, { nargs = "*" })
vim.api.nvim_create_user_command("AiderAdd", function()
    local path = vim.api.nvim_buf_get_name(0)
    if path == "" then
        print("Current buffer has no path.")
        return
    end
    if vim.g.aider_buf and vim.api.nvim_buf_is_valid(vim.g.aider_buf) then
        local job_id = vim.b[vim.g.aider_buf].terminal_job_id
        if job_id then
            vim.fn.chansend(job_id, "/add " .. path .. "\n")
        else
            print("Aider terminal job not found.")
        end
    else
        print("No open Aider terminal.")
    end
end, { nargs = 0 })
vim.api.nvim_create_user_command("AiderDrop", function()
    local path = vim.api.nvim_buf_get_name(0)
    if path == "" then
        print("Current buffer has no path.")
        return
    end
    if vim.g.aider_buf and vim.api.nvim_buf_is_valid(vim.g.aider_buf) then
        local job_id = vim.b[vim.g.aider_buf].terminal_job_id
        if job_id then
            vim.fn.chansend(job_id, "/drop " .. path .. "\n")
        else
            print("Aider terminal job not found.")
        end
    else
        print("No open Aider terminal.")
    end
end, { nargs = 0 })
