SMODS.Joker{ --Coin
    key = "coin",
    config = {
        extra = {
            xchips = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Coin',
        ['text'] = {
            [1] = '{X:blue,C:white}X1.2{} Chips for every',
            [2] = '{C:blue}weapon{} in jokers'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 2,
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
        if context.other_joker  then
            if (function()
                return context.other_joker.config.center.rarity == "ultra_weapons"
                end)() then
                    return {
                        x_chips = card.ability.extra.xchips
                    }
                end
            end
        end
}