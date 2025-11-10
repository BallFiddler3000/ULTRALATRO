SMODS.Joker{ --V1
    key = "v1",
    config = {
        extra = {
            combo = 1
        }
    },
    loc_txt = {
        ['name'] = 'V1',
        ['text'] = {
            [1] = 'Gains {X:red,C:white}X1{} Mult for',
            [2] = 'every consecutive',
            [3] = 'hand played.',
            [4] = '{C:blue}Weapons{} are',
            [5] = 'available for use',
            [6] = 'Currently {X:red,C:white}X#1# {} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["ultra_ultra_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.combo}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            card.ability.extra.combo = (card.ability.extra.combo) + 1
            return {
                Xmult = card.ability.extra.combo
            }
        end
        if context.pre_discard  then
            return {
                func = function()
                    card.ability.extra.combo = 1
                    return true
                    end,
                    message = "Combo lost!"
                }
            end
        end
}