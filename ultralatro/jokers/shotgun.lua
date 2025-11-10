SMODS.Joker{ --Core Eject Shotgun
    key = "shotgun",
    config = {
        extra = {
            repetitions = 2,
            repetitions2 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Core Eject Shotgun',
        ['text'] = {
            [1] = '{C:gold}Retriggers{} first',
            [2] = 'played card {C:gold}twice{},',
            [3] = 'second card {C:gold}once{},',
            [4] = 'and all other cards',
            [5] = 'get {C:red}destroyed{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
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
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.repetition and context.cardarea == G.play  then
            if (context.other_card == context.scoring_hand[1] and (function()
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.key == "j_ultra_v1" then
                        return true
                        end
                    end
                    return false
                    end)()) then
                        return {
                            repetitions = card.ability.extra.repetitions,
                            message = localize('k_again_ex')
                        }
                    elseif (context.other_card == context.scoring_hand[2] and (function()
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i].config.center.key == "j_ultra_v1" then
                                return true
                                end
                            end
                            return false
                            end)()) then
                                return {
                                    repetitions = card.ability.extra.repetitions2,
                                    message = localize('k_again_ex')
                                }
                            end
                        end
                        if context.individual and context.cardarea == G.play  then
                            context.other_card.should_destroy = false
                            if (not (context.other_card == context.scoring_hand[1]) and not (context.other_card == context.scoring_hand[2]) and (function()
                                for i = 1, #G.jokers.cards do
                                    if G.jokers.cards[i].config.center.key == "j_ultra_v1" then
                                        return true
                                        end
                                    end
                                    return false
                                    end)()) then
                                        context.other_card.should_destroy = true
                                        return {
                                            message = "Destroyed!"
                                        }
                                    end
                                end
                            end
}