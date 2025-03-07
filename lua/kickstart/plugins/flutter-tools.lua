-- flutter-tools
-- https://github.com/akinsho/flutter-tools.nvim

return {
  'akinsho/flutter-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    require("flutter-tools").setup {
      -- ui = {
      --   -- the border type to use for all floating windows, the same options/formats
      --   -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
      --   border = "rounded",
      --   -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
      --   -- please note that this option is eventually going to be deprecated and users will need to
      --   -- depend on plugins like `nvim-notify` instead.
      --   notification_style = 'native' | 'plugin'
      -- },
      -- decorations = {
      --   statusline = {
      --     -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
      --     -- this will show the current version of the flutter app from the pubspec.yaml file
      app_version = true,
      --     -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
      --     -- this will show the currently running device if an application was started with a specific
      --     -- device
      device = true,
      --     -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
      --     -- this will show the currently selected project configuration
      --     project_config = false,
      --   }
      -- },
      debugger = {
        -- integrate with nvim dap + install dart code debugger
        enabled = true,
        run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
        -- -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
        -- -- see |:help dap.set_exception_breakpoints()| for more info
        exception_breakpoints = { "raised" },
        -- exception_breakpoints = {"raised", "uncaught"}
        -- register_configurations = function(paths)
        --   require("dap").configurations.dart = {
        --     {
        --       name = "ckc-app-flutter COLOMBIA - dev",
        --       request = "launch",
        --       type = "dart",
        --       flutterMode = "debug",
        --       program = "./lib/main_colombia_dev.dart",
        --       args = {
        --         "--flavor", "colombiaDev"
        --       }
        --     },
        --     {
        --       name = "ckc-app-flutter BOLIVIA - dev",
        --       request = "launch",
        --       type = "dart",
        --       flutterMode = "debug",
        --       program = "./lib/main_bolivia_dev.dart",
        --       args = {
        --         "--flavor", "boliviaDev",
        --
        --       }
        --     }
        --   }
        -- end,
      },
      -- flutter_path = "<full/path/if/needed>", -- <-- this takes priority over the lookup
      -- flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
      fvm = true, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
      widget_guides = {
        enabled = true,
      },
      -- closing_tags = {
      --   highlight = "ErrorMsg", -- highlight for the closing tag
      --   prefix = ">", -- character to use for close tag e.g. > Widget
      --   enabled = true -- set to false to disable
      -- },
      -- dev_log = {
      --   enabled = true,
      --   notify_errors = false, -- if there is an error whilst running then notify the user
      --   open_cmd = "tabedit", -- command to use to open the log buffer
      -- },
      -- dev_tools = {
      --   autostart = false, -- autostart devtools server if not detected
      --   auto_open_browser = false, -- Automatically opens devtools in the browser
      -- },
      -- outline = {
      --   open_cmd = "30vnew", -- command to use to open the outline buffer
      --   auto_open = false -- if true this will open the outline automatically when it is first populated
      -- },
      lsp = {
        color = { -- show the derived colours for dart variables
          enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
          background = false, -- highlight the background
          background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
          foreground = false, -- highlight the foreground
          virtual_text = true, -- show the highlight using virtual text
          virtual_text_str = "■", -- the virtual text character to highlight
        },
        on_attach = function(_, bufnr)
          -- NOTE: Remember that lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself
          -- many times.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local nmap = function(keys, func, desc)
            if desc then
              desc = 'LSP: ' .. desc
            end

            vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
          end

          nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          -- nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          -- nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')


          -- See `:help K` for why this keymap
          nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
          -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

          -- Lesser used LSP functionality
          nmap('gd', vim.lsp.buf.definition, '[G]oto [d]efinition')
          nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
          nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
          nmap('<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, '[W]orkspace [L]ist Folders')

          -- Create a command `:Format` local to the LSP buffer
          vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
            vim.lsp.buf.format()
          end, { desc = 'Format current buffer with LSP' })

          vim.keymap.set('n', '<leader>fru', '<cmd>FlutterRun<CR>')
          vim.keymap.set('n', '<leader>frl', '<cmd>FlutterReload<CR>')
          vim.keymap.set('n', '<leader>frs', '<cmd>FlutterRestart<CR>')
          vim.keymap.set('n', '<leader>fe', '<cmd>FlutterEmulators<CR>')
          vim.keymap.set('n', '<leader>fd', '<cmd>FlutterDevices<CR>')
          vim.keymap.set('n', '<leader>frn', '<cmd>FlutterRun<CR>')
          vim.keymap.set('n', '<leader>fq', '<cmd>FlutterQuit<CR>')
          vim.keymap.set('n', '<leader>flc', '<cmd>FlutterLogClear<CR>')
          vim.keymap.set('n', '<leader>fdtr', '<cmd>FlutterDevTools<CR>')
          vim.keymap.set('n', '<leader>fdtl', '<cmd>FlutterOpenDevTools<CR>')
          vim.keymap.set('n', '<leader>fdtc', '<cmd>FlutterCopyProfilerUrl<CR>')
        end
      },
      on_attach = function()
      end
      --   capabilities = my_custom_capabilities -- e.g. lsp_status capabilities
      --   --- OR you can specify a function to deactivate or change or control how the config is created
      --   capabilities = function(config)
      --     config.specificThingIDontWant = false
      --     return config
      --   end,
      --   -- see the link below for details on each option:
      --   -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
      --   settings = {
      --     showTodos = true,
      --     completeFunctionCalls = true,
      --     analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
      --     renameFilesWithClasses = "prompt", -- "always"
      --     enableSnippets = true,
      --     updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
      --   }
      -- }
    }
  end,
}
