SMODS.Back {
    key = 'the_fire_is_gone',
    pos = { x = 0, y = 0 },
    config = {
      joker_slots_value = 1,
},
    loc_txt = {
        name = 'The Fire is Gone',
        text = {
            [1] = 'Start off with a',
            [2] = '{C:spectral}negative {}{C:dark_edition}eternal{} {X:blue,C:white}V1{}',
            [3] = '{C:gold}-1 Joker{} slot'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
     apply = function(self, back)
            G.E_MANAGER:add_event(Event({
                  func = function()
                      play_sound('timpani')
                      local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_ultra_v1' })
                          new_joker:set_edition("e_negative", true)
                          new_joker:add_sticker('eternal', true)
                      return true
                  end
              }))
            G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots - 1
    end
}