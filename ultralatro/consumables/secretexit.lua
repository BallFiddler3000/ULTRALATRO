SMODS.Consumable {
    key = 'secretexit',
    set = 'Tarot',
    pos = { x = 5, y = 0 },
    loc_txt = {
        name = 'Secret Exit',
        text = {
        [1] = 'Gives a {C:gold}Joker{} based',
        [2] = 'on {C:purple}Secret Levels{}'
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
                      local new_joker = SMODS.add_card({ set = 'ultra_ultra_secrets' })
                      if new_joker then
                      end
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}