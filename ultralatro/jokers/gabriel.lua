SMODS.Joker{ --Gabriel
    key = "gabriel",
    config = {
        extra = {
            respect = 0,
            ultra_blade_throw = 0,
            ultra_insignificant = 0,
            rental = 0,
            ignore = 0,
            start_dissolve = 0,
            n = 0,
            ultra_enrage = 0,
            ultra_enrage_loop = 0
        }
    },
    loc_txt = {
        ['name'] = 'Gabriel',
        ['text'] = {
            [1] = 'Gives a {C:gold}B{}{C:blue}l{C:gold}a{C:blue}d{C:gold}e{}{}{}{}',
            [2] = 'every round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["ultra_ultra_jokers"] = true },

    
    calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval  then
        G.E_MANAGER:add_event(Event({
        func = function()
            play_sound("ultra_blade_throw")
            
            return true
            end,
        }))
        return {
            func = function()
                
                local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_ultra_blade' })
                        if joker_card then
                            
                            
                        end
                        G.GAME.joker_buffer = 0
                        return true
                        end
                    }))
                end
                if created_joker then
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                end
                return true
                end
            }
        end
        if context.selling_self  then
            G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("ultra_insignificant")
                    
                    return true
                    end,
                }))
                G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("ultra_enrage")
                    
                    return true
                    end,
                }))
                G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("ultra_enrage_loop")
                    
                    return true
                    end,
                }))
                return {
                    func = function()
                        
                        local created_joker = false
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            created_joker = true
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_ultra_enragedgabriel' })
                                if joker_card then
                                    
                                    joker_card:add_sticker('rental', true)
                                end
                                G.GAME.joker_buffer = 0
                                return true
                                end
                            }))
                        end
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                        end
                        return true
                        end,
                        extra = {
                        func = function()
                            card:start_dissolve()
                            return true
                            end,
                            colour = G.C.RED
                        }
                    }
                end
            end
}