local utils = require "astronvim.utils"
-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local code = {
  ["<leader>c"] = { "<cmd><cr>", name = "code" },
  ["<leader>cr"] = { vim.lsp.buf.rename, desc = "Rename" },
  ["<leader>ca"] = { vim.lsp.buf.code_action, desc = "Code Action" },
  ["<leader>c,"] = { vim.lsp.buf.format, desc = "Format" },
  ["<leader>cc"] = { vim.lsp.buf.signature_help, desc = "Signature Help" },
  ["<leader>ce"] = { vim.diagnostic.setloclist, desc = "Quickfix" },
  ["<leader>ch"] = { vim.diagnostic.goto_prev, desc = "Prev Diagnostics" },
  ["<leader>cl"] = { vim.diagnostic.goto_next, desc = "Next Diagnostics" },
  ["<leader>cd"] = { "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
  ["<leader>c."] = { function()
    local config = vim.diagnostic.config()
    config.scope = "line"
    vim.diagnostic.open_float(config)
  end, desc = "Line Diagnostics" },
  ["<leader>c/"] = { function()
    local lang = vim.bo.filetype
    vim.api.nvim_command(':CheatWithoutComments ' .. lang)
  end, desc = "cheat.sh" },
}

local find = {
  ["<leader>fe"] = { "<cmd>Telescope live_grep<cr>", desc = "find words" },
  ["<leader>fa"] = { "<cmd>Telescope find_files<cr>", desc = "find files" },
  ["<leader>fc"] = {
    function()
      local cwd = vim.fn.stdpath "config" .. "/.."
      local search_dirs = {}
      for _, dir in ipairs(astronvim.supported_configs) do                      -- search all supported config locations
        if dir == astronvim.install.home then dir = dir .. "/lua/user" end      -- don't search the astronvim core files
        if vim.fn.isdirectory(dir) == 1 then table.insert(search_dirs, dir) end -- add directory to search if exists
      end
      if vim.tbl_isempty(search_dirs) then                                      -- if no config folders found, show warning
        utils.notify("No user configuration files found", vim.log.levels.WARN)
      else
        if #search_dirs == 1 then cwd = search_dirs[1] end -- if only one directory, focus cwd
        require("telescope.builtin").find_files {
          prompt_title = "Config Files",
          search_dirs = search_dirs,
          cwd = cwd,
        } -- call telescope
      end
    end,
    desc = "Find AstroNvim config files",
  },
  ["<leader>f,"] = { "<cmd>TodoTelescope<cr>", desc = "Find Todos" },
  ["<leader>f."] = { "<cmd>Telescope diagnostics<cr>", desc = "Find Diagnostics" },
}

local fix = {
  ["<leader>,"] = { name = "fix" },
  ["<leader>,t"] = { "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
  ["<leader>,c"] = { vim.lsp.buf.code_action, desc = "Quickfix" },

}
local navigation = {
  ["<leader>h"] = { name = "Harpoon" },
  ["<leader>ha"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "add harpoon file" },
  ["<leader>ht"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "harpoon ui" },
  ["<leader>hh"] = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Jump to previous" },
  ["<leader>hl"] = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Jump to next" },
  ["<leader>h+"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Jump to 1" },
  ["<leader>h["] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Jump to 2" },
  ["<leader>h{"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Jump to 3" },
  ["<leader>h("] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Jump to 4" },
  ["<leader>h#"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "Jump to 5" },
  ["<leader>h="] = { "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", desc = "Jump to 6" },
  ["<leader>h)"] = { "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", desc = "Jump to 7" },
  ["<leader>h}"] = { "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", desc = "Jump to 8" },
  ["<leader>h]"] = { "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", desc = "Jump to 9" },
  ["<leader>h*"] = { "<cmd>lua require('harpoon.ui').nav_file(10)<cr>", desc = "Jump to 10" },
  s = {
    function()
      require("hop").hint_char2({
        direction = require 'hop.hint'.HintDirection.AFTER_CURSOR,
        case_inssensitive = true,
      })
    end,
    desc = "hop"
  },
  f = {
    function()
      require("hop").hint_char1({
        direction = require 'hop.hint'.HintDirection.AFTER_CURSOR,
        current_line_only = true,
        case_inssensitive = true,
        hint_offset = 1
      })
    end,
    desc = "hop"
  },
  t = {
    function()
      require("hop").hint_char1({
        direction = require 'hop.hint'.HintDirection.AFTER_CURSOR,
        current_line_only = true,
        case_inssensitive = true,
        hint_offset = -1
      })
    end,
    desc = "hop"
  },
  S = {
    function()
      require("hop").hint_char2({
        direction = require 'hop.hint'.HintDirection.BEFOR_CURSOR,
        case_inssensitive = true,
      })
    end,
    desc = "hop"
  },
  F = {
    function()
      require("hop").hint_char2({
        direction = require 'hop.hint'.HintDirection.BEFOR_CURSOR,
        current_line_only = true,
        case_inssensitive = true,
        hint_offset = 1
      })
    end,
    desc = "hop"
  },
  T = {
    function()
      require("hop").hint_char1({
        direction = require 'hop.hint'.HintDirection.BEFOR_CURSOR,
        current_line_only = true,
        case_inssensitive = true,
        hint_offset = -1
      })
    end,
    desc = "hop"
  },
}

local fold = {
  ["<leader>m"] = { name = "fold" },
  ["<leader>mc"] = { require('fold-cycle').close_all, desc = "Close" },
  ["<leader>mt"] = { require('fold-cycle').toggle_all, desc = "Toggle" }
}

local function assign(tbl, props)
  for k, v in pairs(props) do
    tbl[k] = v
  end
  return tbl
end

local normal = function()
  local tbl = assign(code, find)
  tbl = assign(tbl, fix)
  tbl = assign(tbl, navigation)
  tbl = assign(tbl, fold)
  tbl["<leader>;"] = { "<cmd>Alpha<cr>", desc = "Alpha" }
  return tbl
end

return {
  -- first key is the mode
  n = normal(),

  -- second key is the lefthand side of the map
  -- mappings seen under group name "Buffer"
  -- ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
  -- ["<leader>bD"] = {
  --   function()
  --     require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
  --       require("astronvim.utils.buffer").close(
  --         bufnr)
  --     end)
  --   end,
  --   desc = "Pick to close",
  -- },

  -- tables with the `name` key will be registered with which-key if it's installed
  -- this is useful for naming menus
  -- ["<leader>b"] = { name = "Buffers" },
  -- quick save
  -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
