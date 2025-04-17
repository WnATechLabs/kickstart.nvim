-- autosave
-- https://github.com/Pocco81/auto-save.nvim

local function is_dadbod_ui_tmp_file(buf)
  local ok, name = pcall(vim.api.nvim_buf_get_name, buf)
  if not ok or not name then
    return false
  end

  -- Defensive: make sure it's a string before matching
  if type(name) ~= "string" then
    return false
  end

  -- Match known dadbod-ui paths
  return name:match("/nvim%.williamallen/") or name:match("/db_ui/")
end

return {
  'Pocco81/auto-save.nvim',
  config = function()
    require('auto-save').setup {
      condition = function(buf)
        local ok, result = pcall(is_dadbod_ui_tmp_file, buf)
        if not ok then
          vim.notify("[auto-save] Error checking dadbod-ui exclusion: " .. result, vim.log.levels.WARN)
          return true -- Fail-safe: allow save rather than disable auto-save
        end

        return not result
      end,
    }
  end,
}
