return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "javascript",
        "typescript",
        "css",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "tsx",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "toml",
        "luap",
        "markdown",
        "markdown_inline",
        "gitignore",
        "http",
        "scss",
        "vue",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- MDX
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
