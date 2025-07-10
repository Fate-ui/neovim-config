return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = opts.servers or {}

    -- 禁用 Volar (Vue) 的格式化
    opts.servers.volar = opts.servers.volar or {}
    opts.servers.volar.on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end

    -- 禁用 TypeScript 服务器的格式化
    opts.servers.tsserver = opts.servers.tsserver or {}
    opts.servers.tsserver.on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end

    return opts
  end,
}
