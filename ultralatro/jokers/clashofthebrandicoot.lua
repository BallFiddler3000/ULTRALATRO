SMODS.Joker{ --4-S: Clash of the Brandicoot
    key = "clashofthebrandicoot",
    config = {
        extra = {
            n = 0,
            appear = 0,
            red_activated = 0
        }
    },
    loc_txt = {
        ['name'] = '4-S: Clash of the Brandicoot',
        ['text'] = {
            [1] = 'Makes {C:blue}Skull{} {C:red}Keys{} act',
            [2] = 'like {C:gold}Mr. Bones{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["ultra_ultra_jokers"] = true, ["ultra_ultra_secrets"] = true },

    
    calculate = function(self, card, context)
    if context.end_of_round and context.game_over and context.main_eval  then
        if (G.GAME.pool_flags.ultra_blue_activated or false) then
            G.GAME.pool_flags.ultra_blue_activated = false
            return {
                saved = true,
                message = "Saved!",
                extra = {
                
                G.P_CENTERS["c_ultra_blueskullkey"].in_pool == function() return true end
                ,
                colour = G.C.MONEY
                }
            }
        end
    elseif (G.GAME.pool_flags.ultra_red_activated or false) then
        G.GAME.pool_flags.ultra_red_activated = false
        return {
            saved = true,
            message = "Saved!",
            extra = {
            
            G.P_CENTERS["c_ultra_redskullkey"].in_pool == function() return true end
            ,
            colour = G.C.MONEY
            }
        }
    end
end
}