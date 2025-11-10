SMODS.Joker{ --Core Eject Jackhammer
    key = "jackhammer",
    config = {
        extra = {
            countdown = 0,
            Xmult = 5,
            ultra_impact = 0,
            ultra_explosion = 0
        }
    },
    loc_txt = {
        ['name'] = 'Core Eject Jackhammer',
        ['text'] = {
            [1] = '{X:red,C:white}X5{} Mult',
            [2] = '4 round cooldown',
            [3] = 'Cooldown: {C:attention}#1# {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
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
        return {vars = {card.ability.extra.countdown}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((card.ability.extra.countdown or 0) == 0 and (function()
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.key == "j_ultra_v1" then
                        return true
                        end
                    end
                    return false
                    end)()) then
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("ultra_impact")
                            
                            return true
                            end,
                        }))
                        card.ability.extra.countdown = 4
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("ultra_explosion")
                            
                            return true
                            end,
                        }))
                        return {
                            Xmult = card.ability.extra.Xmult
                        }
                    end
                end
            if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                        card.ability.extra.countdown = math.max(0, (card.ability.extra.countdown) - 1)
                        return true
                        end
                    }
                end
            end
}