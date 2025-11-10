SMODS.Joker{ --Enraged Gabriel
    key = "enragedgabriel",
    config = {
        extra = {
            Xmult = 4,
            ignore = 0,
            start_dissolve = 0,
            n = 0,
            ultra_twice = 0
        }
    },
    loc_txt = {
        ['name'] = 'Enraged Gabriel',
        ['text'] = {
            [1] = '{X:red,C:white}X4{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
        if context.selling_self  then
            G.E_MANAGER:add_event(Event({
            func = function()
                play_sound("ultra_twice")
                    SMODS.calculate_effect({message = "Beaten by an object, TWICE?!"}, card)
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
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_ultra_depressedgabriel' })
                                if joker_card then
                                    
                                    
                                end
                                G.GAME.joker_buffer = 0
                                return true
                                end
                            }))
                        end
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Twice?!", colour = G.C.BLUE})
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