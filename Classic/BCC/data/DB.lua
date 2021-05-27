----------------------------------------------------------------------------------------------------
------------------------------------------AddOn NAMESPACE-------------------------------------------
----------------------------------------------------------------------------------------------------

local FOLDER_NAME, private = ...
local L = private.locale

----------------------------------------------------------------------------------------------------
-----------------------------------------------LOCALS-----------------------------------------------
----------------------------------------------------------------------------------------------------

local function GetMapNames(id1, id2)
    if id1 and id2 then
        return format("%s, %s", C_Map.GetMapInfo(id1).name, C_Map.GetMapInfo(id2).name)
    end
    return C_Map.GetMapInfo(id1).name
end

----------------------------------------------------------------------------------------------------

local ElwynnForest = GetMapNames(1415, 1429)
local DrTtoIF = L["Deeprun Tram to Ironforge"]

local DunMorogh = GetMapNames(1415, 1426)
local DrTtoSW = L["Deeprun Tram to Stormwind"]

local Durotar = GetMapNames(1414, 1411)
local ZtoOG = L["Zeppelin to Orgrimmar"]

local Tirisfal = GetMapNames(1415, 1420)
local ZtoUC = L["Zeppelin to Undercity"]
local PtoUC = L["Portal to Undercity"]
local Orboftranslocation = L["Orb of translocation"]

local Barrens = GetMapNames(1414, 1413)
local BtoBootyBay = L["Boat to Booty Bay"]

local Wetlands = GetMapNames(1415, 1437)
local BtoMenethilHarbor = L["Boat to Menethil Harbor"]

local StranglethornVale = GetMapNames(1415, 1434)
local GromgolBaseCamp = GetMapNames(1415)..", "..C_Map.GetAreaInfo(117)
local ZtoStranglethornVale = L["Zeppelin to Stranglethorn Vale"]
local BtoRatchet = L["Boat to Ratchet"]

local DustwallowMarsh = GetMapNames(1414, 1445)
local BtoTheramore = L["Boat to Theramore"]

local Teldrassil = GetMapNames(1414, 1438)
local BtoDarnassus = L["Boat to Darnassus"]

local Darkshore = GetMapNames(1414, 1439)
local BtoAuberdine = L["Boat to Auberdine"]

local EversongWoods = GetMapNames(1415, 1941)
local PtoSM = L["Portal to Silvermoon"]

----------------------------------------------------------------------------------------------------
----------------------------------------------DATABASE----------------------------------------------
----------------------------------------------------------------------------------------------------

local DB = {}

private.DB = DB

DB.points = {
-- MAPID from https://wow.gamepedia.com/UiMapID/Classic
    --[[ structure:
    [UiMapID] = { -- "_terrain1" etc will be stripped from attempts to fetch this
        [coord] = {
            label=[string],         -- label: text that'll be the label, optional
            npc=[id],                 -- related npc id, used to display names in tooltip
            type=[string],             -- the pre-define icon type which can be found in Constant.lua
            class=[CLASS NAME],        -- specified the class name so that this node will only be available for this class
            faction="FACTION",      -- shows only for selected faction
            note=[string],            -- additional notes for this node
            level=[number]            -- map level from dropdown
        },
    },
--]]

--Vanilla-------------------------------------------------------------------------------------------------------------------------------------------------------
    [1429] = { -- Elwynn Forest
        [29201782] = { icon="tram", label=DrTtoIF, note=DunMorogh },
		[29001620] = { icon="dungeon", label="The Stockade", note="Dungeon) \n(Levels 22-30", faction="Alliance"},
		[30061688] = { icon="flightpath", label="Stormwind", note="Flight Path", faction="Alliance" },
        },
    [1453] = { -- Stormwind
        [63910817] = { icon="tram", label=DrTtoIF, note=DunMorogh },
		[42105860] = { icon="dungeon", label="The Stockade", note="Dungeon) \n(Levels 22-30", faction="Alliance"},			
		[66206640] = { icon="flightpath", label="Stormwind", note="Flight Path", faction="Alliance" },
        },
        [1411] = { -- Durotar
        [34017850] = { icon="boat", label=BtoBootyBay, note=StranglethornVale },
        [50571265] = { icon="zeppelin", label=ZtoStranglethornVale, note=GromgolBaseCamp, faction="Horde" },
        [50581265] = { icon="hzeppelin", label=ZtoStranglethornVale, note=GromgolBaseCamp, faction="Alliance"},
        [50821385] = { icon="zeppelin", label=ZtoUC, note=Tirisfal, faction="Horde" },
        [50831385] = { icon="hzeppelin", label=ZtoUC, note=Tirisfal, faction="Alliance" },
		[46201009] = { icon="dungeon", label="Ragefire Chasm", note="Dungeon) \n(Levels 13-18", faction="Horde"},
		[44701020] = { icon="flightpath", label="Orgrimmar", note="Flight Path", faction="Horde" },
        },
    [1420] = { -- Tirisfal Glades
        [60695877] = { icon="zeppelin", label=ZtoOG, note=Durotar, faction="Horde" },
        [60695878] = { icon="hzeppelin", label=ZtoOG, note=Durotar, faction="Alliance" },
        [61885907] = { icon="zeppelin", label=ZtoStranglethornVale, note=GromgolBaseCamp, faction="Horde" },
        [61885906] = { icon="hzeppelin", label=ZtoStranglethornVale, note=GromgolBaseCamp, faction="Alliance" },
        [59456744] = { icon="portal", label=PtoSM, note=EversongWoods..")\n("..Orboftranslocation.."", faction="Horde" },
		[81103660] = { icon="dungeon", label="Scarlet Monastary", note="Graveyard Dungeon Levels 28-38)\n(Library Dungeon Levels 29-39\n(Armory Dungeon Levels 32-42\n(Cathedral Dungeon Levels 35-45"},	
		[61407530] = { icon="flightpath", label="Undercity", note="Flight Path", faction="Horde" },
        },
    [1437] = { -- Wetlands
        [05026348] = { icon="boat", label=BtoTheramore, note=DustwallowMarsh, faction="Alliance" },
        [05026349] = { icon="aboat", label=BtoTheramore, note=DustwallowMarsh, faction="Horde" },
        [04635710] = { icon="boat", label=BtoAuberdine, note=Darkshore, faction="Alliance" },
        [04635711] = { icon="aboat", label=BtoAuberdine, note=Darkshore, faction="Horde" },
		[09605960] = { icon="flightpath", label="Menethil Harbor", note="Flight Path", faction="Alliance" },
        },
    [1414] = { -- Kalimdor
        [56785623] = { icon="boat", label=BtoBootyBay, note=StranglethornVale },
        [59276854] = { icon="boat", label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
        [59276855] = { icon="aboat", label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
        [43591733] = { icon="boat", label=BtoAuberdine, note=Darkshore, faction="Alliance" },
        [43591734] = { icon="aboat", label=BtoAuberdine, note=Darkshore, faction="Horde" },
        [44292533] = { icon="aboat", label1= BtoDarnassus.." ("..Teldrassil..")\n"..format(BtoMenethilHarbor.." ("..Wetlands..")"),
                                  label2= BtoDarnassus.."\n"..format(BtoMenethilHarbor..""), faction="Horde"},
        [44262534] = { icon="boat", label1= BtoDarnassus.." ("..Teldrassil..")\n"..format(BtoMenethilHarbor.." ("..Wetlands..")"),
                                    label2= BtoDarnassus.."\n"..format(BtoMenethilHarbor..""), faction="Alliance" },
        [58994665] = { icon="zeppelin", label1= ZtoUC.." ("..Tirisfal..")\n"..format(ZtoStranglethornVale.." ("..GromgolBaseCamp..")"),
                                  label2= ZtoUC.."\n"..format(ZtoStranglethornVale..""), faction="Horde"},
        [58994666] = { icon="hzeppelin", label1= ZtoUC.." ("..Tirisfal..")\n"..format(ZtoStranglethornVale.." ("..GromgolBaseCamp..")"),
                                    label2= ZtoUC.."\n"..format(ZtoStranglethornVale..""), faction="Alliance" },
		[58604740] = { icon="dungeon", label="Ragefire Chasm", note="Dungeon) \n(Levels 13-18", faction="Horde"},
		[51705630] = { icon="dungeon", label="Wailing Caverns", note="Dungeon) \n(Levels 15-25"},
		[45003700] = { icon="dungeon", label="Blackfathom Deeps", note="Dungeon) \n(Levels 24-32"},
		[50306900] = { icon="dungeon", label="Razorfen Kraul", note="Dungeon) \n(Levels 30-40"},
		[52707060] = { icon="dungeon", label="Razorfen Downs", note="Dungeon) \n(Levels 40-50"},
		[54507970] = { icon="dungeon", label="Zul'Farrak", note="Dungeon) \n(Levels 44-54"},
		[39105670] = { icon="dungeon", label="Maraudon", note="Wicked Grotto Dungeon Levels 45-53)\n(Foulspore Cavern Dungeon Levels 45-53)\n(Earth Song Falls Dungeon Levels 48-57"},
		[42506820] = { icon="dungeon", label="Dire Maul", note="Dungeon) \n(Levels 58-60"},
		[57704720] = { icon="flightpath", label="Orgrimmar", note="Flight Path", faction="Horde" },
		[46505790] = { icon="flightpath", label="Thunder Bluff", note="Flight Path", faction="Horde" },
		[52702180] = { icon="flightpath", label="Moonglade", note="Flight Path", faction="Horde" },
		[58502390] = { icon="flightpath", label="Everlook", note="Flight Path", faction="Horde" },
		[47203230] = { icon="flightpath", label="Bloodvenom Post", note="Flight Path", faction="Horde" },
		[53104350] = { icon="flightpath", label="Splintertree Post", note="Flight Path", faction="Horde" },
		[43503890] = { icon="flightpath", label="Zoram'gar", note="Flight Path", faction="Horde" },
		[58703710] = { icon="flightpath", label="Valormok", note="Flight Path", faction="Horde" },
		[43604810] = { icon="flightpath", label="Sun Rock Retreat", note="Flight Path", faction="Horde" },
		[53705330] = { icon="flightpath", label="Crossroads", note="Flight Path", faction="Horde" },
		[51606200] = { icon="flightpath", label="Camp Taurajo", note="Flight Path", faction="Horde" },
		[56205610] = { icon="flightpath", label="Ratchet", note="Flight Path" },
		[54306510] = { icon="flightpath", label="Brackenwall Village", note="Flight Path", faction="Horde" },
		[38105900] = { icon="flightpath", label="Shadowprey Village", note="Flight Path", faction="Horde" },
		[45206830] = { icon="flightpath", label="Camp Mojache", note="Flight Path", faction="Horde" },
		[53807460] = { icon="flightpath", label="Freewind Post", note="Flight Path", faction="Horde" },
		[44307900] = { icon="flightpath", label="Cenarion Hold", note="Flight Path", faction="Horde" },
		[56308060] = { icon="flightpath", label="Gadgetzan", note="Flight Path", faction="Horde" },
		[50107730] = { icon="flightpath", label="Marshal's Refuge", note="Flight Path" },
		[56007170] = { icon="raid", label="Onyxia's Lair", note="Raid) \n(Levels 50-60"},
		[42108550] = { icon="raid", label="Ahn'Qiraj", note="Ruins of Ahn'Qiraj Raid Levels 60)\n(Temple of Ahn'Qiraj Raid Levels 60"},
		[43501540] = { icon="flightpath", label="Rut'theran Village", note="Flight Path", faction="Alliance" },
		[53102220] = { icon="flightpath", label="Moonglade", note="Flight Path", faction="Alliance" },
		[59402350] = { icon="flightpath", label="Everlook", note="Flight Path", faction="Alliance" },
		[50902700] = { icon="flightpath", label="Talonbranch Glade", note="Flight Path", faction="Alliance" },
		[46202490] = { icon="flightpath", label="Auberdine", note="Flight Path", faction="Alliance" },
		[46504030] = { icon="flightpath", label="Astranaar", note="Flight Path", faction="Alliance" },
		[57404240] = { icon="flightpath", label="Talrendis Point", note="Flight Path", faction="Alliance" },
		[41504120] = { icon="flightpath", label="Stonetalon Peak", note="Flight Path", faction="Alliance" },
		[42805160] = { icon="flightpath", label="Nijel's Point", note="Flight Path", faction="Alliance" },
		[46707500] = { icon="flightpath", label="Thalanaar", note="Flight Path", faction="Alliance" },
		[44407950] = { icon="flightpath", label="Cenarion Hold", note="Flight Path", faction="Alliance" },
		[56408190] = { icon="flightpath", label="Gadgetzan", note="Flight Path", faction="Alliance" },
		[58206700] = { icon="flightpath", label="Theramore", note="Flight Path", faction="Alliance" },
		[36907140] = { icon="flightpath", label="Feathermoon Stronghold", note="Flight Path", faction="Alliance" },
		[58908440] = { icon="dungeon", label="Caverns of Time", note="Old Hillsbrad Foothills Dungeon Levels 66-68)\n(The Black Morass Dungeon Levels 70"},
		[57408440] = { icon="raid", label="Hyjal Summit", note="Raid)\n(Levels 70" }
        },
    [1413] = { -- The Barrens
        [63683862] = { icon="boat", label=BtoBootyBay, note=StranglethornVale },
		[51403020] = { icon="flightpath", label="Crossroads", note="Flight Path", faction="Horde" },
		[44405900] = { icon="flightpath", label="Camp Taurajo", note="Flight Path", faction="Horde" },
		[63003700] = { icon="flightpath", label="Ratchet", note="Flight Path" },
		[46003600] = { icon="dungeon", label="Wailing Caverns", note="Dungeon) \n(Levels 15-25"},
		[44208360] = { icon="dungeon", label="Razorfen Kraul", note="Dungeon) \n(Levels 30-40"},
		[49909200] = { icon="dungeon", label="Razorfen Downs", note="Dungeon) \n(Levels 40-50"},
        },
    [1415] = { -- Eastern Kingdom
        [43839266] = { icon="boat", label=BtoRatchet, note=Barrens },
        [43337195] = { icon="tram", label=DrTtoIF, note=DunMorogh },
        [47835898] = { icon="tram", label=DrTtoSW, note=ElwynnForest, },
        [43953355] = { icon="zeppelin", label1= ZtoOG.." ("..Durotar..")\n"..format(ZtoStranglethornVale.." ("..GromgolBaseCamp..")"),
                                  label2= ZtoOG.."\n"..format(ZtoStranglethornVale..""), faction="Horde"},
        [43953356] = { icon="hzeppelin", label1= ZtoOG.." ("..Durotar..")\n"..format(ZtoStranglethornVale.." ("..GromgolBaseCamp..")"),
                                    label2= ZtoOG.."\n"..format(ZtoStranglethornVale..""), faction="Alliance" },
        [44098694] = { icon="zeppelin", label1= ZtoOG.." ("..Durotar..")\n"..format(ZtoUC.." ("..Tirisfal..")"),
                                  label2= ZtoOG.."\n"..format(ZtoUC..""), faction="Horde"},
        [44098693] = { icon="hzeppelin", label1= ZtoOG.." ("..Durotar..")\n"..format(ZtoUC.." ("..Tirisfal..")"),
                                    label2= ZtoOG.."\n"..format(ZtoUC..""), faction="Alliance" },

        [45995488] = { icon="aboat", label1= BtoAuberdine.." ("..Darkshore..")\n"..format(BtoTheramore.." ("..DustwallowMarsh..")"),
                                  label2= BtoAuberdine.."\n"..format(BtoTheramore..""), faction="Horde"},
        [45995482] = { icon="boat", label1= BtoAuberdine.." ("..Darkshore..")\n"..format(BtoTheramore.." ("..DustwallowMarsh..")"),
                                    label2= BtoAuberdine.."\n"..format(BtoTheramore..""), faction="Alliance" },
        [56041304] = { icon="portal", label=PtoUC, note=Tirisfal..")\n("..Orboftranslocation.."", faction="Horde" },
        [43753451] = { icon="portal", label=PtoSM, note=EversongWoods..")\n("..Orboftranslocation.."", faction="Horde" },
		[40703930] = { icon="flightpath", label="The Sepulcher", note="Flight Path", faction="Horde" },
		[40604290] = { icon="dungeon", label="Shadowfang Keep", note="Dungeon) \n(Levels 23-30"},
		[46103090] = { icon="dungeon", label="Scarlet Monastary", note="Graveyard Dungeon Levels 28-38)\n(Library Dungeon Levels 29-39\n(Armory Dungeon Levels 32-42\n(Cathedral Dungeon Levels 35-45"},
		[40708280] = { icon="dungeon", label="The Deadmines", note="Dungeon) \n(Levels 18-23"},
		[44007200] = { icon="dungeon", label="The Stockade", note="Dungeon) \n(Levels 22-30", faction="Alliance"},
		[43105990] = { icon="dungeon", label="Gnomeregan", note="Dungeon) \n(Levels 29-38"},
		[52606430] = { icon="dungeon", label="Uldaman", note="Dungeon) \n(Levels 35-45"},
		[46706810] = { icon="dungeon", label="Blackrock Mountain", note="Blackrock Depths Dungeon Levels 52-60)\n(Lower Blackrock Spire Dungeon Levels 55-60)\n(Upper Blackrock Spire Dungeon Levels 58-60"},
		[51003700] = { icon="dungeon", label="Scholomance", note="Dungeon) \n(Levels 58-60"},
		[53202990] = { icon="dungeon", label="Stratholme", note="Dungeon) \n(Levels 58-60"},
		[53907950] = { icon="dungeon", label="Temple of Atal'Hakkar", note="Dungeon) \n(Levels 50-60"},
		[44003520] = { icon="flightpath", label="Undercity", note="Flight Path", faction="Horde" },
		[44108650] = { icon="flightpath", label="Grom'gol Base Camp", note="Flight Path", faction="Horde" },
		[43309540] = { icon="flightpath", label="Booty Bay", note="Flight Path", faction="Horde" },
		[46904100] = { icon="flightpath", label="Tarren Mill", note="Flight Path", faction="Horde" },
		[53104490] = { icon="flightpath", label="Hammerfall", note="Flight Path", faction="Horde" },
		[55304320] = { icon="flightpath", label="Revantusk Village", note="Flight Path", faction="Horde" },
		[47606530] = { icon="flightpath", label="Thorium Point", note="Flight Path", faction="Horde" },
		[50106570] = { icon="flightpath", label="Kargath", note="Flight Path", faction="Horde" },
		[49506910] = { icon="flightpath", label="Flame Crest", note="Flight Path", faction="Horde" },
		[52307940] = { icon="flightpath", label="Stonard", note="Flight Path", faction="Horde" },
		[57503340] = { icon="flightpath", label="Light's Hope Chapel", note="Flight Path", faction="Horde" },
		[48208520] = { icon="raid", label="Zul'Gurub", note="Raid) \n(Levels 60"},
		[51702970] = { icon="raid", label="Naxxramas", note="Raid) \n(Levels 60"},
		[48206790] = { icon="raid", label="Blackrock Mountain", note="Blackwing Lair Raid Levels 60)\n(Molten Core Raid Levels 60"},
		[43477330] = { icon="flightpath", label="Stormwind", note="Flight Path", faction="Alliance" },
		[45406000] = { icon="flightpath", label="Ironforge", note="Flight Path", faction="Alliance" },
		[57103340] = { icon="flightpath", label="Light's Hope Chapel", note="Flight Path", faction="Alliance" },
		[48603530] = { icon="flightpath", label="Chillwind Camp", note="Flight Path", faction="Alliance" },
		[49904000] = { icon="flightpath", label="Aerie Peak", note="Flight Path", faction="Alliance" },
		[45504390] = { icon="flightpath", label="Southshore", note="Flight Path", faction="Alliance" },
		[51604670] = { icon="flightpath", label="Refuge Point", note="Flight Path", faction="Alliance" },
		[47005450] = { icon="flightpath", label="Menethil Harbor", note="Flight Path", faction="Alliance" },
		[51406100] = { icon="flightpath", label="Thelsamar", note="Flight Path", faction="Alliance" },
		[47506550] = { icon="flightpath", label="Thorium Point", note="Flight Path", faction="Alliance" },
		[53107400] = { icon="flightpath", label="Lakeshire", note="Flight Path", faction="Alliance" },
		[47407990] = { icon="flightpath", label="Darkshire", note="Flight Path", faction="Alliance" },
		[41807880] = { icon="flightpath", label="Sentinel Hill", note="Flight Path", faction="Alliance" },
		[44509270] = { icon="flightpath", label="Booty Bay", note="Flight Path", faction="Alliance" },
		[53108310] = { icon="flightpath", label="Nethergarde Keep", note="Flight Path", faction="Alliance" },
		[51107190] = { icon="flightpath", label="Morgan's Vigil", note="Flight Path", faction="Alliance" },
		[56400400] = { icon="dungeon", label="Magister's Terrace", note="Dungeon)\n(Levels 70" },
		[55000520] = { icon="raid", label="Sunwell Plateau", note="Raid)\n(Levels 70" },
		[49708190] = { icon="raid", label="Karazhan", note="Raid)\n(Levels 70" },
		[57502520] = { icon="raid", label="Zul'Aman", note="Raid)\n(Levels 70" },
        },
    [1434] = { -- Stranglethorn Vale
        [25867311] = { icon="boat", label=BtoRatchet, note=Barrens },
        [31363015] = { icon="zeppelin", label=ZtoOG, note=Durotar, faction="Horde" },
        [31363016] = { icon="hzeppelin", label=ZtoOG, note=Durotar, faction="Alliance" },
        [31582911] = { icon="zeppelin", label=ZtoUC, note=Tirisfal, faction="Horde" },
        [31582912] = { icon="hzeppelin", label=ZtoUC, note=Tirisfal, faction="Alliance" },
		[32602920] = { icon="flightpath", label="Grom'gol Base Camp", note="Flight Path", faction="Horde" },
		[26807700] = { icon="flightpath", label="Booty Bay", note="Flight Path", faction="Horde" },
		[52301910] = { icon="raid", label="Zul'Gurub", note="Raid) \n(Levels 60"},
		[27607760] = { icon="flightpath", label="Booty Bay", note="Flight Path", faction="Alliance" },
        },
    [1426] = { -- Dun Morogh
        [63432936] = { icon="tram", label=DrTtoSW, note=ElwynnForest, },
		[29003670] = { icon="dungeon", label="Gnomeregan", note="Dungeon) \n(Levels 29-38"},
		[54703500] = { icon="flightpath", label="Ironforge", note="Flight Path", faction="Alliance" },
        },
    [1455] = { -- Ironforge
        [76985153] = { icon="tram", label=DrTtoSW, note=ElwynnForest, },
		[55804740] = { icon="flightpath", label="Ironforge", note="Flight Path", faction="Alliance" },
        },
    [1445] = { -- Dustwallow Marsh
        [71625648] = { icon="boat", label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
        [71625649] = { icon="aboat", label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
		[35603180] = { icon="flightpath", label="Brackenwall Village", note="Flight Path", faction="Horde" },
		[52807650] = { icon="raid", label="Onyxia's Lair", note="Raid) \n(Levels 50-60"},
		[67405120] = { icon="flightpath", label="Theramore", note="Flight Path", faction="Alliance" },
        },
    [1438] = { -- Teldrassil
        [54859680] = { icon="boat", label=BtoAuberdine, note=Darkshore, faction="Alliance" },
        [54859681] = { icon="aboat", label=BtoAuberdine, note=Darkshore, faction="Horde" },
		[54809400] = { icon="flightpath", label="Rut'theran Village", note="Flight Path", faction="Alliance" },
        },
    [1439] = { -- Darkshore
        [33194006] = { icon="boat", label=BtoDarnassus, note=Teldrassil, faction="Alliance" },
        [33194007] = { icon="aboat", label=BtoDarnassus, note=Teldrassil, faction="Horde" },
        [32404584] = { icon="boat", label=BtoMenethilHarbor, note=Wetlands, faction="Alliance" },
        [32404585] = { icon="aboat", label=BtoMenethilHarbor, note=Wetlands, faction="Horde" },
		[36404560] = { icon="flightpath", label="Auberdine", note="Flight Path", faction="Alliance" },
        },
--------------------------------------------------BCC--------------------------------------------------
    [1941] = { -- Eversong Forest
        [50993068] = { icon="portal", label=PtoUC, note=Tirisfal..")\n("..Orboftranslocation.."", faction="Horde" },
        },
    [1954] = { -- Silvermoon
        [49391483] = { icon="portal", label=PtoUC, note=Tirisfal..")\n("..Orboftranslocation.."", faction="Horde" },
        },
    [1458] = { -- Undercity
        [54851125] = { icon="portal", label=PtoSM, note=EversongWoods..")\n("..Orboftranslocation.."", faction="Horde" },
        },
	[1421] = { -- "Silverpine Forest"				
		[45504240] = { icon="flightpath", label="The Sepulcher", note="Flight Path", faction="Horde", cont=true},
		[44906880] = { icon="dungeon", label="Shadowfang Keep", note="Dungeon) \n(Levels 23-30"},
		},
	[1450] = { -- "Moonglade"				
		[32206660] = { icon="flightpath", label="Moonglade", note="Flight Path", faction="Horde" },
		[48006720] = { icon="flightpath", label="Moonglade", note="Flight Path", faction="Alliance" },	
		},
	[1452] = { -- "Winterspring"				
		[60403640] = { icon="flightpath", label="Everlook", note="Flight Path", faction="Horde" },
		[62203660] = { icon="flightpath", label="Everlook", note="Flight Path", faction="Alliance" },
		},
	[1448] = { -- "Felwood"				
		[34405380] = { icon="flightpath", label="Bloodvenom Post", note="Flight Path", faction="Horde" },
		[62402420] = { icon="flightpath", label="Talonbranch Glade", note="Flight Path", faction="Alliance" },
		},
	[1447] = { -- "Azshara"				
		[22004960] = { icon="flightpath", label="Valormok", note="Flight Path", faction="Horde" },
		[11807740] = { icon="flightpath", label="Talrendis Point", note="Flight Path", faction="Alliance" },
		},
	[1440] = { -- "Ashenvale"				
		[73206160] = { icon="flightpath", label="Splintertree Post", note="Flight Path", faction="Horde" },
		[12203380] = { icon="flightpath", label="Zoram'gar", note="Flight Path", faction="Horde" },
		[13601370] = { icon="dungeon", label="Blackfathom Deeps", note="Dungeon) \n(Levels 24-32"},
		[34404800] = { icon="flightpath", label="Astranaar", note="Flight Path", faction="Alliance" },
		},
	[1442] = { -- "Stonetalon Mountains"				
		[45205980] = { icon="flightpath", label="Sun Rock Retreat", note="Flight Path", faction="Horde" },
		[36200490] = { icon="flightpath", label="Stonetalon Peak", note="Flight Path", faction="Alliance" },
		},
	[1456] = { -- "Thunder Bluff"				
		[47005000] = { icon="flightpath", label="Thunder Bluff", note="Flight Path", faction="Horde" },
		},
	[1443] = { -- "Desolace"				
		[21607400] = { icon="flightpath", label="Shadowprey Village", note="Flight Path", faction="Horde" },
		[29605860] = { icon="dungeon", label="Maraudon", note="Wicked Grotto Dungeon Levels 45-53)\n(Foulspore Cavern Dungeon Levels 45-53)\n(Earth Song Falls Dungeon Levels 48-57"},
		[64601040] = { icon="flightpath", label="Nijel's Point", note="Flight Path", faction="Alliance" },
		},
	[1444] = { -- "Feralas"				
		[75404420] = { icon="flightpath", label="Camp Mojache", note="Flight Path", faction="Horde" },
		[58404310] = { icon="dungeon", label="Dire Maul", note="Dungeon) \n(Levels 58-60"},
		[89404580] = { icon="flightpath", label="Thalanaar", note="Flight Path", faction="Alliance" },
		[30204320] = { icon="flightpath", label="Feathermoon Stronghold", note="Flight Path", faction="Alliance" },
		},
	[1441] = { -- "Thousand Needles"				
		[45004920] = { icon="flightpath", label="Freewind Post", note="Flight Path", faction="Horde" },
		},
	[1451] = { -- "Silithus"				
		[48803660] = { icon="flightpath", label="Cenarion Hold", note="Flight Path", faction="Horde" },
		[28109420] = { icon="raid", label="Ahn'Qiraj", note="Ruins of Ahn'Qiraj Raid Levels 60)\n(Temple of Ahn'Qiraj Raid Levels 60"},
		[50603440] = { icon="flightpath", label="Cenarion Hold", note="Flight Path", faction="Alliance" },
		},
	[1449] = { -- "Un'goro Crater"				
		[45200580] = { icon="flightpath", label="Marshal's Refuge", note="Flight Path" },
		},
	[1446] = { -- "Tanaris"				
		[51602560] = { icon="flightpath", label="Gadgetzan", note="Flight Path", faction="Horde" },
		[39602060] = { icon="dungeon", label="Zul'Farrak", note="Dungeon) \n(Levels 44-54"},
		[51002920] = { icon="flightpath", label="Gadgetzan", note="Flight Path", faction="Alliance" },
		[64204790] = { icon="dungeon", label="Caverns of Time", note="Old Hillsbrad Foothills Dungeon Levels 66-68)\n(The Black Morass Dungeon Levels 70"},
		[62304760] = { icon="raid", label="Hyjal Summit", note="Raid)\n(Levels 70" },
		},
	[1424] = { -- "Hillsbrad"				
		[60201860] = { icon="flightpath", label="Tarren Mill", note="Flight Path", faction="Horde" },
		[49405240] = { icon="flightpath", label="Southshore", note="Flight Path", faction="Alliance" },
		},
	[1423] = { -- "Eastern Plaguelands"				
		[80205700] = { icon="flightpath", label="Light's Hope Chapel", note="Flight Path", faction="Horde" },
		[30701700] = { icon="dungeon", label="Stratholme", note="Dungeon) \n(Levels 58-60"},
		[28901670] = { icon="raid", label="Naxxramas", note="Raid) \n(Levels 60"},
		[81605920] = { icon="flightpath", label="Light's Hope Chapel", note="Flight Path", faction="Alliance" },
		},
	[1422] = { -- "Western Plaguelands"				
		[69707670] = { icon="dungeon", label="Scholomance", note="Dungeon) \n(Levels 58-60"},
		[43008500] = { icon="flightpath", label="Chillwind Camp", note="Flight Path", faction="Alliance" },
		},
	[1425] = { -- "Hinterlands"				
		[81608180] = { icon="flightpath", label="Revantusk Village", note="Flight Path", faction="Horde" },
		[11004600] = { icon="flightpath", label="Aerie Peak", note="Flight Path", faction="Alliance" },
		},
	[1417] = { -- "Arathi"				
		[73003260] = { icon="flightpath", label="Hammerfall", note="Flight Path", faction="Horde" },
		[45804620] = { icon="flightpath", label="Refuge Point", note="Flight Path", faction="Alliance" },
		},
	[1418] = { -- "Badlands"				
		[04004480] = { icon="flightpath", label="Kargath", note="Flight Path", faction="Horde" },
		[44501050] = { icon="dungeon", label="Uldaman", note="Dungeon) \n(Levels 35-45"},
		},
	[1427] = { -- "Searing Gorge"				
		[34803080] = { icon="flightpath", label="Thorium Point", note="Flight Path", faction="Horde" },
		[30208830] = { icon="dungeon", label="Blackrock Mountain", note="Blackrock Depths Dungeon Levels 52-60)\n(Lower Blackrock Spire Dungeon Levels 55-60)\n(Upper Blackrock Spire Dungeon Levels 58-60"},
		[31508790] = { icon="raid", label="Blackrock Mountain", note="Blackwing Lair Raid Levels 60)\n(Molten Core Raid Levels 60"},
		[37803060] = { icon="flightpath", label="Thorium Point", note="Flight Path", faction="Alliance" },
		},
	[1428] = { -- "Burning Steppes"				
		[65602420] = { icon="flightpath", label="Flame Crest", note="Flight Path", faction="Horde" },
		[84406820] = { icon="flightpath", label="Morgan's Vigil", note="Flight Path", faction="Alliance" },
		},
	[1435] = { -- "Swamp of Sorrows"				
		[46005460] = { icon="flightpath", label="Stonard", note="Flight Path", faction="Horde" },
		[69204510] = { icon="dungeon", label="Temple of Atal'Hakkar", note="Dungeon) \n(Levels 50-60"},
		},
	[1458] = { -- "Undercity"
		[63604860] = { icon="flightpath", label="Undercity", note="Flight Path", faction="Horde" },
		},
	[1454] = { -- "Orgrimmar"				
		[45206380] = { icon="flightpath", label="Orgrimmar", note="Flight Path", faction="Horde" },
		[51105210] = { icon="dungeon", label="Ragefire Chasm", note="Dungeon) \n(Levels 13-18", faction="Horde"},
		},
	[1436] = { -- "Westfall"				
		[41808010] = { icon="dungeon", label="The Deadmines", note="Dungeon) \n(Levels 18-23"},
		[56605260] = { icon="flightpath", label="Sentinel Hill", note="Flight Path", faction="Alliance" },
		},
	[1412] = { -- "Mulgore"				
		[44703590] = { icon="flightpath", label="Thunder Bluff", note="Flight Path", faction="Horde" },
		},
	[1419] = { -- "Blasted Lands"				
		[65602440] = { icon="flightpath", label="Nethergarde Keep", note="Flight Path", faction="Alliance" },
		},
	[1431] = { -- "Duskwood"				
		[76604440] = { icon="flightpath", label="Darkshire", note="Flight Path", faction="Alliance" },
		},
	[1433] = { -- "Redridge"				
		[76604440] = { icon="flightpath", label="Lakeshire", note="Flight Path", faction="Alliance" },
		},
	[1432] = { -- "Loch Modan"				
		[33805080] = { icon="flightpath", label="Thelsamar", note="Flight Path", faction="Alliance" },
		},
	[1430] = { -- "Deadwind Pass"				
		[47607420] = { icon="raid", label="Karazhan", note="Raid)\n(Levels 70" },
		},
	[1942] = { -- "Ghostlands"			--Eversong and Silvermoon City should be 1941 and 1954	
		[75306400] = { icon="raid", label="Zul'Aman", note="Raid)\n(Levels 70" },
		},
	[1957] = { -- "Isle of Quel'Danas"				
		[60203160] = { icon="dungeon", label="Magister's Terrace", note="Dungeon)\n(Levels 70" },
		[44704130] = { icon="raid", label="Sunwell Plateau", note="Raid)\n(Levels 70" },
		},
	[1945] = { -- Outland
        [53005300] = { icon="dungeon", label="Hellfire Citadel", note="Hellfire Ramparts Dungeon Levels 60-62) \n(The Blood Furnace Dungeon Levels 61-63)\n(The Shattered Halls Dungeon Levels 69-70" },
		[34704300] = { icon="dungeon", label="Coilfang Reservoir", note="The Slave Pens Dungeon Levels 62-64) \n(The Underbog Dungeon Levels 63-65)\n(The Steamvault Dungeon Levels 68-70" },
		[46007500] = { icon="dungeon", label="Auchindoun", note="Mana-Tombs Dungeon Levels 64-66) \n(Auchenai Crypts Dungeon Levels 65-67)\n(Sethekk Halls Dungeon Levels 67-69)\n(Shadow Labyrinth Dungeon Levels 69-70"},
		[65502330] = { icon="dungeon", label="Tempest Keep", note="The Botanica Dungeon Levels 70) \n(The Mechanar Dungeon Levels 70)\n(The Arcatraz Dungeon Levels 70" },
		[44002240] = { icon="raid", label="Gruul's Lair", note="Raid)\n(Levels 70" },
		[51305280] = { icon="raid", label="Magtheridon's Lair", note="Raid)\n(Levels 70" },
		[58901250] = { icon="raid", label="Serpentshrine Cavern", note="Raid)\n(Levels 70" },
		[66702310] = { icon="raid", label="The Eye (Tempest Keep)", note="Raid)\n(Levels 70" },
		[69408090] = { icon="raid", label="Black Temple", note="Raid)\n(Levels 70" },
		},
	[1944] = { -- Hellfire Peninsula 
        [46005450] = { icon="dungeon", label="Hellfire Citadel", note="Hellfire Ramparts Dungeon Levels 60-62) \n(The Blood Furnace Dungeon Levels 61-63)\n(The Shattered Halls Dungeon Levels 69-70" },
		[44305440] = { icon="raid", label="Magtheridon's Lair", note="Raid)\n(Levels 70" },
        },
	[1946] = { -- Zangarmash
        [52803300] = { icon="dungeon", label="Coilfang Reservoir", note="The Slave Pens Dungeon Levels 62-64) \n(The Underbog Dungeon Levels 63-65)\n(The Steamvault Dungeon Levels 68-70" },
        },
	[1952] = { --Terokkar Foreset
        [39505330] = { icon="dungeon", label="Auchindoun", note="Mana-Tombs Dungeon Levels 64-66) \n(Auchenai Crypts Dungeon Levels 65-67)\n(Sethekk Halls Dungeon Levels 67-69)\n(Shadow Labyrinth Dungeon Levels 69-70" },
        },
	[1953] = { --Netherstorm
        [68806520] = { icon="dungeon", label="Tempest Keep", note="The Botanica Dungeon Levels 70) \n(The Mechanar Dungeon Levels 70)\n(The Arcatraz Dungeon Levels 70" },
		[50503520] = { icon="raid", label="Serpentshrine Cavern", note="Raid)\n(Levels 70" },
		[70006500] = { icon="raid", label="The Eye (Tempest Keep)", note="Raid)\n(Levels 70" },
        },
	[1948] = { --Shadowmoon Valley
        [70404510] = { icon="raid", label="Black Temple", note="Raid)\n(Levels 70" },
        },
	[1949] = { --Blade's Edge Mountains, 51=Nagrand, 55=Shattrath City
        [67002990] = { icon="raid", label="Gruul's Lair", note="Raid)\n(Levels 70" },
        },
}