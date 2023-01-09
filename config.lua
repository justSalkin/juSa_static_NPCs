-- LAST EDIT by just_Salkin 09.01.2023 | WHITE-SANDS-RP german RP server
Config = {}

-------------
--Set the blip value to 0 if you don't want a blip for this NPC
-------------

Config.NPCs = {
    --Valentine
    { npc_name = "Valentine Saloon", npcmodel = "U_F_M_TljBartender_01", blip = 0, coords = vector3(-313.25, 805.35, 118), heading = -80.23},
    { npc_name = "Valentine Generalstore", npcmodel = "U_M_M_ARMGENERALSTOREOWNER_01", blip = -392465725, coords = vector3(-324.61, 804.02, 116.85), heading = -80.67},

    --Annesburg

    --Van Horn
	
    --Rhodes
    { npc_name = "Rhodes Generalstore", npcmodel = "U_M_M_WaLGENERALSTOREOWNER_01", blip = -392465725, coords = vector3(1330.28, -1293.57, 76), heading = 63.86},
    { npc_name = "BJ_Dealer_R_Saloon", npcmodel = "U_M_M_NBXRIVERBOATPITBOSS_01", blip = 0, coords = vector3(1338.82, -1372.06, 83.29), heading = -99.46},
    
    --Blackwater
    { npc_name = "Blackwater Generalstore", npcmodel = "U_M_M_ARMGENERALSTOREOWNER_01", blip = -392465725, coords = vector3(-785.33, -1322.24, 42.85), heading = -178.19},
    { npc_name = "BJ_Dealer_BW_Saloon", npcmodel = "S_M_M_NBXRIVERBOATDEALERS_01", blip = 0, coords = vector3(-813.22, -1322.71, 47.33), heading = 179.42},

    --Saint Denis

    --others
    { npc_name = "Mining Company", npcmodel = "A_M_Y_AsbMiner_02", blip = 0, coords = vector3(724.10, -467.48, 78.90), heading = 60},  
}

Config.PEDs = {
    --Valentine
    { ped_name = "Cow_1", pedmodel = "A_C_Cow", coords = vector3(-382.55, 899.54, 115.06), heading = 165.10},
    { ped_name = "Cow_2", pedmodel = "A_C_Cow", coords = vector3(-370.16, 904.43, 115.67), heading = -27},
}
