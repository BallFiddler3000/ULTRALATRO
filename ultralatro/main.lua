SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local jokerIndexList = {30,29,10,2,6,5,9,8,16,25,23,13,7,15,4,20,14,22,32,19,24,12,26,27,28,3,18,31,11,1,17,21}

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #jokerIndexList do
        local file_name = files[jokerIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end


local consumableIndexList = {2,3,6,1,4,5}

local function load_consumables_folder()
    local mod_path = SMODS.current_mod.path
    local consumables_path = mod_path .. "/consumables"
    local files = NFS.getDirectoryItemsInfo(consumables_path)
    local set_file_number = #files + 1
    for i = 1, #files do
        if files[i].name == "sets.lua" then
            assert(SMODS.load_file("consumables/sets.lua"))()
            set_file_number = i
        end
    end    
    for i = 1, #consumableIndexList do
        local j = consumableIndexList[i]
        if j >= set_file_number then 
            j = j + 1
        end
        local file_name = files[j].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. file_name))()
        end
    end
end


local sealIndexList = {1}

local function load_seals_folder()
    local mod_path = SMODS.current_mod.path
    local seals_path = mod_path .. "/seals"
    local files = NFS.getDirectoryItemsInfo(seals_path)
    for i = 1, #sealIndexList do
        local file_name = files[sealIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("seals/" .. file_name))()
        end
    end
end


local deckIndexList = {1}

local function load_decks_folder()
    local mod_path = SMODS.current_mod.path
    local decks_path = mod_path .. "/decks"
    local files = NFS.getDirectoryItemsInfo(decks_path)
    for i = 1, #deckIndexList do
        local file_name = files[deckIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("decks/" .. file_name))()
        end
    end
end

local function load_rarities_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("rarities.lua"))()
end

load_rarities_file()
assert(SMODS.load_file("sounds.lua"))()
load_jokers_folder()
load_consumables_folder()
load_seals_folder()
load_decks_folder()
SMODS.ObjectType({
    key = "ultra_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "ultra_ultra_jokers",
    cards = {
        ["j_ultra_allimperfectlovesong"] = true,
        ["j_ultra_blade"] = true,
        ["j_ultra_clashofthebrandicoot"] = true,
        ["j_ultra_coin"] = true,
        ["j_ultra_depressedgabriel"] = true,
        ["j_ultra_enragedgabriel"] = true,
        ["j_ultra_feedbacker"] = true,
        ["j_ultra_fleshpanopticon"] = true,
        ["j_ultra_fleshprison"] = true,
        ["j_ultra_gabriel"] = true,
        ["j_ultra_hellbathnofury"] = true,
        ["j_ultra_ionlysaymorning"] = true,
        ["j_ultra_jackhammer"] = true,
        ["j_ultra_knuckleblaster"] = true,
        ["j_ultra_marksman"] = true,
        ["j_ultra_minosprime"] = true,
        ["j_ultra_nailgun"] = true,
        ["j_ultra_pressurewasher"] = true,
        ["j_ultra_pumpcharge"] = true,
        ["j_ultra_railcannon"] = true,
        ["j_ultra_sawbladelauncher"] = true,
        ["j_ultra_sawedon"] = true,
        ["j_ultra_sharpshooter"] = true,
        ["j_ultra_shotgun"] = true,
        ["j_ultra_sisyphusprime"] = true,
        ["j_ultra_soap"] = true,
        ["j_ultra_somethingwicked"] = true,
        ["j_ultra_thewitless"] = true,
        ["j_ultra_v1"] = true,
        ["j_ultra_v2"] = true,
        ["j_ultra_vacuumcleaner"] = true,
        ["j_ultra_whiplash"] = true
    },
})

SMODS.ObjectType({
    key = "ultra_ultra_secrets",
    cards = {
        ["j_ultra_allimperfectlovesong"] = true,
        ["j_ultra_clashofthebrandicoot"] = true,
        ["j_ultra_hellbathnofury"] = true,
        ["j_ultra_ionlysaymorning"] = true,
        ["j_ultra_somethingwicked"] = true,
        ["j_ultra_thewitless"] = true
    },
})

SMODS.ObjectType({
    key = "ultra_ultra_weapons?",
    cards = {
        ["j_ultra_pressurewasher"] = true,
        ["j_ultra_vacuumcleaner"] = true
    },
})