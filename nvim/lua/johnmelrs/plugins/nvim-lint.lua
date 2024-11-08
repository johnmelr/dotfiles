return {
  'mfussenegger/nvim-lint',
  opts = {
    -- Event to trigger linters
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      ["*"] = { "cspell" },
    }
  },
  config = function()
    require('lint').linters_by_ft = {
      ["*"] = { "cspell" },
      bash = { "shellcheck" },
      javascript = { "eslint" },
      typescript = { "eslint" },
      python = { "pylint" },
      markdown = { 'vale' },
    }
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require("lint").try_lint()

        -- You can call `try_lint` with a linter name or a list of names to always
        -- run specific linters, independent of the `linters_by_ft` configuration
        require("lint").try_lint("cspell")
      end,
    })
  end
}
