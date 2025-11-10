SMODS.Joker{ --7-S: Hell Bath No Fury
    key = "hellbathnofury",
    config = {
        extra = {
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = '7-S: Hell Bath No Fury',
        ['text'] = {
            [1] = 'Gives a random {C:blue}Weapon{}{C:inactive}...?{}',
            [2] = 'when a {C:gold}Boss Blind{} is',
            [3] = '{C:red}defeated{}',
            [4] = '(Needs both {C:blue}Skull{} {C:red}Keys{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 2
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
    pools = { ["ultra_ultra_jokers"] = true, ["ultra_ultra_secrets"] = true },

    
    calculate = function(self, card, context)
    if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
        if ((G.GAME.pool_flags.ultra_blue_activated or false) and (G.GAME.pool_flags.ultra_red_activated or false)) then
            return {
                func = function()
                    
                    local created_joker = false
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        created_joker = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'ultra_ultra_weapons?' })
                            if joker_card then
                                
                                
                            end
                            G.GAME.joker_buffer = 0
                            return true
                            end
                        }))
                    end
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Switcheroo!", colour = G.C.BLUE})
                    end
                    return true
                    end
                }
            end
        end
    end
}