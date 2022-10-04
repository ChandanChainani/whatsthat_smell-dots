-- Always on bleeding edge Neovim from https://git.io/NeovimHEAD
-- NVIM v0.9.0-dev-24-g6abb48105

-- https://github.com/lewis6991/impatient.nvim
-- :LuaCacheClear
require "impatient"

-- Plugins --
require "joel.plugins"

-- Config/Setup --
require "joel.config"

-- Telescope 🔭
require "joel.telescope"

-- mappings (telescope-related maps loaded via telescope mod)
require "joel.mappings"

-- settings(options)
require "joel.settings"

-- globals like P() & DN()
require "joel.globals"
