SMODS.Joker{ --Whiplash
    key = "whiplash",
    config = {
        extra = {
            Xmult = 4
        }
    },
    loc_txt = {
        ['name'] = 'Whiplash',
        ['text'] = {
            [1] = '{X:red,C:white}X4{} Mult but',
            [2] = '{C:inactive}flips{} and {C:gold}shuffles{}',
            [3] = 'all {C:gold}Jokers{} at the',
            [4] = 'start of a {C:gold}Blind{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
        if context.setting_blind  then
            if #G.jokers.cards > 0 then
                for _, joker in ipairs(G.jokers.cards) do
                    joker:flip()
                end
            end
            if #G.jokers.cards > 1 then
                G.jokers:unhighlight_all()
                G.E_MANAGER:add_event(Event({
                trigger = 'before',
                func = function()
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        G.jokers:shuffle('aajk')
                        play_sound('cardSlide1', 0.85)
                        return true
                        end,
                    }))
                    delay(0.15)
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        G.jokers:shuffle('aajk')
                        play_sound('cardSlide1', 1.15)
                        return true
                        end
                    }))
                    delay(0.15)
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        G.jokers:shuffle('aajk')
                        play_sound('cardSlide1', 1)
                        return true
                        end
                    }))
                    delay(0.5)
                    return true
                    end
                }))
            end
            return {
                message = "Flip!",
                extra = {
                message = "Shuffle!",
                colour = G.C.ORANGE
            }
        }
    end
if context.end_of_round and context.game_over == false and context.main_eval  then
    if #G.jokers.cards > 0 then
        for _, joker in ipairs(G.jokers.cards) do
            joker:flip()
        end
    end
    return {
        message = "Flip!"
    }
end
end
}