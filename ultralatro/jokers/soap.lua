SMODS.Joker{ --Soap
    key = "soap",
    config = {
        extra = {
            start_dissolve = 0,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Soap',
        ['text'] = {
            [1] = 'Wins {C:gold}Boss Blinds{}',
            [2] = 'automatically,',
            [3] = '{C:red}destroys{} itself after'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["ultra_ultra_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if G.GAME.blind.boss then
                G.E_MANAGER:add_event(Event({
                blocking = false,
                func = function()
                    if G.STATE == G.STATES.SELECTING_HAND then
                        G.GAME.chips = G.GAME.blind.chips
                        G.STATE = G.STATES.HAND_PLAYED
                        G.STATE_COMPLETE = true
                    end_round()
                    return true
                    end
                end
            }))
            return {
                message = "Win!",
                extra = {
                func = function()
                    card:start_dissolve()
                    return true
                    end,
                    colour = G.C.RED
                }
            }
        end
    end
end
}