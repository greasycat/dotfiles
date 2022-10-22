require'nvim-web-devicons'.setup {}
require('lualine').setup {
    option = {
        theme = 'codedark'
    }
}

-- local dashboard = require("alpha.themes.dashboard")
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

    dashboard.button( "s", "🕛  > Sessions"   , ":Telescope persisted<CR>"),
    dashboard.button( "r", "⌛  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "e", "📄  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "🔍  > Find file", ":cd $HOME/WorkSpace | Telescope find_files<CR>"),
    dashboard.button( "q", "❌  > Quit NVIM", ":qa<CR>"),
}

require('alpha').setup(dashboard.opts)
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

require'colorizer'.setup()
