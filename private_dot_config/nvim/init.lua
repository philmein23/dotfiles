-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

require('packer').startup(function(use)
  use({
      "kdheepak/lazygit.nvim",
      requires = {
          "nvim-telescope/telescope.nvim",
          "nvim-lua/plenary.nvim",
      },
      config = function()
          require("telescope").load_extension("lazygit")
      end,
  })
  use 'fedepujol/move.nvim'
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  use 'christoomey/vim-tmux-navigator'
  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-live-grep-args.nvim', 'nvim-telescope/telescope-fzy-native.nvim',
 } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'mjlbach/onedark.nvim' -- Theme inspired by Atom
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true }}-- Fancier statusline
  use 'Julpikar/night-owl.nvim'
  use "EdenEast/nightfox.nvim" -- Packer
  use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'simrat39/rust-tools.nvim' -- rust-tools for rust rust_analyzer
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'williamboman/nvim-lsp-installer'
  use 'windwp/nvim-autopairs' -- autopairs
  use {
      'stevearc/aerial.nvim',
    }

  -- Better clipboard support
  use 'christoomey/vim-system-copy'

  -- File explorer
  use 'tamago324/lir.nvim'

  -- Alpha Startup UI
  use 'goolord/alpha-nvim'

  use {
    'VonHeikemen/searchbox.nvim',
    requires = {
      { 'MunifTanjim/nui.nvim' }
    }
  }

use "kylechui/nvim-surround"


use {"sindrets/diffview.nvim"}
-- use 'folke/tokyonight.nvim'
use "rebelot/kanagawa.nvim"
-- use {'ThePrimeagen/harpoon'}
use {
    "cbochs/grapple.nvim",
    requires = { "nvim-tree/nvim-web-devicons" }
}
use {
  'phaazon/hop.nvim',
  branch = 'v2.0', -- optional but strongly recommended
}

-- use {
--     "cbochs/portal.nvim",
-- }
end)

--Set highlight on search
vim.o.hlsearch = false

-- Make relative number default
vim.wo.relativenumber = true

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

-- Enable cursor line
vim.o.cursorline = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'


-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- code indention
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- grep
vim.o.grepprg = [[rg --no-heading --smart-case --vimgrep ]]
vim.o.grepformat = "%f:%l:%c:%m"


-- statusline
-- vim.o.winbar = "%=%m %f"

-- Theme setup
-- local nightfox = require('nightfox')
-- nightfox.setup {
--   options = {
--     styles = {
--       comments = "italic",
--       keywords = "bold",
--       types = "italic,bold",
--     }
--   }
-- }
--

-- Tokyo night theme configration
-- require('tokyonight').setup({
--   style = "night",
--   styles = {
--     functions = "bold",
--     keywords = "bold"
--   },
--   sidebars = { "qf", "vista_kind", "terminal", "packer" },
-- })
--
-- vim.cmd[[colorscheme tokyonight]]
--
-- Default options:
require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "dragon",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "dragon",           -- try "dragon" !
        light = "lotus"
    },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")


--Set statusbar
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'kanagawa',
    component_separators = '|',
    section_separators = '',
    globalstatus = true
  },
  sections = {
    lualine_b = {
      {
        require("grapple").statusline,
        cond = require("grapple").exists
      }
    },
    lualine_c = {
      {"branch"}
    },
    lualine_d = {
      {"diff"}
    },
    lualine_e = {
      {"filesize"}
    },
  },
  winbar = {
    lualine_c = {"%=%m %f"}
  }
}

--Enable Comment.nvim
require('Comment').setup()

--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Go to first character in line
vim.keymap.set('', '<Leader>h', '^')

-- Go to last character in line
vim.keymap.set('', '<Leader>l', 'g_')

-- Save
vim.keymap.set('n', '<leader>w', ':wa <CR>')

--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set({ 'n', 'x' }, '<leader>m', '%', { remap = true })

-- Sync up plugins using Packer
vim.keymap.set('n', '<leader>u', ':PackerSync<CR>')

-- Close buffer while preserving layout
vim.keymap.set('n', '<leader>bc', ':bd<CR>')

-- Move to last active buffer
vim.keymap.set('n', '<Leader>bl', ':buffer #<CR>')

-- Copy relative/absolute paths
vim.keymap.set('n', '<leader>cf', ':let @+ = expand("%") <CR>')
vim.keymap.set('n', '<leader>cF', ':let @+ = expand("%:p") <CR>')
vim.keymap.set('n', '<leader>cn', ':let @+ = expand("%:t") <CR>')
vim.keymap.set('n', '<leader>cd', ':let @+ = expand("%:p:h") <CR>')

-- -- Toggle harpoon mark
-- vim.keymap.set('n', '<leader>m', '<cmd>lua require("harpoon.mark").add_file()<cr>')
--
-- -- Search marks
-- vim.keymap.set('n', '<F3>', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>')
--
-- -- Navigate marks
-- vim.keymap.set('n', '<leader>1', '<cmd>lua require("harpoon.ui").nav_file(1)<cr>')
-- vim.keymap.set('n', '<leader>2', '<cmd>lua require("harpoon.ui").nav_file(2)<cr>')
-- vim.keymap.set('n', '<leader>3', '<cmd>lua require("harpoon.ui").nav_file(3)<cr>')
-- vim.keymap.set('n', '<leader>4', '<cmd>lua require("harpoon.ui").nav_file(4)<cr>')
-- vim.keymap.set('n', '<leader>5', '<cmd>lua require("harpoon.ui").nav_file(5)<cr>')
--
-- Lua
vim.keymap.set("n", "<leader>m", require("grapple").toggle)
vim.keymap.set("n", "<leader>k", require("grapple").toggle_tags)

-- User command
vim.keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<cr>")
vim.keymap.set("n", "<leader>2", "<cmd>Grapple select index=2<cr>")
vim.keymap.set("n", "<leader>3", "<cmd>Grapple select index=3<cr>")
vim.keymap.set("n", "<leader>4", "<cmd>Grapple select index=4<cr>")
vim.keymap.set("n", "<leader>5", "<cmd>Grapple select index=5<cr>")

-- Diffview
vim.keymap.set('n', '<leader>dvo', ':DiffviewOpen <CR>')
vim.keymap.set('n', '<leader>dvc', ':DiffviewClose <CR>')
vim.keymap.set('n', '<leader>dfh', ':DiffviewFileHistory <CR>')

-- Portal
-- vim.keymap.set("n", "<leader>o", require("portal").jump_backward, {})
-- vim.keymap.set("n", "<leader>i", require("portal").jump_forward, {})
-- vim.keymap.set("n", "<leader>m", require("portal.tag").toggle, {})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Indent blankline
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- Alpha settings
local augroup = vim.api.nvim_create_augroup('alpha_cmds', { clear = true })
local autocmd = vim.api.nvim_create_autocmd

local theme = {}
local section = {}
local action = {}

local version = vim.version()

-- Disable built-in intro message
vim.opt.shortmess:append('I')

section.header = {
  type = 'text',
  val = 'NEOVIM',
  opts = {
    position = 'center',
    hl = 'string'
  }
}

section.footer = {
  type = 'text',
  val = string.format(
    'v%s.%s.%s%s',
    version.major,
    version.minor,
    version.patch,
    version.api_prerelease and ' (Nightly)' or ''
  ),
  opts = {
    position = 'center',
    hl = 'comment'
  }
}
action.new_file = {
  name = 'New File',
  display = 'n',
  keys = 'n',
  fn = function()
    vim.cmd('enew')
  end
}

action.search_file = {
  name = 'Find File',
  display = 'f f',
  keys = 'ff',
  fn = function()
    require('telescope.builtin').find_files()
  end
}

action.recently_used = {
  name = 'History',
  display = 'h',
  keys = 'h',
  fn = function()
    require('telescope.builtin').oldfiles()
  end
}

action.explore = {
  name = 'Explore',
  display = 'e',
  keys = 'e',
  fn = function()
    require('conf.functions').file_explorer(vim.fn.getcwd())
  end
}

action.workspace = {
  name = 'Load Workspace',
  display = 'w',
  keys = 'w',
  fn = function()
    local project_settings = require('project-settings')
    project_settings.load({})

    if vim.g.session_name then
      require('plugins.session').load_current(vim.g.session_name)
    else
      project_settings.check_status()
    end
  end
}

action.help = {
  name = 'Get Help',
  display = 'H',
  keys = 'H',
  fn = function()
    require('telescope.builtin').help_tags()
  end
}

action.quit = {
  name = 'Quit',
  display = 'q',
  keys = 'q',
  fn = function()
    vim.cmd('quitall')
  end
}

action.execute = {
  name = 'Execute Command',
  display = 'x',
  keys = 'x',
  fn = function()
    require('fine-cmdline').open({})
  end
}

action.update_plugins = {
  name = 'Update Plugins',
  display = 'U',
  keys = 'U',
  fn = function()
    vim.cmd('PackUpdate')
  end
}

-- Add buttons
local button = function(args)
  return {
    type = 'button',
    val = '➤ ' .. args.name,
    on_press = args.fn,
    opts = {
      position = 'center',
      shortcut = args.display,
      cursor = 4,
      width = 50,
      align_shortcut = 'right',
      hl_shortcut = 'number',
    },
  }
end

section.buttons = {
  type = 'group',
  opts = { spacing = 1 }
}

-- very small screen
if vim.o.lines < 18 then
  section.buttons.val = {
    button(action.search_file),
    button(action.recently_used),
    button(action.explore),
  }
else
  section.buttons.val = {
    button(action.new_file),
    button(action.search_file),
    button(action.recently_used),
    button(action.explore),
    button(action.workspace),
    button(action.quit)
  }
end

theme.layout = {
  { type = 'padding', val = 2 },
  section.header,
  { type = 'padding', val = 2 },
  section.buttons,
  section.footer
}

theme.opts = {}

autocmd('User', {
  pattern = 'AlphaReady',
  group = augroup,
  callback = function()
    for _, item in pairs(action) do
      vim.keymap.set(
        'n',
        item.keys,
        item.fn,
        { silent = true, buffer = true }
      )
    end

    if vim.g.terminal_color_background then
      vim.cmd('highlight UserHideChar guifg=' .. vim.g.terminal_color_background)
      vim.cmd('setlocal winhl=EndOfBuffer:UserHideChar')
    end
  end
})

require('alpha').setup(theme)


-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

local dropdown = function(title, previewer)
  return {
    prompt_title = title,
    previewer = previewer or false,
    theme = 'dropdown',
    sort_lastused = true,
    ignore_current_buffer = true
  }
end


local defaults = function(title)
  return {
    prompt_title = title,
    results_title = false
  }
end
local command = vim.api.nvim_create_user_command

command('TGrep', function(input)
  require('telescope.builtin').grep_string({ search = input.args })
end, { nargs = 1 })

-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },

    -- Default layout options
    prompt_prefix = ' ',
    selection_caret = '❯ ',
    layout_strategy = 'vertical',
    sorting_strategy = 'ascending',
    layout_config = {
      preview_cutoff = 25,
      mirror = true,
      prompt_position = 'top'
    },
  },
  pickers = {
    buffers = defaults("Buffers"),
    find_files = defaults("Find Files"),
    oldfiles = defaults('History'),
    keymaps = dropdown(),
    command_history = dropdown(),
    colorscheme = dropdown(),

    grep_string = defaults('Search'),
    treesitter = defaults('Buffer Symbols'),
    current_buffer_fuzzy_find = defaults('Lines'),
    live_grep = defaults('Grep'),

    commands = defaults(),
    help_tags = defaults(),
  },
}

require('telescope').load_extension('live_grep_args')
require('telescope').load_extension('fzy_native')

-- Show keymaps
vim.keymap.set('n', '<leader>?', ':Telescope keymaps<CR>')

--Add leader shortcuts
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>ff', function()
  require('telescope.builtin').find_files { previewer = false }
end)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').treesitter)
vim.keymap.set('n', '<leader>fg', require('telescope').extensions.live_grep_args.live_grep_args)
vim.keymap.set('n', '<leader>fo', function()
  require('telescope.builtin').tags { only_current_buffer = true }
end)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').oldfiles)

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP settings
require("nvim-lsp-installer").setup {
  automatic_installation = true
}

local lspconfig = require 'lspconfig'
local on_attach = function(client, bufnr)

  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'ocamllsp' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require('rust-tools').setup({
  server = { on_attach = on_attach } })

-- Example custom server
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
-- vim: ts=2 sts=2 sw=2 et

local actions = require('lir.actions')
local marks = require('lir.mark.actions')
local clipboard = require('lir.clipboard.actions')

local on_init = function()
  local bind = vim.keymap.set
  local noremap = { remap = false, silent = true, buffer = true }
  local remap = { remap = true, silent = true, buffer = true }

  local mark = ":<C-u>lua require('lir.mark.actions').toggle_mark('v')<CR>gv<C-c>"

  bind('n', 'v', 'V', noremap)
  bind('x', 'q', '<Esc>', noremap)

  bind('x', '<Tab>', mark, noremap)
  bind('x', 'cc', mark .. 'cc', remap)
  bind('x', 'cx', mark .. 'cx', remap)

  bind('n', '<S-Tab>', 'gv<Tab>', remap)
end

local lir = require('lir')
lir.setup({
  show_hidden_files = true,
  devicons_enable = true,
  on_init = on_init,
  mappings = {
    ['l']  = actions.edit,
    ['es'] = actions.split,
    ['ev'] = actions.vsplit,
    ['et'] = actions.tabedit,

    ['h'] = actions.up,
    ['q'] = actions.quit,

    ['.'] = actions.toggle_show_hidden,
    ['i'] = actions.newfile,
    ['o'] = actions.mkdir,
    ['r'] = actions.rename,
    ['d'] = actions.delete,
    ['Y'] = actions.yank_path,

    ['<Tab>'] = marks.toggle_mark,

    ['cc'] = clipboard.copy,
    ['cx'] = clipboard.cut,
    ['cv'] = clipboard.paste,
  },
  float = {
    winblend = 0,
    win_opts = function()
      return {
        border = 'single'
      }
    end
  }
})

local file_explorer = function(cwd)
  if vim.o.lines > 17 then
    require('lir.float').toggle(cwd)
  else
    vim.cmd('edit ' .. (cwd or vim.fn.expand('%:p:h')))
  end
end

vim.keymap.set('n', '<leader>dd', file_explorer)
vim.keymap.set('n', '<leader>da', function() file_explorer(vim.fn.getcwd()) end)

-- Searchbox
local searchbox = require('searchbox')
searchbox.setup({
  hooks = {
    on_done = function(value)
      if value == nil then return end
      vim.fn.setreg('s', value)
    end
  }
})

-- Nice buffer local search
vim.keymap.set('n', '<leader>s', ':SearchBoxIncSearch<CR>')
vim.keymap.set('x', '<leader>s', ':SearchBoxIncSearch visual_mode=true<CR>')
vim.keymap.set('n', '<leader>S', ":SearchBoxMatchAll title=' Match '<CR>")
vim.keymap.set('x', '<leader>S', ":SearchBoxMatchAll title=' Match ' visual_mode=true<CR>")
vim.keymap.set('n', '<leader>;', '<cmd>SearchBoxClear<CR>')

-- Begin search & replace
vim.keymap.set('n', '<leader>r', ":SearchBoxReplace confirm=menu<CR>")
vim.keymap.set('x', '<leader>r', ":SearchBoxReplace confirm=menu visual_mode=true<CR>")
vim.keymap.set('n', '<leader>R', ":SearchBoxReplace confirm=menu -- <C-r>=expand('<cword>')<CR><CR>")
vim.keymap.set('x', '<leader>R', ":<C-u>GetSelection<CR>:SearchBoxReplace confirm=menu<CR><C-r>/")


-- Autopairs
local npairs = require('nvim-autopairs')
npairs.setup({fast_wrap = {}})

-- Aerial
local aerial = require("aerial")
aerial.setup({
  on_attach = function(bufnr)
    -- Toggle the aerial window with <leader>a
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialToggle!<CR>', {})
    -- Jump forwards/backwards with '{' and '}'
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
    -- Jump up the tree with '[[' or ']]'
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
  end
})

-- Nvim Surround
local nvim_surround = require("nvim-surround")
nvim_surround.setup({
    -- Configuration here, or leave empty to use defaults
})


-- diffview
local diffview = require("diffview")
diffview.setup({ })

local keymap_opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<leader>g', '<cmd>Neogit<cr>')
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', keymap_opts)


-- hop
local hop = require('hop')
hop.setup({})
vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})
vim.keymap.set('n', '<leader>hw', ':HopWord <cr>')


-- local noice = require('noice')
-- noice.setup({})


local opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set('n', '<S-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<S-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<S-h>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<S-l>', ':MoveHChar(1)<CR>', opts)
vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<S-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<S-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<S-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<S-l>', ':MoveHBlock(1)<CR>', opts)
