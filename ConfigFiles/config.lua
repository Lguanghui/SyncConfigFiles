-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- 设置语言
vim.cmd('language en_US')

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- 设置编码格式
-- 设置缓存路径
vim.cmd([[
set encoding=utf-8
set backupdir=~/vimtmp//,.
set directory=~/vimtmp//,.
]])

lvim.plugins = {
-- 代码注释插件
-- gcc 注释当前行（不需要 leader 键）
-- gc 注释选中行
-- gcap 注释段落
-- 251,254Commentary 注释 251 行到 254 行
  -- 'tpope/vim-commentary',

    -- 自动切换中英文输入法
    {
        "ybian/smartim",
        config = function ()
            vim.cmd("let g:smartim_default = 'com.apple.keylayout.ABC'")
        end
    }
}
