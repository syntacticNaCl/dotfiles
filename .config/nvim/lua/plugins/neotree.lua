local function file_exists(file)
  local f = io.open(file, 'rb')
  if f then
    f:close()
  end
  return f ~= nil
end

local function get_ignore_files()
  local files = {
    '.git/',
    '.vscode/',
    'bin/',
    'node_modules/',
    '.pyc',
    '.venv/',
    'target/',
    'Cargo.lock',
  }
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
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}