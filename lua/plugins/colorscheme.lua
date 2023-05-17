return {
  'navarasu/onedark.nvim',
  lazy = true,
  config = function()
    opts = {
      style = 'darker',
    }
    require("onedark").setup(opts)
  end
}
