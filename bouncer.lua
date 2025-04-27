
local trex_pos = 0
local trex_dir = 1
local trex_width = 80
local trex_speed = 2  
local invader_icon = "👾"

local function BounceTrex()
  trex_pos = trex_pos + (trex_dir * trex_speed)

  if trex_pos >= trex_width then
    trex_dir = -1
  elseif trex_pos <= 0 then
    trex_dir = 1
  end

  local dino_icon = trex_dir == 1 and "🦖" or "🦕"
  return string.rep(" ", trex_pos) .. dino_icon .. " " .. invader_icon
end

local function set_trex_winbar()
  if vim.bo.buftype == "" then
    vim.opt_local.winbar = BounceTrex()
  end
end

--walking speed
vim.fn.timer_start(100, function()
  vim.schedule(set_trex_winbar)
end, { ["repeat"] = -1 })
