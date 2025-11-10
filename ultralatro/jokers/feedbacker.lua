SMODS.Joker{ --Feedbacker
    key = "feedbacker",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Feedbacker',
        ['text'] = {
            [1] = '{C:green}#1# in 4{} chance to',
            [2] = '{C:blue}parry{} boss blind',
            [3] = 'effects'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_ultra_feedbacker') 
        return {vars = {new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_0fd2e179', 1, card.ability.extra.odds, 'j_ultra_feedbacker', false) then
                        SMODS.calculate_effect({func = function()
                            if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                                G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.blind:disable()
                                    play_sound('timpani')
                                    return true
                                    end
                                }))
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Parried!", colour = G.C.GREEN})
                            end
                            return true
                            end}, card)
                        end
                    end
                end
            end
}