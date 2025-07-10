# b64toggle.nvim

A simple Neovim plugin for encoding and decoding Base64 content directly from visual selections.

## Features

- Encode visual selections to Base64 with `:B64encode`
- Decode Base64 content with `:B64decode`
- Works with any visual selection mode (character, line, block)
- Preserves your registers

## Use Cases

- Working with Kubernetes secrets
- Editing configuration files with encoded content
- Quickly inspecting Base64 encoded data

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
    {
        "NeverW8/b64toggle",
        config = function()
            require("b64toggle").setup()
        end,
    }
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'Neverw8/b64toggle.nvim',
  config = function()
    require('b64toggle').setup()
  end
}
```

## Usage

1. Make a visual selection (using `v`, `V`, or `<C-v>`)
2. Run one of the commands:
   - `:B64encode` - Encode the selected text to Base64
   - `:B64decode` - Decode the selected Base64 text

## Example Key Mappings

Add these to your Neovim configuration:

```lua
-- Map to <Leader>be for Base64 encode
vim.keymap.set('v', '<Leader>be', ':B64encode<CR>', { noremap = true, silent = true })

-- Map to <Leader>bd for Base64 decode
vim.keymap.set('v', '<Leader>bd', ':B64decode<CR>', { noremap = true, silent = true })
```

## Requirements

- Neovim 0.9.0+
- `base64` command-line utility (available by default on most Unix-like systems)

## License

MIT
