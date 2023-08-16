return {
  n = {
    ["<leader>l"] = {
       function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
       desc = "Next buffer",
    },
    ["<leader>h"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>ss"] = {
      function ()
        require("resession").save()
      end
    },
    ["<leader>sl"] = {
      function ()
        require("resession").load()
      end
    },
    ["<leader>sd"] = {
      function ()
        require("resession").delete()
      end
    }
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
