-- autosave
-- https://github.com/Pocco81/auto-save.nvim

local function is_dadbod_ui_tmp_file(buf)
  local ok, name = pcall(vim.api.nvim_buf_get_name, buf)
  if not ok or not name then
    return false
  end

  if type(name) ~= "string" then
    return false
  end

  -- Match known dadbod-ui temporary file paths
  return name:match("/nvim%.williamallen/") or name:match("%.local/share/db_ui/")
end

return {
  'Pocco81/auto-save.nvim',
  config = function()
    require('auto-save').setup {
      condition = function(buf)
        -- FIRST, validate buffer is valid and loaded
        if not vim.api.nvim_buf_is_valid(buf) or not vim.api.nvim_buf_is_loaded(buf) then
          return false -- do not try to save invalid/unloaded buffers
        end

        -- THEN check if it's a dadbod tmp file
        local ok, should_exclude = pcall(is_dadbod_ui_tmp_file, buf)
        if not ok then
          vim.notify("[auto-save.nvim] Error checking dadbod-ui exclusion: " .. should_exclude, vim.log.levels.WARN)
          return true -- fail-safe: better to save than risk blocking
        end

        return not should_exclude
      end,
    }
  end,
}

