SMODS.Joker{ --Sharpshooter
    key = "sharpshooter",
    config = {
        extra = {
            Xmult = 2,
            odds = 6,
            Xmult2 = 3,
            ultra_shoot = 0
        }
    },
    loc_txt = {
        ['name'] = 'Sharpshooter',
        ['text'] = {
            [1] = 'Leftmost {C:gold}Joker{} gives',
            [2] = '{X:red,C:white}X2{} Mult {C:green}#2# in 6{} chance',
            [3] = 'to {X:red,C:white}rebound{} and make',
            [4] = 'rightmost {C:gold}Joker{} give',
            [5] = '{X:red,C:white}X3{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = "ultra_weapons",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["ultra_ultra_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_ultra_v1"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_ultra_v1\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_ultra_sharpshooter') 
        return {vars = {card.ability.extra.ultra_shoot, new_numerator, new_denominator}}
    end,

    
    calculate = function(self, card, context)
        if context.other_joker  then
            if ((function()
                return G.jokers.cards[1] == context.other_joker
                end)() and (function()
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i].config.center.key == "j_ultra_v1" then
                            return true
                            end
                        end
                        return false
                        end)()) then
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                play_sound("ultra_shoot")
                                
                                return true
                                end,
                            }))
                            return {
                                Xmult = card.ability.extra.Xmult
                            }
                        elseif ((function()
                            return G.jokers.cards[#G.jokers.cards] == context.other_joker
                            end)() and (function()
                                for i = 1, #G.jokers.cards do
                                    if G.jokers.cards[i].config.center.key == "j_ultra_v1" then
                                        return true
                                        end
                                    end
                                    return false
                                    end)()) then
                                        if SMODS.pseudorandom_probability(card, 'group_0_b6d449fa', 1, card.ability.extra.odds, 'j_ultra_sharpshooter', false) then
                                                SMODS.calculate_effect({Xmult = card.ability.extra.Xmult2}, card)
                                            end
                                        end
                                    end
                                end
}