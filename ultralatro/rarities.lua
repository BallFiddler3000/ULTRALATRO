SMODS.Rarity {
    key = "weapons",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.1,
    badge_colour = HEX('052e5f'),
    loc_txt = {
        name = "Weapons"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}