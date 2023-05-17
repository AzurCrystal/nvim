local M = {}
local lazy = {}

local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

local colorscheme = function()
  require("onedark").load()
end

function M.setup()
  load('core.settings')
  load('core.keymaps')
  load('core.autocmds')


  lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
  lazy.opts = {}

  lazy.setup(
    { import = 'plugins' }
  )
  colorscheme()

end


function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  -- You can "comment out" the line below after lazy.nvim is installed
  -- lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, lazy.opts)
end


return M
