Config = {}

Config.Locale = 'en'
Config.Debug = true -- enables client "debug_print" & debug command to test treatment through ox_lib context.

Config.costMoney = true -- If set "true" treatment will cost money. If "false", it will be free for everyone.
Config.treatmentPrice = 500 -- cost to receive treatment (cash).
Config.lowHealth = false -- If set "true" when your health is low you will have a "bleeding" screen effect. If "false", it will be disabled.

Config.NPC = { -- npc location & model
    {
        coords  = vec3(311.57, -594.11, 43.28 - 0.99),
        heading = 0.5000,
        model   = `s_m_m_doctor_01`
    }
  }

-- Shared function for locales
Config.Locales = {}

function Locale(str)
    if Config.Locales[Config.Locale][str] then return Config.Locales[Config.Locale][str] else return 'Translation missing' end
end
