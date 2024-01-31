local utils = require("hybrid.utils")

local M = {}

function M.setup(opts)
    local c = require("hybrid.colors").setup()

    local highlights = {
        -- Highlight default
        -- :h highlight-default
        -- {{{
        ColorColumn = { bg = c.bg_hard },
        Conceal = { fg = c.dull_blue },
        CurSearch = { fg = c.green, bg = c.bg, reverse = opts.inverse },
        Cursor = { reverse = opts.inverse },
        -- lCursor = {},
        -- CursorIM = {},
        CursorColumn = { link = "CursorLine" },
        CursorLine = { bg = c.line },
        Directory = { fg = c.blue },
        DiffAdd = { bg = utils.darken(c.diff.add, 0.2, c.bg) },
        DiffChange = { bg = utils.darken(c.diff.change, 0.2, c.bg) },
        DiffDelete = { bg = utils.darken(c.diff.delete, 0.2, c.bg) },
        DiffText = { bg = utils.darken(c.diff.text, 0.4, utils.darken(c.diff.change, 0.2, c.bg)) },
        EndOfBuffer = { fg = c.fg_soft },
        -- TermCursor  = {},
        -- TermCursorNC= {},
        ErrorMsg = { fg = c.diag.error },
        WinSeparator = { fg = c.fg_soft, bg = opts.transparent and c.none or c.bg },
        Folded = { fg = c.fg, bg = c.line, italic = opts.italic.folds },
        FoldColumn = { fg = c.fg_soft, bg = opts.transparent and c.none or c.bg },
        SignColumn = { fg = c.fg_soft, bg = opts.transparent and c.none or c.bg },
        IncSearch = { fg = c.dull_yellow, bg = c.bg, reverse = opts.inverse },
        -- Substitute = {},
        LineNr = { fg = c.bg_soft },
        -- LineNrAbove = {},
        -- LineNrBelow = {},
        CursorLineNr = { fg = c.primary, bg = c.line },
        -- CursorLineFold = {},
        -- CursorLineSign = {},
        MatchParen = { bg = c.selection, bold = opts.bold },
        -- ModeMsg = {},
        -- MsgArea = {},
        -- MsgSeparator = {},
        MoreMsg = { fg = c.primary },
        NonText = { fg = c.bg_soft },
        Normal = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
        NormalFloat = { fg = c.fg, bg = c.float.bg },
        FloatBorder = { fg = c.float.border, bg = c.float.bg },
        FloatTitle = { fg = c.float.title, bg = c.float.bg },
        NormalNC = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
        Pmenu = { fg = c.fg, bg = c.bg_hard },
        PmenuSel = { bg = c.selection, bold = opts.bold },
        -- PmenuKind = {},
        -- PmenuKindSel = {},
        -- PmenuExtra = {},
        -- PmenuExtraSel = {},
        PmenuSbar = { bg = c.bg_hard },
        PmenuThumb = { bg = c.selection },
        Question = { fg = c.primary },
        QuickFixLine = { bg = c.selection, bold = opts.bold },
        Search = { fg = c.yellow, bg = c.bg, reverse = opts.inverse },
        SpecialKey = { fg = c.primary },
        SpellBad = { sp = c.diag.error, undercurl = opts.undercurl },
        SpellCap = { sp = c.diag.warning, undercurl = opts.undercurl },
        SpellLocal = { sp = c.diag.info, undercurl = opts.undercurl },
        SpellRare = { sp = c.diag.hint, undercurl = opts.undercurl },
        StatusLine = { fg = c.fg, bg = c.line },
        StatusLineNC = { fg = c.fg, bg = c.bg },
        TabLine = { fg = c.fg, bg = c.bg_hard },
        TabLineFill = { fg = c.fg, bg = c.bg_hard },
        TabLineSel = { fg = c.fg, bg = c.bg, bold = opts.bold },
        Title = { fg = c.primary, bold = opts.bold },
        Visual = { bg = utils.lighten(c.selection, 0.8, c.primary) },
        VisualNOS = { link = "Visual" },
        WarningMsg = { fg = c.diag.warning },
        Whitespace = { link = "NonText" },
        WildMenu = { fg = c.fg, bg = c.selection, bold = opts.bold },
        WinBar = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
        WinBarNC = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
        -- }}}

        -- Syntax highlighting
        -- :h group-name
        -- {{{
        Comment = { fg = c.comment, italic = opts.italic.comments },

        Constant = { fg = c.dull_yellow },
        String = { fg = c.yellow, italic = opts.italic.strings },
        Character = { fg = c.green },
        -- Number = {},
        -- Boolean = {},
        -- Float = {},

        Identifier = { fg = c.fg },
        Function = { fg = c.blue },

        Statement = { fg = c.magenta },
        -- Conditional = {},
        -- Repeat = {},
        -- Label = {},
        Operator = { fg = c.blue },
        -- Keyword = {},
        -- Exception = {},

        PreProc = { fg = c.magenta },
        -- Include = {},
        -- Define = {},
        -- Macro = {},
        -- PreCondit = {},

        Type = { fg = c.bright_cyan },
        -- StorageClass = {},
        -- Structure = {},
        -- Typedef = {},

        Special = { fg = c.bright_blue },
        -- SpecialChar = {},
        -- Tag = {},
        Delimiter = { fg = c.fg },
        -- SpecialComment = {},
        Debug = { fg = c.dull_yellow },

        Underlined = { underline = opts.underline },

        Ignore = { link = "NonText" },

        Error = { fg = c.diag.error, reverse = opts.inverse },

        Todo = { fg = c.diag.hint, reverse = opts.inverse }, -- TODO FIXME XXX
        -- }}}

        -- Treesitter
        -- :h treesitter-highlight
        -- Source https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights
        -- {{{
        -- -- Identifiers
        -- @variable            ; various variable names
        -- @variable.builtin    ; built-in variable names (e.g. `this`)
        -- @variable.parameter  ; parameters of a function
        -- @variable.member     ; object and struct fields

        -- @constant            ; constant identifiers
        -- @constant.builtin    ; built-in constant values
        -- @constant.macro      ; constants defined by the preprocessor

        -- @module              ; modules or namespaces
        -- @module.builtin      ; built-in modules or namespaces
        -- @label               ; GOTO and other labels (e.g. `label:` in C), including heredoc labels

        ["@variable.builtin"] = { fg = c.red },
        ["@variable.parameter"] = { fg = c.yellow },
        ["@variable.member"] = { fg = c.cyan },

        ["@module.builtin"] = { fg = c.red },

        -- -- Literals
        -- @string                 ; string literals
        -- @string.documentation   ; string documenting code (e.g. Python docstrings)
        -- @string.regexp          ; regular expressions
        -- @string.escape          ; escape sequences
        -- @string.special         ; other special strings (e.g. dates)
        -- @string.special.symbol  ; symbols or atoms
        -- @string.special.url     ; URIs (e.g. hyperlinks)
        -- @string.special.path    ; filenames

        -- @character              ; character literals
        -- @character.special      ; special characters (e.g. wildcards)

        -- @boolean                ; boolean literals
        -- @number                 ; numeric literals
        -- @number.float           ; floating-point number literals

        ["@string.regexp"] = { fg = c.cyan },
        ["@string.escape"] = { fg = c.magenta },

        -- -- Types
        -- @type             ; type or class definitions and annotations
        -- @type.builtin     ; built-in types
        -- @type.definition  ; identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
        -- @type.qualifier   ; type qualifiers (e.g. `const`)

        -- @attribute        ; attribute annotations (e.g. Python decorators)
        -- @property         ; the key in key/value pairs

        ["@property"] = { fg = c.cyan },

        -- -- Functions
        -- @function             ; function definitions
        -- @function.builtin     ; built-in functions
        -- @function.call        ; function calls
        -- @function.macro       ; preprocessor macros

        -- @function.method      ; method definitions
        -- @function.method.call ; method calls

        -- @constructor          ; constructor calls and definitions
        -- @operator             ; symbolic operators (e.g. `+` / `*`)

        ["@constructor"] = { fg = c.magenta },
        ["@function.builtin"] = { fg = c.red },

        -- -- Keywords
        -- @keyword             ; keywords not fitting into specific categories
        -- @keyword.coroutine   ; keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
        -- @keyword.function    ; keywords that define a function (e.g. `func` in Go, `def` in Python)
        -- @keyword.operator    ; operators that are English words (e.g. `and` / `or`)
        -- @keyword.import      ; keywords for including modules (e.g. `import` / `from` in Python)
        -- @keyword.storage     ; modifiers that affect storage in memory or life-time
        -- @keyword.repeat      ; keywords related to loops (e.g. `for` / `while`)
        -- @keyword.return      ; keywords like `return` and `yield`
        -- @keyword.debug       ; keywords related to debugging
        -- @keyword.exception   ; keywords related to exceptions (e.g. `throw` / `catch`)

        -- @keyword.conditional         ; keywords related to conditionals (e.g. `if` / `else`)
        -- @keyword.conditional.ternary ; ternary operator (e.g. `?` / `:`)

        -- @keyword.directive         ; various preprocessor directives & shebangs
        -- @keyword.directive.define  ; preprocessor definition directives

        ["@keyword.operator"] = { link = "@operator" },

        -- -- Punctuation
        -- @punctuation.delimiter ; delimiters (e.g. `;` / `.` / `,`)
        -- @punctuation.bracket   ; brackets (e.g. `()` / `{}` / `[]`)
        -- @punctuation.special   ; special symbols (e.g. `{}` in string interpolation)

        ["@punctuation.special"] = { link = "Special" },

        -- -- Comments
        -- @comment               ; line and block comments
        -- @comment.documentation ; comments documenting code

        -- @comment.error         ; error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED:`)
        -- @comment.warning       ; warning-type comments (e.g. `WARNING:`, `FIX:`, `HACK:`)
        -- @comment.todo          ; todo-type comments (e.g. `TODO:`, `WIP:`, `FIXME:`)
        -- @comment.note          ; note-type comments (e.g. `NOTE:`, `INFO:`, `XXX`)

        ["@comment.error"] = { fg = c.diag.error, reverse = opts.inverse },
        ["@comment.warning"] = { fg = c.diag.warning, reverse = opts.inverse },
        ["@comment.todo"] = { fg = c.diag.hint, reverse = opts.inverse },
        ["@comment.note"] = { fg = c.diag.info, reverse = opts.inverse },

        -- -- Markup
        -- Mainly for markup languages
        -- @markup.strong         ; bold text
        -- @markup.italic         ; text with emphasis
        -- @markup.strikethrough  ; strikethrough text
        -- @markup.underline      ; underlined text (only for literal underline markup!)

        -- @markup.heading        ; headings, titles (including markers)

        -- @markup.quote          ; block quotes
        -- @markup.math           ; math environments (e.g. `$ ... $` in LaTeX)
        -- @markup.environment    ; environments (e.g. in LaTeX)

        -- @markup.link           ; text references, footnotes, citations, etc.
        -- @markup.link.label     ; link, reference descriptions
        -- @markup.link.url       ; URL-style links

        -- @markup.raw            ; literal or verbatim text (e.g., inline code)
        -- @markup.raw.block      ; literal or verbatim text as a stand-alone block
        --                        ; (use priority 90 for blocks with injections)

        -- @markup.list           ; list markers
        -- @markup.list.checked   ; checked todo-style list markers
        -- @markup.list.unchecked ; unchecked todo-style list markers

        -- @diff.plus       ; added text (for diff files)
        -- @diff.minus      ; deleted text (for diff files)
        -- @diff.delta      ; changed text (for diff files)

        -- @tag           ; XML tag names
        -- @tag.attribute ; XML tag attributes
        -- @tag.delimiter ; XML tag delimiters

        ["@markup.strong"] = { bold = opts.bold },
        ["@markup.italic"] = { italic = opts.italic.emphasis },
        ["@markup.strikethrough"] = { strikethrough = opts.strikethrough },
        ["@markup.underline"] = { underline = opts.underline },

        ["@markup.heading"] = { link = "Title" },

        ["@markup.link"] = { link = "Constant" },

        ["@markup.raw"] = { link = "String" },

        ["@tag"] = { link = "Label" },
        ["@tag.attribute"] = { link = "@property" },
        ["@tag.delimiter"] = { link = "Delimiter" },

        -- -- Non-highlighting captures
        -- @none    ; completely disable the highlight
        -- @conceal ; captures that are only meant to be concealed

        -- @spell   ; for defining regions to be spellchecked
        -- @nospell ; for defining regions that should NOT be spellchecked
        -- }}}

        -- Diagnostics
        -- :h diagnostic-highlights
        DiagnosticError = { fg = c.diag.error },
        DiagnosticWarn = { fg = c.diag.warning },
        DiagnosticInfo = { fg = c.diag.info },
        DiagnosticHint = { fg = c.diag.hint },
        DiagnosticOk = { fg = c.diag.ok },
        DiagnosticUnderlineError = { undercurl = opts.undercurl, sp = c.diag.error },
        DiagnosticUnderlineWarn = { undercurl = opts.undercurl, sp = c.diag.warning },
        DiagnosticUnderlineInfo = { undercurl = opts.undercurl, sp = c.diag.info },
        DiagnosticUnderlineHint = { undercurl = opts.undercurl, sp = c.diag.hint },
        DiagnosticUnderlineOk = { undercurl = opts.undercurl, sp = c.diag.ok },
        DiagnosticVirtualTextError = { bg = utils.darken(c.diag.error, 0.1, c.bg), fg = c.diag.error },
        DiagnosticVirtualTextWarn = { bg = utils.darken(c.diag.warning, 0.1, c.bg), fg = c.diag.warning },
        DiagnosticVirtualTextInfo = { bg = utils.darken(c.diag.info, 0.1, c.bg), fg = c.diag.info },
        DiagnosticVirtualTextHint = { bg = utils.darken(c.diag.hint, 0.1, c.bg), fg = c.diag.hint },
        DiagnosticVirtualTextOk = { bg = utils.darken(c.diag.ok, 0.1, c.bg), fg = c.diag.hint },

        -- NeoVim
        healthError = { link = "DiagnosticError" },
        healthSuccess = { link = "DiagnosticOk" },
        healthWarning = { link = "DiagnosticWarn" },

        -- diff
        diffAdded = { fg = c.diff.add },
        diffRemoved = { fg = c.diff.delete },
        diffChanged = { fg = c.diff.change },
        diffOldFile = { fg = c.yellow },
        diffNewFile = { fg = c.dull_yellow },
        diffFile = { fg = c.blue },
        diffLine = { fg = c.comment },
        diffIndexLine = { fg = c.magenta },

        -- LSP highlight
        -- :h lsp-highlight
        LspReferenceRead = { bg = c.selection, bold = opts.bold },
        LspReferenceText = { bg = c.selection, bold = opts.bold },
        LspReferenceWrite = { bg = c.selection, bold = opts.bold },
        LspSignatureActiveParameter = { link = "Visual" },

        -- Lspconfig
        -- :h lspconfig-highlight
        LspInfoBorder = { link = "FloatBorder" },

        -- -- LSP Semantic Token
        -- :h lsp-semantic-highlight
        -- {{{
        -- for the type
        ["@lsp.type.namespace"] = { link = "@module" },
        -- ["@lsp.type.class"] = {},
        -- ["@lsp.type.enum"] = {},
        -- ["@lsp.type.interface"] = {},
        -- ["@lsp.type.struct"] = {},
        -- ["@lsp.type.typeParameter"] = {},
        ["@lsp.type.type"] = { link = "@type" },
        ["@lsp.type.parameter"] = { link = "@variable.parameter" },
        ["@lsp.type.variable"] = {}, -- use treesitter styles
        ["@lsp.type.property"] = { link = "@property" },
        -- ["@lsp.type.enumMember"] = {},
        -- ["@lsp.type.decorator"] = {},
        -- ["@lsp.type.event"] = {},
        ["@lsp.type.function"] = { link = "@function" },
        ["@lsp.type.method"] = { link = "@function.method" },
        ["@lsp.type.macro"] = { link = "@function.macro" },
        ["@lsp.type.label"] = { link = "@label" },
        ["@lsp.type.comment"] = {}, -- use treesitter styles
        ["@lsp.type.string"] = { link = "@string" },
        ["@lsp.type.keyword"] = { link = "@keyword" },
        ["@lsp.type.number"] = { link = "@number" },
        -- ["@lsp.type.regexp"] = {},
        ["@lsp.type.operator"] = { link = "@operator" },

        -- for each modifier
        ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
        ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
        -- }}}

        -- WhichKey
        -- :h which-key.nvim-which-key-colors
        WhichKey = { fg = c.primary },
        WhichKeyGroup = { fg = c.green },
        WhichKeyDesc = { fg = c.fg },

        -- GitSigns
        -- :h gitsigns-highlight-groups
        GitSignsAdd = { fg = c.diff.add },
        GitSignsChange = { fg = c.diff.change },
        GitSignsDelete = { fg = c.diff.delete },

        -- Telescope
        TelescopeNormal = { fg = c.fg, bg = c.float.bg },
        TelescopeBorder = { fg = c.float.border, bg = c.float.bg },
        TelescopeTitle = { fg = c.float.title, bg = c.float.bg },
        TelescopeMatching = { fg = c.match, bold = opts.bold },

        -- NvimTree
        -- :h nvim-tree-highlight
        -- {{{
        -- File Text:
        NvimTreeSymlink = { fg = c.cyan },
        NvimTreeExecFile = { fg = c.green, bold = opts.bold },
        NvimTreeSpecialFile = { fg = c.yellow, underline = opts.underline },
        NvimTreeImageFile = { fg = c.magenta },
        -- Folder Text:
        NvimTreeRootFolder = { fg = c.blue, bold = opts.bold },
        -- Indent:
        NvimTreeIndentMarker = { fg = c.fg_soft },
        -- Picker:
        NvimTreeWindowPicker = { fg = c.primary, bg = c.line, bold = opts.bold },
        -- Git Icon:
        NvimTreeGitDeletedIcon = { fg = c.diff.delete },
        NvimTreeGitDirtyIcon = { fg = c.diff.change },
        NvimTreeGitIgnoredIcon = { fg = c.comment },
        NvimTreeGitMergeIcon = { fg = c.dull_yellow },
        NvimTreeGitNewIcon = { fg = c.diff.add },
        NvimTreeGitRenamedIcon = { fg = c.diff.change },
        NvimTreeGitStagedIcon = { fg = c.diff.add },
        -- }}}

        -- Dashboard
        -- :h dashboard-configuration-theme-config
        DashboardHeader = { fg = c.primary },
        DashboardFooter = { fg = c.primary },

        -- BufferLine
        BufferLineIndicatorSelected = { fg = c.primary },
        BufferLineOffsetSeparator = { link = "WinSeparator" },

        -- Cmp
        -- :h cmp-highlight
        CmpItemAbbr = { fg = c.fg, bg = c.none },
        CmpItemAbbrDeprecated = { fg = c.fg_soft, bg = c.none, strikethrough = opts.strikethrough },
        CmpItemAbbrMatch = { fg = c.match, bold = opts.bold },
        CmpItemAbbrMatchFuzzy = { sp = c.match, undercurl = opts.undercurl },
        CmpItemMenu = { fg = c.fg_soft, bg = c.none },

        -- Navic
        -- :h navic-highlights
        NavicSeparator = { fg = c.fg },
        NavicText = { fg = c.fg },

        -- Illuminate
        -- :h illuminate-highlight-groups
        IlluminatedWordText = { link = "LspReferenceText" },
        IlluminatedWordRead = { link = "LspReferenceRead" },
        IlluminatedWordWrite = { link = "LspReferenceWrite" },

        -- nvim-dap-ui
        -- source https://github.com/rcarriga/nvim-dap-ui/blob/master/lua/dapui/config/highlights.lua
        debugPC = { bg = utils.darken(c.yellow, 0.1, c.bg) },
        debugBreakpoint = { fg = c.blue, bg = utils.darken(c.blue, 0.1, c.bg) },
        DapUINormal = { link = "Normal" },
        DapUIVariable = { link = "Normal" },
        DapUIScope = { fg = c.cyan },
        DapUIType = { fg = c.magenta },
        DapUIValue = { link = "Normal" },
        DapUIModifiedValue = { fg = c.cyan, bold = opts.bold },
        DapUIDecoration = { fg = c.cyan },
        DapUIThread = { fg = c.green },
        DapUIStoppedThread = { fg = c.cyan },
        DapUIFrameName = { link = "Normal" },
        DapUISource = { fg = c.magenta },
        DapUILineNumber = { fg = c.cyan },
        DapUIFloatNormal = { link = "NormalFloat" },
        DapUIFloatBorder = { fg = c.cyan },
        DapUIWatchesEmpty = { fg = c.red },
        DapUIWatchesValue = { fg = c.green },
        DapUIWatchesError = { fg = c.red },
        DapUIBreakpointsPath = { fg = c.cyan },
        DapUIBreakpointsInfo = { fg = c.green },
        DapUIBreakpointsCurrentLine = { fg = c.green, bold = opts.bold },
        DapUIBreakpointsLine = { link = "DapUILineNumber" },
        DapUIBreakpointsDisabledLine = { fg = c.fg_soft },
        DapUICurrentFrameName = { link = "DapUIBreakpointsCurrentLine" },
        DapUIStepOver = { fg = c.cyan },
        DapUIStepInto = { fg = c.cyan },
        DapUIStepBack = { fg = c.cyan },
        DapUIStepOut = { fg = c.cyan },
        DapUIStop = { fg = c.red },
        DapUIPlayPause = { fg = c.green },
        DapUIRestart = { fg = c.green },
        DapUIUnavailable = { fg = c.fg_soft },
        DapUIWinSelect = { fg = c.cyan, bold = opts.bold },
        DapUIEndofBuffer = { link = "EndofBuffer" },
    }

    -- Cmp and Navic
    -- :h navic-highlights
    -- :h cmp-highlight
    -- {{{
    -- stylua: ignore start
    local kinds = {
        Array           = "@punctuation.bracket",
        Boolean         = "@boolean",
        Class           = "@type",
        Color           = "Special",
        Constant        = "@constant",
        Constructor     = "@constructor",
        Enum            = "Structure",
        EnumMember      = "@constant",
        Event           = "Special",
        Field           = "@variable.member",
        File            = "@variable",
        Folder          = "Directory",
        Function        = "@function",
        Interface       = "Structure",
        Key             = "@variable.member",
        Keyword         = "@keyword",
        Method          = "@function.method",
        Module          = "@module",
        Namespace       = "@module",
        Null            = "@constant.builtin",
        Number          = "@number",
        Object          = "@constant",
        Operator        = "@operator",
        Package         = "@module",
        Property        = "@property",
        Reference       = "@markup.link",
        Snippet         = "Conceal",
        String          = "@string",
        Struct          = "Structure",
        Text            = "@comment",
        TypeParameter   = "TypeDef",
        Unit            = "Structure",
        Value           = "@string",
        Variable        = "@variable",
    }
    -- stylua: ignore end

    local kind_groups = { "NavicIcons%s", "CmpItemKind%s" }

    for kind, link in pairs(kinds) do
        for _, plugin in pairs(kind_groups) do
            highlights[plugin:format(kind)] = { link = link }
        end
    end
    -- }}}

    -- Terminal
    if opts.terminal_colors then
        -- stylua: ignore start
        local term_colors = {
            c.bg,               -- color0     Black
            c.red,              -- color1     Red
            c.green,            -- color2     Green
            c.yellow,           -- color3     Yellow
            c.blue,             -- color4     Blue
            c.magenta,          -- color5     Magenta
            c.cyan,             -- color6     Cyan
            c.fg,               -- color7     White

            c.bg_soft,          -- color8     BrightBlack
            c.bright_red,       -- color9     BrightRed
            c.bright_green,     -- color10    BrightGreen
            c.bright_yellow,    -- color11    BrightYellow
            c.bright_blue,      -- color12    BrightBlue
            c.bright_magenta,   -- color13    BrightMagenta
            c.bright_cyan,      -- color14    BrightCyan
            c.fg_hard,          -- color15    BrightWhite
        }
        -- stylua: ignore end

        for index, value in ipairs(term_colors) do
            vim.g["terminal_color_" .. index - 1] = value
        end
    end

    -- Override specific highlights
    opts.overrides(highlights, c)

    return highlights
end

return M
