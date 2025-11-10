SMODS.Joker{ --Sawblade Launcher
    key = "sawbladelauncher",
    config = {
        extra = {
            mult_min = 1,
            mult_max = 100
        }
    },
    loc_txt = {
        ['name'] = 'Sawblade Launcher',
        ['text'] = {
            [1] = '{C:blue}Magnet{} seals give',
            [2] = '{C:red}+1-100{} Mult',
            [3] = 'Adds a card with a',
            [4] = '{C:blue}Magnet{} seal to your',
            [5] = 'deck at the end of a',
            [6] = '{C:gold}Blind{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 3
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
        return {vars = {}}
    end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.seal == "ultra_magnet" then
                return {
                    mult = pseudorandom('mult_e4d59d7a', card.ability.extra.mult_min, card.ability.extra.mult_max)
                }
            end
        end
    if context.end_of_round and context.game_over == false and context.main_eval  then
        local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
        local new_card = create_playing_card({
        front = card_front,
        center = 
        G.P_CENTERS.c_base
    }, G.discard, true, false, nil, true)
    new_card:set_seal("ultra_magnet", true)
    
    G.E_MANAGER:add_event(Event({
    func = function()
        new_card:start_materialize()
        G.play:emplace(new_card)
        return true
        end
    }))
    return {
        func = function()
            G.E_MANAGER:add_event(Event({
            func = function()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                return true
                end
            }))
            draw_card(G.play, G.deck, 90, 'up')
                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
            end,
            message = "Added Card!"
        }
    end
end
}