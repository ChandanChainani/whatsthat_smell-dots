-- telescope
local actions = require('telescope.actions')
local utils = require('telescope.utils')
require('telescope').setup{
  defaults = {
		prompt_prefix = '❯ ',
		selection_caret = '❯ ',
		prompt_position = "top",
		sorting_strategy = "ascending",
		layout_defaults = {
      horizontal = {
        width_padding = 0.04,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      }
    },
    mappings = {
      n = {
        ["<Del>"] = actions.close
      },
    },
  }
}

require('telescope').load_extension('gh')

local M = {}

function M.grep_prompt()
  require('telescope.builtin').grep_string {
    shorten_path = true,
    search = vim.fn.input("Rg❯ "),
  }
end

function M.grep_term()
	local opts = {}
	opts.search_dirs = {'~/notes/vim', '~/.vim/', '~/dotfiles', '~/.config/nvim', '~/vim-dev'}
	opts.prompt_prefix = ' ❯ '
	opts.prompt_title = 'Terminal Docs' 
	opts.shorten_path = true
	require'telescope.builtin'.live_grep(opts)
end

M.project_files = function()
	local _, ret, stderr = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
	local gopts = {}
	gopts.prompt_title = 'Git Files'
	gopts.prompt_prefix = '  '
	if ret == 0 then 
		require'telescope.builtin'.git_files(gopts)
	else
		require'telescope.builtin'.find_files()
	end
end

function M.find_notes()
  require('telescope.builtin').file_browser {
    prompt_title = "\\ Notes /",
		prompt_prefix = ' ﮷ ',
    shorten_path = false,
    cwd = "~/notes/",
    width = .25,

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  }
end

function M.vim_rtp()
  require('telescope.builtin').find_files {
    prompt_title = "\\ Vim RTP /",
    shorten_path = false,
    cwd = "~/.vim/",
    width = .25,

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  }
end

function M.nvim_config()
  require('telescope.builtin').file_browser {
    prompt_title = "\\ NVim Config /",
    shorten_path = false,
    cwd = "~/.config/nvim/",
    width = .25,

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  }
end

function M.file_explorer()
  require('telescope.builtin').file_browser {
    prompt_title = "\\ File Explorer /",
    shorten_path = false,
    cwd = "~",
    width = .25,

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  }
end

return M