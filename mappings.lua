-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  i = {
    ["jjj"] = { "<Esc>" },
    ["kkk"] = { "<Esc>" },
    ["hhh"] = { "<Esc>" },
    ["lll"] = { "<Esc>" },
    ["∆"] = {"<Esc>:m .+1<CR>==gi" },
    ["˚"] = {"<Esc>:m .-2<CR>==gi" },
    ["<C-a>"] = {'<Esc>gg0vG$' },
  },

  n = {
    ["<tab>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<s-tab>"] = {
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
    ["<leader>b"] = { name = "Buffers" }, -- which-Key prefix name
    ["<leader>r"] = { ":AstroReload<cr>", desc = "Reload config" },
    ["<leader>v"] = { ":TermExec cmd='!!'<cr>:TermExec cmd=''<cr>", desc = "Send !! to Term" },
    [";"] = { ":" },
    [":"] = { ";" },
    ["`"] = { "<C-^>", desc = "Jump buffer"},
    ["'"] = { "`", desc = "Go to mark"},
    ["<"] = { "<<" },
    [">"] = { ">>" },
    ["∆"] = { ":m .+1<CR>==" },
    ["˚"] = { ":m .-2<CR>==" },
    ["x"] = {'"_x'},
    ["p"] = {':let @+=@0<CR>p'},
    ["<C-a>"] = {'gg0vG$' },
    -- Search ---
    ["<leader>/"] = {[[/\V<C-r>=expand("<cword>")<CR><CR>]], desc = "Search word under cursor"},
    ["<leader><leader>/"] = {[[/\V<C-r>=expand("<cword>")<CR><CR>:silent exe "grep "substitute(@/,'^\\V','','')<CR>]], desc = "Grep word under cursor"},
    ["<C-q>"] = {[[:silent vimgrep //j %<CR>]], desc = "Send // to quickfix locally"},
    ["<leader><C-q>"] = {[[:silent exe "grep "substitute(@/,'^\\V','','')<CR>]], desc = "Send grep to quickfix"},
    ["<leader>sf"] = {[[/<CR>:silent exe "grep "substitute(@/,'^\\V','','')<CR>]], desc = "Grep functions"},
    ["<leader>s"] = { name = "Search" },
    -- QuickFix list
    ["<CR>"] = {[[&buftype ==# 'quickfix' ? "\<CR>" : ':silent! norm!za<CR>']], expr = true},
    ["<F2>"] = {':call ToggleQuickFix()<cr>', desc = "Toggle Quickfix"},
    ["<C-p>"] = {[[empty(filter(getwininfo(), 'v:val.quickfix')) ? "<C-p>" : ":cprevious<CR>"]], expr = true, desc = "Quickfix prev"},
    ["<C-n>"] = {[[empty(filter(getwininfo(), 'v:val.quickfix')) ? "<C-n>" : ":cnext<CR>"]], expr = true, desc = "Quickfix next"},
    ["<C-o>"] = {[[&buftype ==# 'quickfix' ? ":echo 'o'<CR>" : "<C-o>"]], expr = true},
    ["<C-i>"] = {[[&buftype ==# 'quickfix' ? ":echo 'i'<CR>" : "<C-i>"]], expr = true},
    -- Location list
    ["<F3>"] = {':silent! call ToggleLocationList()<cr>', desc = "Toggle Location list"},
    ["<C-M-p>"] = {[[empty(filter(getwininfo(), 'v:val.loclist')) ? "<C-M-p>" : ":lprevious<CR>"]], expr = true, desc = "Location list prev"},
    ["<C-M-n>"] = {[[empty(filter(getwininfo(), 'v:val.loclist')) ? "<C-M-n>" : ":lnext<CR>"]], expr = true, desc = "Location list next"},
    -- Search/Replace --
    ["<leader>;"] = {[[:%s///gc<Left><Left><Left><Left>]], desc = "%s///"},
    ["<leader>h"] = {[[/\V<C-r>=expand("<cword>")<CR><CR>:%s/\<<C-r>=expand("<cword>")<CR>\>/<C-r>=expand("<cword>")<CR>/gc<Left><Left><Left>]], desc = "Search/replace word under cursor"},
    -- format all
    ["=a"] = {'gg0vG$==', desc = "format all"},
    -- set indent
    ["=2"] = {':set tabstop=2 shiftwidth=2<CR>', desc = "indent 2"},
    ["=4"] = {':set tabstop=4 shiftwidth=4<CR>', desc = "indent 4"},
    -- csv
    -- ["=ra"] = {":RainbowAlign<CR>", desc = "RainbowAlign"},
    -- ["=rs"] = {":RainbowShrink<CR>", desc = "RainbowShrink"},
    -- ["=rd"] = {":RainbowDelim<CR>", desc = "RainbowDelim"},
    -- ["=rn"] = {":RainbowNoDelim<CR>", desc = "RainbowNoDelim"},
    -- json
    ["=j"] = {":set filetype=json<CR>:%!jq .<CR>:set foldmethod=syntax<CR>zR", desc = "set Json"},
    -- xml
    -- ["=x"] = {':set filetype=xml<CR>:1s/<?xml .*?>//e<CR>:silent %!xmllint --encode UTF-8 --format -<CR>:1d<CR><ESC>', desc = ""},
    ["=x"] = {':set filetype=xml<CR>:%s/></>\r</g<CR>==', desc = "set xml"},
  },

  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },

  v = {
    [";"] = { ":" },
    [":"] = { ";" },
    ["v"] = { [[mode() ==# 'v' ? 'V' : mode() ==# '<C-v>' ? 'v' : '<C-q>']],  expr = true },
    ["<"] = { "<gv" },
    [">"] = { ">gv" },
    ["∆"] = {":m \'>+1<CR>gv=gv" },
    ["˚"] = {":m \'<-2<CR>gv=gv" },
    ["p"] = {'"_dP'},
    -- Search
    ["/"] = {'"hy/\\V<C-r>h<CR><S-n>'},
    ["<leader>/"] = {[["hy/<C-r>h<CR>:silent vimgrep //j %<CR>]], desc = "Search for visual selection, send to qf"},
    ["<leader><leader>/"] = {[["hy/<C-r>h<CR>:silent exe "grep "shellescape(substitute(@/,'[()\]\[]','\\&','g'))<CR>]], desc = "Grep for visual selection, send to qf"},
    -- Search/Replace --
    ["<leader>;"] = {[[:s///gc<Left><Left><Left><Left>]], desc = "<,>s///"},
    ["<leader>h"] = {[["hy/\V<C-r>h<CR>:%s/<C-r>h//gc<Left><Left><Left>]], desc = "Search/replace visual selection"},
    ["<leader><leader>h"] = {[["hy/<C-r>h<CR>:silent exe "grep "shellescape(substitute(@/,'[()\]\[{}]','\\&','g'))<CR>:cdo s/<C-r>h//gc<Left><Left><Left>]], desc = "Search/replace word under cursor"},
  },

  x = {
    ["∆"] = {":m \'>+1<CR>gv=gv" },
    ["˚"] = {":m \'<-2<CR>gv=gv" },
  }
}
