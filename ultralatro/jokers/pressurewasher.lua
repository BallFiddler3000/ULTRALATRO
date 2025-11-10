SMODS.Joker{ --Pressure Washer
    key = "pressurewasher",
    config = {
        extra = {
            pb_mult_2ff9e133 = 15,
            perma_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Pressure Washer',
        ['text'] = {
            [1] = '{C:blue}Washes off{} card',
            [2] = '{C:enhanced}Enhancements{}',
            [3] = 'Adds {C:red}+15{} Mult to',
            [4] = 'that card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
    pools = { ["ultra_ultra_jokers"] = true, ["ultra_ultra_weapons?"] = true },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'uta' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'wra'
          )
          and true
      end,

    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                        end
                    end
                    return false
                    end)() then
                        context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                        context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.pb_mult_2ff9e133
                        context.other_card:set_ability(G.P_CENTERS.c_base)
                        return {
                            extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card,
                            extra = {
                            message = "Card Modified!",
                                colour = G.C.BLUE
                            }
                        }
                    end
                end
            end
}