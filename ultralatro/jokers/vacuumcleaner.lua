SMODS.Joker { --Vacuum Cleaner
    key = "vacuumcleaner",
    config = {
        extra = {
            chips = 200,
            selected = 0,
            yes = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Vacuum Cleaner',
        ['text'] = {
            [1] = 'Destroys {C:gold}selected Joker{}',
            [2] = 'Gives {C:blue}+200{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
                or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif'
                or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
            )
            and true
    end,


    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if #G.jokers.highlighted == 1 then
                local self_card = G.jokers.highlighted[1]
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('timpani')
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
                if joker ~= card then
                    self_card:start_dissolve()
                end
            end

            if target_joker then
                if target_joker.ability.eternal then
                    target_joker.ability.eternal = nil
                end
                target_joker.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        target_joker:start_dissolve({ G.C.RED }, nil, 1.6)
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                    { message = "Destroyed!", colour = G.C.RED })
            end
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}
