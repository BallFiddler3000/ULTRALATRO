SMODS.Consumable {
    key = 'redskullkey',
    set = 'Tarot',
    pos = { x = 4, y = 0 },
    loc_txt = {
        name = 'Red Skull Key',
        text = {
        [1] = '{C:red}Activates{} something...'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "red_activated", colour = G.C.BLUE})
                    G.GAME.pool_flags.ultra_red_activated = true
                    return true
                end
            }))
            delay(0.6)
            G.P_CENTERS["c_ultra_redskullkey"].in_pool = function() return false end
    end,
    can_use = function(self, card)
        return true
    end
}