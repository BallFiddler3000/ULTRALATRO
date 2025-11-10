SMODS.Joker{ --Sawed-On Shotgun
    key = "sawedon",
    config = {
        extra = {
            mult = 40,
            Xmult = 5,
            mult2 = 10,
            ultra_saw = 0,
            explode = 0,
            n = 0,
            ultra_saw_loop = 0
        }
    },
    loc_txt = {
        ['name'] = 'Sawed-On Shotgun',
        ['text'] = {
            [1] = '{C:red}+10{} Mult',
            [2] = '{C:red}+40{} Mult if {C:blue}Feedbacker{}',
            [3] = 'in {C:gold}Jokers{}',
            [4] = 'Gives {X:red,C:white}X5{} Mult and',
            [5] = 'gets {C:gold}destroyed{} if',
            [6] = '{C:red}Knuckleblaster{} in',
            [7] = 'jokers'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
        local info_queue_1 = G.P_CENTERS["j_ultra_feedbacker"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_ultra_feedbacker\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_2 = G.P_CENTERS["j_ultra_knuckleblaster"]
        if info_queue_2 then
            info_queue[#info_queue + 1] = info_queue_2
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_ultra_knuckleblaster\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.key == "j_ultra_feedbacker" then
                        return true
                        end
                    end
                    return false
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
                                    play_sound("ultra_saw")
                                    
                                    return true
                                    end,
                                }))
                                return {
                                    mult = card.ability.extra.mult
                                }
                            elseif ((function()
                                for i = 1, #G.jokers.cards do
                                    if G.jokers.cards[i].config.center.key == "j_ultra_knuckleblaster" then
                                        return true
                                        end
                                    end
                                    return false
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
                                                    play_sound("ultra_saw_loop")
                                                    
                                                    return true
                                                    end,
                                                }))
                                                return {
                                                    Xmult = card.ability.extra.Xmult,
                                                    extra = {
                                                    func = function()
                                                        card:explode()
                                                        return true
                                                        end,
                                                        colour = G.C.RED
                                                    }
                                                }
                                            elseif (function()
                                                for i = 1, #G.jokers.cards do
                                                    if G.jokers.cards[i].config.center.key == "j_ultra_v1" then
                                                        return true
                                                        end
                                                    end
                                                    return false
                                                    end)() then
                                                        G.E_MANAGER:add_event(Event({
                                                        func = function()
                                                            play_sound("ultra_saw")
                                                            
                                                            return true
                                                            end,
                                                        }))
                                                        return {
                                                            mult = card.ability.extra.mult2
                                                        }
                                                    end
                                                end
                                            end
}