local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font_with_fallback {
    'Iosevka Term SS12',
    'Cascadia Code'
}

local appearance_themes = {
  Light = 'dawnfox',
  Dark = 'carbonfox',
}

local appearance = wezterm.gui.get_appearance()
config.color_scheme = appearance_themes[appearance] or 'carbonfox'
config.font_size = 14
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
-- config.front_end = "WebGpu"
-- config.integrated_title_button_style = "Gnome"

function basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

wezterm.on(
    'format-tab-title',
    function(tab, tabs, panes, config, hover, maxwidth)
        local tab_name
        local title = tab.tab_title
        if title and #title > 0 then
            tab_name =  tab.tab_id .. ':' .. title
        end
        local pane = tab.active_pane
        local name = pane.foreground_process_name
        if name then
            tab_name = tab.tab_id .. ':' .. basename(name)
        end
        if tab.is_active then
            return {
                'ResetAttributes',
                { Text = ' ' .. tab_name .. '* '},
            }
        -- elseif tab.is_last_active then
        --     return {
        --         { Text = ' ' .. tab_name .. '- ' },
        --     }
        else
            return {
                'ResetAttributes',
                { Text = ' ' .. tab_name .. '  ' }
            }
        end
    end
)

-- keys
local act = wezterm.action
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    {
        key = 'a',
        mods = 'LEADER|CTRL',
        action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
    },
    {
        key = "c",
        mods = "LEADER",
        action = act.SpawnTab 'CurrentPaneDomain'
    },
    {
        key = "e",
        mods = "LEADER",
        action = act.CharSelect {
            copy_on_select = true,
            copy_to = 'ClipboardAndPrimarySelection',
        },
    },
    {
        key = "C",
        mods = "LEADER",
        action = act.SpawnTab 'CurrentPaneDomain'
    },
    {
        key = "x",
        mods = "LEADER",
        action = act.CloseCurrentPane { confirm = true }
    },
    {
        key = "p",
        mods = "LEADER",
        action = act.ActivateTabRelative(-1)
    },
    {
        key = "n",
        mods = "LEADER",
        action = act.ActivateTabRelative(1)
    },
    {
        key = "%",
        mods = "LEADER|SHIFT",
        action = act.SplitPane {
            direction = "Right"
        }
    },
    {
        key = "\"",
        mods = "LEADER|SHIFT",
        action = act.SplitPane {
            direction = "Down"
        }
    },
    {
        key = "o",
        mods = "LEADER",
        action = act.ActivatePaneDirection 'Next'
    },
    {
        key = "h",
        mods = "LEADER",
        action = act.ActivatePaneDirection 'Left'
    },
    {
        key = "l",
        mods = "LEADER",
        action = act.ActivatePaneDirection 'Right'
    },
    {
        key = "j",
        mods = "LEADER",
        action = act.ActivatePaneDirection 'Down'
    },
    {
        key = "k",
        mods = "LEADER",
        action = act.ActivatePaneDirection 'Up'
    },
    {
        key = "P",
        mods = "LEADER",
        action = act.PasteFrom 'Clipboard'
    },
    {
        key = "s",
        mods = "LEADER",
        action = act.QuickSelect
    },
    {
        key = "Y",
        mods = "LEADER",
        action = act.CopyTo 'Clipboard'
    },
    {
        key = "v",
        mods = "LEADER",
        action = act.ActivateCopyMode
    },
    {
        key = "f",
        mods = "LEADER",
        action = act.Search("CurrentSelectionOrEmptyString")
    },
  {
    key = ',',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
}
for i = 1, 8 do
  -- CTRL+ALT + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'LEADER',
    action = act.ActivateTab(i - 1),
  })
end
return config
