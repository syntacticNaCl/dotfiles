--- Check if a file or directory exists in this path
---@param file any
---@return boolean
local function file_exists(file)
  local f = io.open(file, 'rb')
  if f then
    f:close()
  end
  return f ~= nil
end

--- Get the ignore files from .vimignore
---@return table
local function get_ignore_files()
  local files = {
    '.git/',
    '.vscode/',
    -- General Coding folders
    'bin/',
    -- JS / Node
    'node_modules/',
    -- Python
    '.pyc',
    '.venv/',
    -- Rust
    'target/',
    'Cargo.lock',
  }
  -- Read from file
  local file = '.vimignore'
  if not file_exists(file) then
    return files
  end
  for line in io.lines(file) do
    if line == nil or line == '' then
      line = ''
    else
      files[#files + 1] = line
    end
  end
  return files
end

return {
  -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-project.nvim',

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    local sorters = require 'telescope.sorters'
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      defaults = {
        file_sorter = sorters.get_fzy_sorter,

        prompt_prefix = '🔍 ',
        hidden = true,
        color_devicons = true,

        -- Custom ignore files func
        file_ignore_patters = get_ignore_files(),
        vimgrep_arguments = {
          'rg',
          '--hidden',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--glob',
          '!**/.git/*',
        },
        mappings = {
          i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        },
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        --  See `:help telescope.builtin` for more information
        find_files = {
          hidden = true, -- Show hidden files
          no_ignore = true, -- Show files ignored by .gitignore
          follow = true, -- Follow symlinks
          -- `hidden = true` will still show the inside of a `.git` as it's not `.gitignore'd`
          find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
        },
        live_grep = {
          additional_args = function()
            return { '--hidden' } -- Show hidden files and ignore files
          end,
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'file_browser')
    pcall(require('telescope').load_extension 'project')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
  end,
}