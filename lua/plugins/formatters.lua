return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        blade = { "blade_formatter" },
        php = { "php_cs_fixer", "phpcbf" }, -- optional for PHP files
      },
      formatters = {
        blade_formatter = {
          command = "blade-formatter",
          args = { "--stdin", "--write" },
          stdin = true,
        },
      },
    },
  },
}
