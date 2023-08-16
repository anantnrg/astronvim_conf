if vim.g.neovide then
  vim.o.guifont = "Victor Mono:h11"
  vim.opt.linespace = -2
  vim.api.nvim_set_keymap('n', '<C-c>', '"+y', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('i', '<C-v>', '<Esc>"+pa', {noremap = true, silent = true})
  vim.api.nvim_set_option("clipboard", "unnamedplus")


end



return {
  updater = {
    remote = "origin",
    channel = "nightly",
    version = "latest",
    branch = "nightly",
  },

  colorscheme = "tokyonight",

  plugins = {
    {
      "folke/tokyonight.nvim",
      name = "tokyonight",
      config = function()
        require("tokyonight").setup {
           style = "night",
           transparent = true,
           styles = {
             comments = { italic = true },
             keywords = { italic = false },
             functions = { italic = true },
             variables = { italic = true },
           }
        }
      end,
    },
    {
      "elentok/format-on-save.nvim",
      config = function()
        local formatters = require("format-on-save").formatters

        require("format-on-save").setup({
          exclude_path_patterns = {
            "/target"
          },
          formatter_by_ft = {
            rust = formatters.lsp,
            lua = formatters.lsp,
          }
        })
      end
    },
    {
      "stevearc/resession.nvim",
      lazy = false,
      config = function()
        local resession = require("resession")

        resession.setup({
          autosave = {
            enabled = true,
            interval = 60,
            notify = false,
          }
        })
        vim.api.nvim_create_autocmd("VimEnter", {
          callback = function()
            if vim.fn.argc(-1) == 0 then
              resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
            end
          end,
        })
        vim.api.nvim_create_autocmd("VimLeavePre", {
          callback = function()
            resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
          end,
        })
      end
    },
    {
      "EtiamNullam/deferred-clipboard.nvim",
      config = function ()
        require("deferred-clipboard").setup({
          fallback = "unnamedplus"
        })
      end
    }
  },

  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {
          "rust"
        },
      },
      timeout_ms = 1000,
    },
  },

  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  polish = function()
    vim.cmd("set number")
    vim.cmd("set expandtab")
    vim.cmd("set shiftwidth=4")
  end,
}
