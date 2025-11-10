SMODS.Joker{ --5-S: I Only Say Morning
    key = "ionlysaymorning",
    config = {
        extra = {
            odds = 100,
            xchips = 1000,
            Xmult = 1000
        }
    },
    loc_txt = {
        ['name'] = '5-S: I Only Say Morning',
        ['text'] = {
            [1] = '{C:red,s:3}SIZE 2 FISH{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["ultra_ultra_jokers"] = true, ["ultra_ultra_secrets"] = true },

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_fef9c892', 1, card.ability.extra.odds, 'j_ultra_ionlysaymorning', false) then
                        SMODS.calculate_effect({x_chips = card.ability.extra.xchips}, card)
                            SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
                        end
                    end
                end
            end
}