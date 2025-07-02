-- return {
--   "neovim/nvim-lspconfig",
--   opts = function(_, opts)
--     opts.servers = opts.servers or {}
--
--     -- 配置 Volar (Vue 语言服务器)
--     opts.servers.volar = vim.tbl_deep_extend("force", opts.servers.volar or {}, {
--       init_options = {
--         vue = {
--           hybridMode = true,
--         },
--       },
--       settings = {
--         vue = {
--           server = {
--             maxOldSpaceSize = 8192,
--           },
--         },
--       },
--       on_attach = function(client, bufnr)
--         -- 禁用 Volar 的格式化功能，让其他格式化工具处理
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--       end,
--     })
--
--     -- 配置 TypeScript 语言服务器
--     opts.servers.ts_ls = vim.tbl_deep_extend("force", opts.servers.ts_ls or {}, {
--       filetypes = {
--         "javascript",
--         "javascriptreact",
--         "javascript.jsx",
--         "typescript",
--         "typescriptreact",
--         "typescript.tsx",
--         "vue",
--       },
--       on_attach = function(client, bufnr)
--         -- 禁用 TypeScript 的格式化功能
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--       end,
--     })
--
--     -- 配置 VtsLS (Vue TypeScript Language Service)
--     -- opts.servers.vtsls = vim.tbl_deep_extend("force", opts.servers.vtsls or {}, {
--     --   on_attach = function(client, _)
--     --     client.server_capabilities = vim.tbl_extend(
--     --       "force",
--     --       client.server_capabilities,
--     --       {
--     --         workspace = {
--     --           didChangeWatchedFiles = { dynamicRegistration = true },
--     --           fileOperations = {
--     --             didRename = {
--     --               filters = {
--     --                 {
--     --                   pattern = {
--     --                     glob = "**/*.{ts,cts,mts,tsx,js,cjs,mjs,jsx,vue}",
--     --                   },
--     --                 },
--     --               },
--     --             },
--     --           },
--     --         },
--     --       }
--     --     )
--     --   end,
--     -- })
--
--     return opts
--   end,
-- }

return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },
}

