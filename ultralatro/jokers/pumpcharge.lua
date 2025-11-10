SMODS.Joker{ --Pump Charge Jackhammer
    key = "pumpcharge",
    config = {
        extra = {
            rounds = 0,
            blindchiprequirement = 0,
            ultra_impact = 0,
            ultra_explosion = 0
        }
    },
    loc_txt = {
        ['name'] = 'Pump Charge Jackhammer',
        ['text'] = {
            [1] = 'Adds {C:blue}1/3{} of {C:gold}Blind{}\'s',
            [2] = '{C:gold}required score{} to {C:blue}Chips{}',
            [3] = '{C:gold}5{} round cooldown',
            [4] = 'Coodown: {C:gold}#1# {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
        return {vars = {card.ability.extra.rounds}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.key == "j_ultra_v1" then
                        return true
                        end
                    end
                    return false
                    end)() and (card.ability.extra.rounds or 0) == 0) then
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("ultra_impact")
                            
                            return true
                            end,
                        }))
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("ultra_explosion")
                            
                            return true
                            end,
                        }))
                        card.ability.extra.rounds = 5
                        return {
                            chips = (G.GAME.blind.chips) * 0.33333
                        }
                    end
                end
            if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                        card.ability.extra.rounds = math.max(0, (card.ability.extra.rounds) - 1)
                        return true
                        end
                    }
                end
            end
}