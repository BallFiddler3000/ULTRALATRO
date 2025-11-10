SMODS.Joker{ --Flesh Prison
    key = "fleshprison",
    config = {
        extra = {
            rounds = 0,
            Xmult = 0.3,
            ignore = 0,
            start_dissolve = 0,
            n = 0,
            ultra_mp_intro = 0
        }
    },
    loc_txt = {
        ['name'] = 'Flesh Prison',
        ['text'] = {
            [1] = '{X:red,C:white}X0.3{} Mult',
            [2] = 'Unleashes {C:blue}Minos Prime{}',
            [3] = 'after {C:gold}5{} rounds',
            [4] = 'Round number: {C:gold}#1# {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["ultra_ultra_jokers"] = true },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' 
          or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.rounds}}
    end,

    
    calculate = function(self, card, context)
    if context.end_of_round and context.game_over == false and context.main_eval  then
        if (card.ability.extra.rounds or 0) == 5 then
            G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("ultra_mp_intro")
                    SMODS.calculate_effect({message = "Ah, free, at last"}, card)
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
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_ultra_minosprime' })
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
                        end,
                        extra = {
                        func = function()
                            card:start_dissolve()
                            return true
                            end,
                            colour = G.C.RED
                        }
                    }
                else
                    return {
                        func = function()
                            card.ability.extra.rounds = (card.ability.extra.rounds) + 1
                            return true
                            end
                        }
                    end
                end
                if context.cardarea == G.jokers and context.joker_main  then
                    return {
                        Xmult = card.ability.extra.Xmult
                    }
                end
            end
}