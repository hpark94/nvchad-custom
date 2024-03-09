local opts = {
  workspaces = {
    {
      name = "My Vault",
      path = "/home/hpark/vaults/MyVault/",
    },
  },

  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },

  ui = {
    enable = false,
  },

  mappings = {
    ["gf"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
  },

  new_notes_location = "current_dir",

  note_id_func = function(title)
    local id = ""
    if title ~= nil then
      id = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      for _ = 1, 4 do
        id = id .. string.char(math.random(65, 90))
      end
    end
    return id
  end,

  templates = {
    subdir = "Templates",
    date_format = "%d.%m.%Y",
    time_format = "%H:%M",
    -- A map for custom variables, the key should be the variable and the value a function
    substitutions = {},
  },

  daily_notes = {
    folder = "Tagesnotizen",
    date_format = "%d.%m.%Y",
    template = "daily.md",
  },

  wiki_link_func = function(opts)
    if opts.id == nil then
      return string.format("[[%s]]", opts.label)
    elseif opts.label ~= opts.id then
      return string.format("[[%s|%s]]", opts.id, opts.label)
    else
      return string.format("[[%s]]", opts.id)
    end
  end,

  follow_url_func = function(url)
    vim.fn.jobstart { "xdg-open", url }
  end,

  note_frontmatter_func = function(note)
    local out = { id = note.id }

    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end

    return out
  end,
}

return opts
