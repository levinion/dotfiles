vim.pack.add({
	{ src = "https://github.com/ibhagwan/fzf-lua" },
})

local fzf = require("fzf-lua")

fzf.setup({
	"default",
	winopts = {
		preview = { default = "bat" },
	},
	fzf_opts = {
		["--layout"] = "reverse",
	},
	keymap = {
		fzf = {
			["ctrl-q"] = "select-all+accept",
		},
	},
})

local function pick_projects()
	local home = vim.uv.os_homedir() or vim.fn.expand("~")
	local roots = { home .. "/Projects", home .. "/work", home .. "/code", home .. "/dev", home }
	local found = {}
	local seen = {}
	for _, root in ipairs(roots) do
		if vim.uv.fs_stat(root) then
			local fd_cmd = string.format("fd --hidden --no-ignore --type d --glob '.git' %s --max-depth 4 2>/dev/null", vim.fn.shellescape(root))
			local handle = io.popen(fd_cmd)
			if handle then
				for line in handle:lines() do
					local proj = vim.fn.fnamemodify(line:gsub("/%.git/?$", ""), ":p"):gsub("/$", "")
					if proj ~= "" and not seen[proj] then
						seen[proj] = true
						table.insert(found, proj)
					end
				end
				handle:close()
			end
			if #found > 0 and root ~= home then break end
		end
	end
	if #found == 0 then
		for _, f in ipairs(vim.v.oldfiles) do
			local dir = vim.fn.fnamemodify(f, ":h")
			if vim.uv.fs_stat(dir) and not seen[dir] then
				seen[dir] = true
				table.insert(found, dir)
				if #found >= 30 then break end
			end
		end
	end
	if #found == 0 then
		vim.notify("No projects found", vim.log.levels.INFO)
		return
	end
	fzf.fzf_exec(found, {
		prompt = "Projects> ",
		actions = {
			["default"] = function(selected)
				if selected and selected[1] then
					vim.cmd("cd " .. vim.fn.fnameescape(selected[1]))
					fzf.files({ cwd = selected[1] })
				end
			end,
		},
	})
end

local function pick_notifications()
	local notify = require("notify")
	local history = notify.history()
	if history and #history > 0 then
		local items = {}
		for _, n in ipairs(history) do
			local msg = n.message
			if type(msg) == "table" then msg = table.concat(msg, " ") end
			msg = tostring(msg):gsub("\n", " "):sub(1, 200)
			local title = ""
			if n.title and type(n.title) == "table" and n.title[1] then
				title = n.title[1]
			elseif type(n.title) == "string" and n.title ~= "" then
				title = n.title
			end
			local level = n.level or "INFO"
			local line = string.format("[%s] %s%s", level, title ~= "" and (title .. ": ") or "", msg)
			table.insert(items, line)
		end
		fzf.fzf_exec(items, {
			prompt = "Notifications> ",
			previewer = false,
			actions = {
				["default"] = function(selected)
					if selected and selected[1] then
						vim.fn.setreg("+", selected[1])
						vim.notify("Copied to clipboard", vim.log.levels.INFO)
					end
				end,
			},
		})
		return
	end
	local msgs = vim.split(vim.fn.execute("messages"), "\n")
	local filtered = {}
	for _, m in ipairs(msgs) do
		if m:match("%S") then table.insert(filtered, m) end
	end
	if #filtered == 0 then
		vim.notify("No messages", vim.log.levels.INFO)
		return
	end
	fzf.fzf_exec(filtered, { prompt = "Messages> " })
end

local function pick_undo()
	if vim.fn.exists(":UndotreeToggle") == 2 then
		vim.cmd("UndotreeToggle")
		return
	end
	local ok, ut = pcall(vim.fn.undotree)
	if not ok or not ut or not ut.entries then
		vim.notify("No undo history", vim.log.levels.INFO)
		return
	end
	local items = {}
	for i, e in ipairs(ut.entries) do
		table.insert(items, string.format("%d: seq %d  %s  %s", i, e.seq, os.date("%H:%M:%S", e.time) or "", e.save and "[save]" or ""))
	end
	if #items == 0 then
		vim.notify("No undo history", vim.log.levels.INFO)
		return
	end
	fzf.fzf_exec(items, {
		prompt = "Undo> ",
		actions = {
			["default"] = function(selected)
				if not selected or not selected[1] then return end
				local idx = tonumber(selected[1]:match("^(%d+):"))
				if idx and ut.entries[idx] then
					vim.cmd("undo " .. ut.entries[idx].seq)
				end
			end,
		},
	})
end

vim.keymap.set("n", "<leader>/", function() fzf.live_grep() end, { desc = "Grep root" })
vim.keymap.set("n", "<leader><space>", function() fzf.files() end, { desc = "Search Files" })
vim.keymap.set("n", "<leader>fb", function() fzf.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fc", function() fzf.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
vim.keymap.set("n", "<leader>ff", function() fzf.files() end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function() fzf.git_files() end, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fp", pick_projects, { desc = "Projects" })
vim.keymap.set("n", "<leader>fr", function() fzf.oldfiles() end, { desc = "Recent" })
vim.keymap.set("n", "<leader>sj", function() fzf.jumps() end, { desc = "Jumps" })
vim.keymap.set("n", "<leader>sm", function() fzf.marks() end, { desc = "Marks" })
vim.keymap.set("n", "<leader>sM", function() fzf.manpages() end, { desc = "Man Pages" })
vim.keymap.set("n", "<leader>sk", function() fzf.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sd", function() fzf.diagnostics_document() end, { desc = "Local Diagnostics" })
vim.keymap.set("n", "<leader>sD", function() fzf.diagnostics_workspace() end, { desc = "Root Diagnostics" })
vim.keymap.set("n", "<leader>sc", function() fzf.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sC", function() fzf.colorschemes() end, { desc = "Color Schemes" })
vim.keymap.set("n", "<leader>sn", pick_notifications, { desc = "Notifications" })
vim.keymap.set("n", "<leader>sh", function() fzf.helptags() end, { desc = "Help" })
vim.keymap.set("n", "<leader>sb", function() fzf.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>sq", function() fzf.quickfix() end, { desc = "Quickfix" })
vim.keymap.set("n", "<leader>su", pick_undo, { desc = "Undo" })
vim.keymap.set("n", "<leader>sl", function() fzf.grep_curbuf() end, { desc = "Grep current buffer" })
vim.keymap.set("n", "<leader>h", function() fzf.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "gd", function() fzf.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", function() fzf.lsp_declarations() end, { desc = "Goto Declaration" })
vim.keymap.set("n", "gI", function() fzf.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "<leader>cr", function() fzf.lsp_references() end, { desc = "Goto Reference" })
vim.keymap.set("n", "gt", function() fzf.lsp_typedefs() end, { desc = "Goto Type Definition" })
vim.keymap.set("n", "<leader>ss", function() fzf.lsp_document_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>sS", function() fzf.lsp_workspace_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>gd", function()
	if fzf.git_diff then
		fzf.git_diff()
	else
		fzf.git_status()
	end
end, { desc = "Git diff" })
