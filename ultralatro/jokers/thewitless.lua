SMODS.Joker{ --1-S: The Witless
    key = "thewitless",
    config = {
        extra = {
            xchips = 4.5,
            xchips2 = 3,
            xchips3 = 3,
            xchips4 = 3,
            xchips5 = 1.5,
            xchips6 = 1.5,
            xchips7 = 1.5
        }
    },
    loc_txt = {
        ['name'] = '1-S: The Witless',
        ['text'] = {
            [1] = 'Gains {X:blue,C:white}X1.5{} Chips per',
            [2] = 'unique {C:gold}Arm{} in {C:gold}Jokers{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
            if ((function()
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.key == "j_ultra_feedbacker" then
                        return true
                        end
                    end
                    return false
                    end)() and (function()
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i].config.center.key == "j_ultra_knuckleblaster" then
                                return true
                                end
                            end
                            return false
                            end)() and (function()
                                for i = 1, #G.jokers.cards do
                                    if G.jokers.cards[i].config.center.key == "j_ultra_whiplash" then
                                        return true
                                        end
                                    end
                                    return false
                                    end)()) then
                                        return {
                                            x_chips = card.ability.extra.xchips
                                        }
                                    elseif ((function()
                                        for i = 1, #G.jokers.cards do
                                            if G.jokers.cards[i].config.center.key == "j_ultra_feedbacker" then
                                                return true
                                                end
                                            end
                                            return false
                                            end)() and (function()
                                                for i = 1, #G.jokers.cards do
                                                    if G.jokers.cards[i].config.center.key == "j_ultra_knuckleblaster" then
                                                        return true
                                                        end
                                                    end
                                                    return false
                                                    end)()) then
                                                        return {
                                                            x_chips = card.ability.extra.xchips2
                                                        }
                                                    elseif ((function()
                                                        for i = 1, #G.jokers.cards do
                                                            if G.jokers.cards[i].config.center.key == "j_ultra_feedbacker" then
                                                                return true
                                                                end
                                                            end
                                                            return false
                                                            end)() and (function()
                                                                for i = 1, #G.jokers.cards do
                                                                    if G.jokers.cards[i].config.center.key == "j_ultra_whiplash" then
                                                                        return true
                                                                        end
                                                                    end
                                                                    return false
                                                                    end)()) then
                                                                        return {
                                                                            x_chips = card.ability.extra.xchips3
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
                                                                                    if G.jokers.cards[i].config.center.key == "j_ultra_whiplash" then
                                                                                        return true
                                                                                        end
                                                                                    end
                                                                                    return false
                                                                                    end)()) then
                                                                                        return {
                                                                                            x_chips = card.ability.extra.xchips4
                                                                                        }
                                                                                    elseif (function()
                                                                                        for i = 1, #G.jokers.cards do
                                                                                            if G.jokers.cards[i].config.center.key == "j_ultra_feedbacker" then
                                                                                                return true
                                                                                                end
                                                                                            end
                                                                                            return false
                                                                                            end)() then
                                                                                                return {
                                                                                                    x_chips = card.ability.extra.xchips5
                                                                                                }
                                                                                            elseif (function()
                                                                                                for i = 1, #G.jokers.cards do
                                                                                                    if G.jokers.cards[i].config.center.key == "j_ultra_knuckleblaster" then
                                                                                                        return true
                                                                                                        end
                                                                                                    end
                                                                                                    return false
                                                                                                    end)() then
                                                                                                        return {
                                                                                                            x_chips = card.ability.extra.xchips6
                                                                                                        }
                                                                                                    elseif (function()
                                                                                                        for i = 1, #G.jokers.cards do
                                                                                                            if G.jokers.cards[i].config.center.key == "j_ultra_whiplash" then
                                                                                                                return true
                                                                                                                end
                                                                                                            end
                                                                                                            return false
                                                                                                            end)() then
                                                                                                                return {
                                                                                                                    x_chips = card.ability.extra.xchips7
                                                                                                                }
                                                                                                            end
                                                                                                        end
                                                                                                    end
}