return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = function(plugin)
        if vim.fn.executable("npx") then
          vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
        else
          vim.cmd([[Lazy load markdown-preview.nvim]])
          vim.fn["mkdp#util#install"]()
        end
      end,
      init = function()
        if vim.fn.executable("npx") then
          vim.g.mkdp_filetypes = { "markdown" }
        end
      end,
      vim.keymap.set("n", "<leader>Mp", ":MarkdownPreviewToggle<CR>"),
      vim.keymap.set("n", "<leader>Mm", ":MarkdownPreview<CR>"),
      vim.keymap.set("n", "<leader>Ms", ":MarkdownPreviewStop<CR>"),
    },
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  }, -- if you use the mini.nvim suite
  config = function()
    require("render-markdown").setup({})
  end,
}
