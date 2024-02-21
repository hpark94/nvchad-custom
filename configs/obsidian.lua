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

  new_notes_location = "current_dir",

  note_id_func = function(title)
    local suffix = ""
    if title ~= nil then
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.time()) .. "-" .. suffix
  end,

  daily_notes = {
    folder = "Tagesnotizen",
    date_format = "%d.%m.%Y",
    alias_format = "%d. %B %Y",
    template = nil,
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
}

return opts
