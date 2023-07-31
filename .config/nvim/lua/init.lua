vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.diagnostic.config({virtual_text = false})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

require("lazy").setup({
    {
        'Mofiqul/vscode.nvim',
        config = function()
            require('vscode').setup({
                transparent = false,
                italic_comments = true,
            })
            require('vscode').load()
        end
    },
    {
        'sbdchd/neoformat',
    },
    {
        'neovim/nvim-lspconfig',
    },

    {
        "github/copilot.vim",
        opt = {}
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'rafamadriz/friendly-snippets'
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                enabled = function()
                      -- disable completion in comments
                      local context = require 'cmp.config.context'
                      -- keep command mode completion enabled when cursor is in a comment
                      if vim.api.nvim_get_mode().mode == 'c' then
                        return true
                      else
                        return not context.in_treesitter_capture("comment")
                          and not context.in_syntax_group("Comment")
                      end
                end,
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                           cmp.select_next_item()
                        elseif vim.fn["vsnip#available"](1) == 1 then
                            feedkey("<Plug>(vsnip-expand-or-jump)", "")
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                            feedkey("<Plug>(vsnip-jump-prev)", "")
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = 'vsnip' },
                    { name = 'nvim_lsp' },
                }, {
                    { name = 'buffer' },

                }),
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end
                }
            })
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
                }, {
                    {
                        name = 'cmdline',
                        option = {
                        ignore_cmds = { 'Man', '!' }
                    }
                }
            })
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = false;

        require('lspconfig')['rust_analyzer'].setup {
            capabilities = capabilities
        }

        require('lspconfig')['lua_ls'].setup {
            settings = {
                Lua = {
                    runtime = {
                      version = 'LuaJIT',
                    },
                    diagnostics = {
                      globals = {'vim'},
                    },
                    workspace = {
                      library = vim.api.nvim_get_runtime_file("", true),
                      checkThirdParty = false
                    },
                    telemetry = {
                      enable = false,
                    },
                    completion = {
                        keywordSnippet = {
                            Disable = true
                        },
                        callSnippet = {
                            Disable = true
                        }
                    }
                },

            },
        }
        end
    },
    {
        'numToStr/Comment.nvim',
        opts = {}
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {},
        config = function()
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
              'confirm_done',
              cmp_autopairs.on_confirm_done())
        end
    },

    --
    -- INTERFACE
    --
    {
        'ms-jpq/chadtree',
        branch = 'chad',
        build = "python3 -m chadtree deps"
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {}
            require('telescope').load_extension('projects')
        end
    },
    {
        'goolord/alpha-nvim',
        event = 'VimEnter',
        config = function()
            local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
[[                                                                                ]],
[[                                               .                                ]],
[[                            .    ....       .....  ..                           ]],
[[                           ... ..''..       ..'''.....                          ]],
[[                            ...',;;'.       ..,;;;;'..                          ]],
[[                          ...';;::,..       ..,;:c:;..                          ]],
[[                          ...,:ll;'..       ..,;cll:,.    ...                   ]],
[[                .....     ..';col;'.         .';cool:'......   .                ]],
[[               ............,:cooc,..          .,coddl;.....   ..                ]],
[[                ..........':lodo:'.          ..,:lddo:,... ......               ]],
[[                 ..''...'',coddl;'.         ...,codxdl;'..........              ]],
[[         ...........,,,,;;;coddl:,..        ..',codddl:,''''.........           ]],
[[        ...........',;;,,;:coool:;'..      ..';:coddol::;,,''.........          ]],
[[           ......''',;::::cllllc:;;;,'.....',:cclllllllcc:;,,,'.........        ]],
[[           ......'''';:ccccllccc::::;;;;;;;;;:ccccc:clollcc;,,'..........       ]],
[[                ....',:clllolccc:::;;;,,,,,,;;:::c::coddooc;,'........          ]],
[[              .......';cooollc:::::::;,,,,;;;:cccc::coxxdoc;'.....              ]],
[[                 ....,:lddlllc;;;;:c::;;;;;:::::;;;;codxxo:;'......             ]],
[[                 ...';lodoollc:;;:::;,;,,,,,,;;;;;;;:loddol:,...........        ]],
[[          ..  .....',clllllllcc:::;,''''''''',,;::ccclloollo:.............      ]],
[[          .........';ccllccccccccc;,,,,,,,,,,,,;::c:cccclclol:'............     ]],
[[           ........';:cll:::ccc:;;,'','''''''''',::cllcclcclolc;'.........      ]],
[[             .....',::cc:;;;;:cc:,''.'.........',;:::::cc::cllc:;''....         ]],
[[         .......',;::c:;''''';;;;;,'....    ...''',;;;;,,;:cllc::,'...          ]],
[[        ........',,;;;,'....';:;,'.....       ....,;:;'..';:c:;;;,...           ]],
[[              ..''''',,''....,;;,''....        ..',;,'...'''',,,;,'..           ]],
[[              .................''....          ..''............''''..           ]],
[[               .......     ..  ........    ........  ....    .......            ]],
[[                ....             .'''..     ...''.  ....      ...               ]],
[[                ...           ....''....    ...''....                           ]],
[[                ..          ...........      ..''.....                          ]],
[[                ..        ......  ... .      ..........         ..              ]],
[[                                             ....               ..              ]],
[[                                             ..                                 ]],
[[                                                                                ]],
[[                                                                                ]],
[[                                                                                ]],}

        dashboard.section.buttons.val = {

            dashboard.button( "s", "⌛ > Projects"   , ":Telescope projects<CR>"),
            dashboard.button( "r", "📅 > Recent"   , ":Telescope oldfiles<CR>"),
            dashboard.button( "e", "📄 > New file" , ":ene <BAR> startinsert <CR>"),
            dashboard.button( "f", "🔍 > Find file", ":cd $HOME | Telescope find_files<CR>"),
            dashboard.button( "q", "🚪 > Quit NVIM", ":qa<CR>"),
        }

        require('alpha').setup(dashboard.opts)
        vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
        ]])
        end,
            dependencies = { {'nvim-tree/nvim-web-devicons'}}
        }
})
