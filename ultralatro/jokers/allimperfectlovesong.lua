SMODS.Joker{ --2-S: All-Imperfect Love Song
    key = "allimperfectlovesong",
    config = {
        extra = {
            mult = 3,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = '2-S: All-Imperfect Love Song',
        ['text'] = {
            [1] = '{X:red,C:white}X3{} Mult',
            [2] = '{C:green}#2# in 4{} chance to',
            [3] = 'switch to {X:red,C:white}X0.5{} Mult',
            [4] = 'for the entire run',
            [5] = 'when {C:gold}Blind{} is selected',
            [6] = 'Currently {X:red,C:white}X#1# {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
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
    pools = { ["ultra_ultra_jokers"] = true, ["ultra_ultra_secrets"] = true },

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_ultra_allimperfectlovesong') 
        return {vars = {card.ability.extra.mult, new_numerator, new_denominator}}
    end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.mult
            }
        end
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_8efda9f7', 1, card.ability.extra.odds, 'j_ultra_allimperfectlovesong', false) then
                        SMODS.calculate_effect({func = function()
                            card.ability.extra.mult = 0.5
                            return true
                            end}, card)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Existential Crisis!", colour = G.C.BLUE})
                        end
                    end
                end
            end
}