local M = {}

-- State
local pos = 0
local dir = 1
local width = 80
local speed = 2
local invader = "👾"

function M.bounce()
  pos = pos + (dir * speed)
  if pos >= width then
    dir = -1
  elseif pos <= 0 then
    dir = 1
  end
  local dino = dir == 1 and "🦖" or "🦕"
  return string.rep(" ", pos) .. dino .. " " .. invader
end

function M.start()
  vim.fn.timer_start(100, function()
    vim.schedule(function()
      if vim.bo.buftype == "" then
        vim.opt_local.winbar = M.bounce()
      end
    end)
  end, { ["repeat"] = -1 })
end

return M
