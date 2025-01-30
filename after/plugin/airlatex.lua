vim.g.AirLatexCookieDB = "/Users/arontiselius/Library/Application Support/Firefox/Profiles/d2dporrl.default-release/cookies.sqlite"
vim.g.AirLatexCookie="cookies:overleaf_session2=s:CXxFZGGTMu58juvmFweFL6HKuD27lIal.06x3KYYmNxw2oRcPiT65F65jwB6dbpkbaCdD8K6jHwc"

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.tex",
  command = "lua require'lspconfig'.texlab.setup{}"
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.opt.spell = true          -- Enable spell checking
    vim.opt.spelllang = "en_us"   -- Set the dictionary language to US English
  end,
})

