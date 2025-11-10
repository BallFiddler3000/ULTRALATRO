SMODS.Joker{ --V2
    key = "v2",
    config = {
        extra = {
            Xmult = 2,
            odds = 4,
            respect = 0,
            start_dissolve = 0,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'V2',
        ['text'] = {
            [1] = '{X:red,C:white}X2{} Mult,',
            [2] = '{C:green}#4# in 4{} chance to',
            [3] = 'turn into Red Card'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["ultra_ultra_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_ultra_v2') 
        return {vars = {card.ability.extra.n, card.ability.extra.respect, card.ability.extra.start_dissolve, new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    Xmult = card.ability.extra.Xmult
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_34d47501', 1, card.ability.extra.odds, 'j_ultra_v2', false) then
                            local created_joker = false
                            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                                created_joker = true
                                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_red_card' })
                                    if joker_card then
                                        
                                        
                                    end
                                    G.GAME.joker_buffer = 0
                                    return true
                                    end
                                }))
                            end
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
                                SMODS.calculate_effect({func = function()
                                    card:start_dissolve()
                                    return true
                                    end}, card)
                                end
                                return true
                                end
                            }
                        end
                    end
                end
}