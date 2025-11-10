SMODS.Joker{ --Knuckleblaster
    key = "knuckleblaster",
    config = {
        extra = {
            Xmult = 0.9,
            mult = -20
        }
    },
    loc_txt = {
        ['name'] = 'Knuckleblaster',
        ['text'] = {
            [1] = 'Wins {C:gold}Small Blinds{}',
            [2] = 'automatically,',
            [3] = '{X:red,C:white}X0.9{} and {C:red}-20{} Mult',
            [4] = 'on other {C:gold}Blinds{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["ultra_ultra_jokers"] = true },

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if G.GAME.blind:get_type() == 'Small' then
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
                message = "Win!"
            }
        end
    end
    if context.cardarea == G.jokers and context.joker_main  then
        if not (G.GAME.blind:get_type() == 'Small') then
            return {
                Xmult = card.ability.extra.Xmult,
                extra = {
                mult = card.ability.extra.mult
            }
        }
    end
end
end
}