SMODS.Joker{ --0-S: Something Wicked...
    key = "somethingwicked",
    config = {
        extra = {
            chips = 150,
            chips2 = 50,
            chips3 = 0,
            chips4 = -100
        }
    },
    loc_txt = {
        ['name'] = '0-S: Something Wicked...',
        ['text'] = {
            [1] = '...this way comes.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
        if context.cardarea == G.jokers and context.joker_main  then
            if ((G.GAME.pool_flags.ultra_red_activated or false) and (G.GAME.pool_flags.ultra_blue_activated or false)) then
                return {
                    chips = card.ability.extra.chips
                }
            elseif (G.GAME.pool_flags.ultra_red_activated or false) then
                return {
                    chips = card.ability.extra.chips2
                }
            elseif (G.GAME.pool_flags.ultra_blue_activated or false) then
                return {
                    chips = card.ability.extra.chips3
                }
            else
                return {
                    chips = card.ability.extra.chips4
                }
            end
        end
    end
}