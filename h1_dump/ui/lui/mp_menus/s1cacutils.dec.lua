local f0_local0 = {
	FactionsCSV = {
		File = "mp/uiFactionsTable.csv",
		Cols = {
			Index = 0,
			Team = 1,
			Environment = 2,
			Name = 3,
			Asset = 4,
			AssetBackground = 5
		}
	},
	MenuCache = {
		CacheResults = false,
		IsCustomClassRestrictedCache = {},
		InventoryUtils_GetLootData = {}
	},
	GameModes = {
		Group = {
			Standard = "Standard"
		},
		Data = {
			Standard = {
				Label = Engine.Localize( "@MPUI_STANDARD_CAPS" ),
				Image = "h1_ui_icon_playlist_standard",
				List = {
					"dm",
					"war",
					"sd",
					"dom",
					"conf",
					"sab",
					"koth",
					"hp",
					"gun"
				}
			}
		}
	},
	Settings = {
		DataLoc = {
			customClasses = {
				baseClassSlots = 25,
				maxClassSlots = 60
			},
			privateMatchCustomClasses = {
				baseClassSlots = 5,
				maxClassSlots = 60
			},
			defaultClassesTeam0 = {
				maxClassSlots = 6,
				teamName = "allies",
				hasGameModeSlot = true
			},
			defaultClassesTeam1 = {
				maxClassSlots = 6,
				teamName = "axis",
				hasGameModeSlot = true,
				string = Engine.Localize( "@LUA_MENU_AXIS_CAPS" )
			},
			defaultClassesTeam2 = {
				maxClassSlots = 6,
				teamName = "allies",
				hasGameModeSlot = true,
				string = Engine.Localize( "@LUA_MENU_ALLIES_CAPS" )
			},
			defaultClassesTeam3 = {
				teamName = "spectator"
			}
		},
		minUsableSlots = 4,
		GameModeClassIdx = 5
	},
	PreorderWeaponSuffices = {
		"atlas",
		"gold",
		"ghosts",
		"blops2"
	}
}
local f0_local1 = {
	Primary = {
		{
			"weapon_assault",
			{
				{
					"h1_m16",
					0
				},
				{
					"h1_ak47",
					0
				},
				{
					"h1_m4",
					0
				},
				{
					"h1_g3",
					0
				},
				{
					"h1_g36c",
					0
				},
				{
					"h1_m14",
					0
				},
				{
					"h1_mp44",
					0
				},
				{
					"h1_xmlar",
					0
				},
				{
					"h1_aprast",
					0
				},
				{
					"h1_augast",
					0
				}
			},
			"@MENU_ASSAULT_RIFLES_CAPS",
			CoD.Material.LockedIcon,
			"@LUA_MENU_WEAPTYPE_SINGLE_AR"
		},
		{
			"weapon_smg",
			{
				{
					"h1_mp5",
					0
				},
				{
					"h1_skorpion",
					0
				},
				{
					"h1_uzi",
					0
				},
				{
					"h1_ak74u",
					0
				},
				{
					"h1_p90",
					0
				},
				{
					"h1_febsmg",
					0
				},
				{
					"h1_aprsmg",
					0
				},
				{
					"h1_augsmg",
					0
				}
			},
			"@MENU_SMGS_CAPS",
			CoD.Material.LockedIcon,
			"@MPUI_SUB_MACHINE_GUN"
		},
		{
			"weapon_sniper",
			{
				{
					"h1_m40a3",
					0
				},
				{
					"h1_m21",
					0
				},
				{
					"h1_dragunov",
					0
				},
				{
					"h1_remington700",
					0
				},
				{
					"h1_barrett",
					0
				},
				{
					"h1_febsnp",
					0
				},
				{
					"h1_junsnp",
					0
				}
			},
			"@MENU_SNIPER_RIFLES_CAPS",
			CoD.Material.LockedIcon,
			"@LUA_MENU_WEAPTYPE_SINGLE_SNIPER"
		},
		{
			"weapon_shotgun",
			{
				{
					"h1_winchester1200",
					0
				},
				{
					"h1_m1014",
					0
				},
				{
					"h1_kam12",
					0
				},
				{
					"h1_junsho",
					0
				}
			},
			"@MENU_SHOTGUNS_CAPS",
			CoD.Material.LockedIcon,
			"@LUA_MENU_WEAPTYPE_SINGLE_SHOTGUN"
		},
		{
			"weapon_heavy",
			{
				{
					"h1_saw",
					0
				},
				{
					"h1_rpd",
					0
				},
				{
					"h1_m60e4",
					0
				},
				{
					"h1_feblmg",
					0
				},
				{
					"h1_junlmg",
					0
				}
			},
			"@MENU_LMGS_CAPS",
			CoD.Material.LockedIcon,
			"@LUA_MENU_WEAPTYPE_SINGLE_LMG"
		}
	},
	Primary_AttachKit = {
		{
			"attachkit",
			{},
			"",
			CoD.Material.LockedIcon
		}
	},
	Primary_FurnitureKit = {
		{
			"furniturekit",
			{},
			"",
			CoD.Material.LockedIcon
		}
	}
}
local f0_local2 = {}
local f0_local3 = {}
local f0_local4 = "reticle"
local f0_local5 = {
	{
		"none",
		0
	},
	{
		"ret007",
		0
	},
	{
		"ret008",
		0
	},
	{
		"ret009",
		0
	},
	{
		"ret010",
		0
	},
	{
		"ret011",
		0
	},
	{
		"ret012",
		0
	},
	{
		"ret013",
		0
	},
	{
		"ret014",
		0
	},
	{
		"ret016",
		0
	},
	{
		"ret017",
		0
	},
	{
		"ret018",
		0
	},
	{
		"ret019",
		0
	},
	{
		"ret021",
		0
	},
	{
		"ret024",
		0
	},
	{
		"ret025",
		0
	},
	{
		"ret026",
		0
	},
	{
		"ret027",
		0
	},
	{
		"ret028",
		0
	},
	{
		"ret030",
		0
	},
	{
		"ret031",
		0
	},
	{
		"ret032",
		0
	},
	{
		"ret033",
		0
	},
	{
		"ret034",
		0
	},
	{
		"ret035",
		0
	},
	{
		"ret036",
		0
	},
	{
		"ret037",
		0
	},
	{
		"ret038",
		0
	},
	{
		"ret041",
		0
	},
	{
		"ret042",
		0
	},
	{
		"ret043",
		0
	},
	{
		"ret044",
		0
	},
	{
		"ret045",
		0
	},
	{
		"ret046",
		0
	},
	{
		"ret047",
		0
	},
	{
		"ret048",
		0
	},
	{
		"ret049",
		0
	},
	{
		"ret050",
		0
	},
	{
		"ret051",
		0
	},
	{
		"ret052",
		0
	},
	{
		"ret053",
		0
	},
	{
		"ret054",
		0
	},
	{
		"ret055",
		0
	},
	{
		"ret056",
		0
	},
	{
		"ret057",
		0
	},
	{
		"ret058",
		0
	},
	{
		"ret059",
		0
	},
	{
		"ret060",
		0
	},
	{
		"ret061",
		0
	},
	{
		"ret062",
		0
	}
}
local f0_local6 = {
	"ret063",
	0
}
local f0_local7 = {
	"ret064",
	0
}
local f0_local8 = {
	"ret065",
	0
}
local f0_local9 = {
	"ret066",
	0
}
local f0_local10 = {
	"ret067",
	0
}
local f0_local11 = {
	"ret068",
	0
}
local f0_local12 = {
	"ret069",
	0
}
local f0_local13 = {
	"ret070",
	0
}
local f0_local14 = {
	"ret071",
	0
}
local f0_local15 = {
	"ret072",
	0
}
local f0_local16 = {
	"ret073",
	0
}
local f0_local17 = {
	"ret074",
	0
}
local f0_local18 = {
	"ret075",
	0
}
local f0_local19 = {
	"ret076",
	0
}
local f0_local20 = {
	"ret077",
	0
}
local f0_local21 = {
	"ret078",
	0
}
local f0_local22 = {
	"ret080",
	0
}
local f0_local23 = {
	"ret081",
	0
}
local f0_local24 = {
	"ret085",
	0
}
local f0_local25 = {
	"ret086",
	0
}
local f0_local26 = {
	"ret089",
	0
}
local f0_local27 = {
	"ret091",
	0
}
local f0_local28 = {
	"ret094",
	0
}
local f0_local29 = {
	"ret095",
	0
}
local f0_local30 = {
	"ret096",
	0
}
local f0_local31 = {
	"ret097",
	0
}
local f0_local32 = {
	"ret100",
	0
}
local f0_local33 = {
	"ret101",
	0
}
local f0_local34 = {
	"ret102",
	0
}
local f0_local35 = {
	"ret103",
	0
}
local f0_local36 = {
	"ret104",
	0
}
local f0_local37 = {
	"ret105",
	0
}
local f0_local38 = {
	"ret106",
	0
}
local f0_local39 = {
	"ret107",
	0
}
local f0_local40 = {
	"ret108",
	0
}
local f0_local41 = {
	"ret114",
	0
}
local f0_local42 = {
	"ret115",
	0
}
local f0_local43 = {
	"ret116",
	0
}
local f0_local44 = {
	"ret117",
	0
}
local f0_local45 = {
	"ret118",
	0
}
local f0_local46 = {
	"ret120",
	0
}
local f0_local47 = {
	"ret121",
	0
}
local f0_local48 = {
	"ret_angle_01",
	0
}
local f0_local49 = {
	"ret_angle_02",
	0
}
local f0_local50 = {
	"ret_angle_03",
	0
}
local f0_local51 = {
	"ret_angle_04",
	0
}
local f0_local52 = {
	"ret_angle_05",
	0
}
local f0_local53 = {
	"ret_angle_06",
	0
}
local f0_local54 = {
	"ret_angle_07",
	0
}
local f0_local55 = {
	"ret_angle_reward",
	0
}
f0_local5[33] = f0_local6
f0_local5[34] = f0_local7
f0_local5[35] = f0_local8
f0_local5[36] = f0_local9
f0_local5[37] = f0_local10
f0_local5[38] = f0_local11
f0_local5[39] = f0_local12
f0_local5[40] = f0_local13
f0_local5[41] = f0_local14
f0_local5[42] = f0_local15
f0_local5[43] = f0_local16
f0_local5[44] = f0_local17
f0_local5[45] = f0_local18
f0_local5[46] = f0_local19
f0_local5[47] = f0_local20
f0_local5[48] = f0_local21
f0_local5[49] = f0_local22
f0_local5[50] = f0_local23
f0_local5[51] = f0_local24
f0_local5[52] = f0_local25
f0_local5[53] = f0_local26
f0_local5[54] = f0_local27
f0_local5[55] = f0_local28
f0_local5[56] = f0_local29
f0_local5[57] = f0_local30
f0_local5[58] = f0_local31
f0_local5[59] = f0_local32
f0_local5[60] = f0_local33
f0_local5[61] = f0_local34
f0_local5[62] = f0_local35
f0_local5[63] = f0_local36
f0_local5[64] = f0_local37
f0_local5[65] = f0_local38
f0_local5[66] = f0_local39
f0_local5[67] = f0_local40
f0_local5[68] = f0_local41
f0_local5[69] = f0_local42
f0_local5[70] = f0_local43
f0_local5[71] = f0_local44
f0_local5[72] = f0_local45
f0_local5[73] = f0_local46
f0_local5[74] = f0_local47
f0_local5[75] = f0_local48
f0_local5[76] = f0_local49
f0_local5[77] = f0_local50
f0_local5[78] = f0_local51
f0_local5[79] = f0_local52
f0_local5[80] = f0_local53
f0_local5[81] = f0_local54
f0_local5[82] = f0_local55
f0_local6 = {
	"ret_avalanche_01",
	0
}
f0_local7 = {
	"ret_bent_01",
	0
}
f0_local8 = {
	"ret_bent_02",
	0
}
f0_local9 = {
	"ret_bent_03",
	0
}
f0_local10 = {
	"ret_bent_04",
	0
}
f0_local11 = {
	"ret_bent_05",
	0
}
f0_local12 = {
	"ret_bent_06",
	0
}
f0_local13 = {
	"ret_bent_07",
	0
}
f0_local14 = {
	"ret_bent_reward",
	0
}
f0_local15 = {
	"ret_chalk_01",
	0
}
f0_local16 = {
	"ret_challenger_01",
	0
}
f0_local17 = {
	"ret_dmr25s_01",
	0
}
f0_local18 = {
	"ret_frag_01",
	0
}
f0_local19 = {
	"ret_graves_01",
	0
}
f0_local20 = {
	"ret_ironsmith_01",
	0
}
f0_local21 = {
	"ret_ironsmith_02",
	0
}
f0_local22 = {
	"ret_ironsmith_03",
	0
}
f0_local23 = {
	"ret_ironsmith_04",
	0
}
f0_local24 = {
	"ret_ironsmith_05",
	0
}
f0_local25 = {
	"ret_ironsmith_06",
	0
}
f0_local26 = {
	"ret_ironsmith_07",
	0
}
f0_local27 = {
	"ret_ironsmith_reward",
	0
}
f0_local28 = {
	"ret_killshot_01",
	0
}
f0_local29 = {
	"ret_kingpin_01",
	0
}
f0_local30 = {
	"ret_mac10_01",
	0
}
f0_local31 = {
	"ret_mastercraft_01",
	0
}
f0_local32 = {
	"ret_mechanic_01",
	0
}
f0_local33 = {
	"ret_noobtuber_01",
	0
}
f0_local34 = {
	"ret_pigpen_01",
	0
}
f0_local35 = {
	"ret_pkm_01",
	0
}
f0_local36 = {
	"ret_reflex_01",
	0
}
f0_local37 = {
	"ret_samurai_01",
	0
}
f0_local38 = {
	"ret_titanium_01",
	0
}
f0_local39 = {
	"ret_ultraviolet_01",
	0
}
f0_local40 = {
	"ret_venom_01",
	0
}
f0_local41 = {
	"ret_vortex_01",
	0
}
f0_local42 = {
	"ret_vortex_02",
	0
}
f0_local43 = {
	"ret_vortex_03",
	0
}
f0_local44 = {
	"ret_vortex_04",
	0
}
f0_local45 = {
	"ret_vortex_05",
	0
}
f0_local46 = {
	"ret_vortex_06",
	0
}
f0_local47 = {
	"ret_vortex_07",
	0
}
f0_local48 = {
	"ret_vortex_reward",
	0
}
f0_local49 = {
	"ret_wartorn_01",
	0
}
f0_local50 = {
	"ret_leprechaun_01",
	0
}
f0_local51 = {
	"ret_highnoon_01",
	0
}
f0_local52 = {
	"ret_urbanwarfare_01",
	0
}
f0_local53 = {
	"ret_fieldtested_01",
	0
}
f0_local54 = {
	"ret_kingfish_01",
	0
}
f0_local55 = {
	"ret_tacticalfighter_01",
	0
}
f0_local5[65] = f0_local6
f0_local5[66] = f0_local7
f0_local5[67] = f0_local8
f0_local5[68] = f0_local9
f0_local5[69] = f0_local10
f0_local5[70] = f0_local11
f0_local5[71] = f0_local12
f0_local5[72] = f0_local13
f0_local5[73] = f0_local14
f0_local5[74] = f0_local15
f0_local5[75] = f0_local16
f0_local5[76] = f0_local17
f0_local5[77] = f0_local18
f0_local5[78] = f0_local19
f0_local5[79] = f0_local20
f0_local5[80] = f0_local21
f0_local5[81] = f0_local22
f0_local5[82] = f0_local23
f0_local5[83] = f0_local24
f0_local5[84] = f0_local25
f0_local5[85] = f0_local26
f0_local5[86] = f0_local27
f0_local5[87] = f0_local28
f0_local5[88] = f0_local29
f0_local5[89] = f0_local30
f0_local5[90] = f0_local31
f0_local5[91] = f0_local32
f0_local5[92] = f0_local33
f0_local5[93] = f0_local34
f0_local5[94] = f0_local35
f0_local5[95] = f0_local36
f0_local5[96] = f0_local37
f0_local5[97] = f0_local38
f0_local5[98] = f0_local39
f0_local5[99] = f0_local40
f0_local5[100] = f0_local41
f0_local5[101] = f0_local42
f0_local5[102] = f0_local43
f0_local5[103] = f0_local44
f0_local5[104] = f0_local45
f0_local5[105] = f0_local46
f0_local5[106] = f0_local47
f0_local5[107] = f0_local48
f0_local5[108] = f0_local49
f0_local5[109] = f0_local50
f0_local5[110] = f0_local51
f0_local5[111] = f0_local52
f0_local5[112] = f0_local53
f0_local5[113] = f0_local54
f0_local5[114] = f0_local55
f0_local6 = {
	"ret_battletested_01",
	0
}
f0_local7 = {
	"ret_diabolical_01",
	0
}
f0_local8 = {
	"ret_caveman_01",
	0
}
f0_local9 = {
	"ret_sawtooth_01",
	0
}
f0_local10 = {
	"ret_bos14_01",
	0
}
f0_local11 = {
	"ret_fang45_01",
	0
}
f0_local12 = {
	"ret_phalanx_01",
	0
}
f0_local13 = {
	"ret_focal_01",
	0
}
f0_local14 = {
	"ret_focal_02",
	0
}
f0_local15 = {
	"ret_focal_03",
	0
}
f0_local16 = {
	"ret_focal_04",
	0
}
f0_local17 = {
	"ret_focal_05",
	0
}
f0_local18 = {
	"ret_focal_06",
	0
}
f0_local19 = {
	"ret_focal_07",
	0
}
f0_local20 = {
	"ret_focal_reward",
	0
}
f0_local21 = {
	"ret_facet_01",
	0
}
f0_local22 = {
	"ret_facet_02",
	0
}
f0_local23 = {
	"ret_facet_03",
	0
}
f0_local24 = {
	"ret_facet_04",
	0
}
f0_local25 = {
	"ret_facet_05",
	0
}
f0_local26 = {
	"ret_facet_06",
	0
}
f0_local27 = {
	"ret_facet_07",
	0
}
f0_local28 = {
	"ret_facet_reward",
	0
}
f0_local29 = {
	"ret_summertime_01",
	0
}
f0_local30 = {
	"ret_nauticus_01",
	0
}
f0_local31 = {
	"ret_celebration_01",
	0
}
f0_local32 = {
	"ret_pyrotechnic_01",
	0
}
f0_local33 = {
	"ret_stac330_01",
	0
}
f0_local34 = {
	"ret_beredmk8_01",
	0
}
f0_local35 = {
	"ret_wolfen_01",
	0
}
f0_local36 = {
	"ret_warscarred_01",
	0
}
f0_local37 = {
	"ret_slate_01",
	0
}
f0_local38 = {
	"ret_grisly_01",
	0
}
f0_local39 = {
	"ret_blackout_01",
	0
}
f0_local40 = {
	"ret_glacier_01",
	0
}
f0_local41 = {
	"ret_masterpiece_01",
	0
}
f0_local42 = {
	"ret_don_01",
	0
}
f0_local43 = {
	"ret_mudder_01",
	0
}
f0_local44 = {
	"ret_liquidator_01",
	0
}
f0_local45 = {
	"ret_neanderthal_01",
	0
}
f0_local46 = {
	"ret_reaper_01",
	0
}
f0_local47 = {
	"ret_tribal_01",
	0
}
f0_local48 = {
	"ret_bludgeon_01",
	0
}
f0_local49 = {
	"ret_subdivision_01",
	0
}
f0_local50 = {
	"ret_subdivision_02",
	0
}
f0_local51 = {
	"ret_subdivision_03",
	0
}
f0_local52 = {
	"ret_subdivision_04",
	0
}
f0_local53 = {
	"ret_subdivision_05",
	0
}
f0_local54 = {
	"ret_subdivision_06",
	0
}
f0_local55 = {
	"ret_subdivision_07",
	0
}
f0_local5[97] = f0_local6
f0_local5[98] = f0_local7
f0_local5[99] = f0_local8
f0_local5[100] = f0_local9
f0_local5[101] = f0_local10
f0_local5[102] = f0_local11
f0_local5[103] = f0_local12
f0_local5[104] = f0_local13
f0_local5[105] = f0_local14
f0_local5[106] = f0_local15
f0_local5[107] = f0_local16
f0_local5[108] = f0_local17
f0_local5[109] = f0_local18
f0_local5[110] = f0_local19
f0_local5[111] = f0_local20
f0_local5[112] = f0_local21
f0_local5[113] = f0_local22
f0_local5[114] = f0_local23
f0_local5[115] = f0_local24
f0_local5[116] = f0_local25
f0_local5[117] = f0_local26
f0_local5[118] = f0_local27
f0_local5[119] = f0_local28
f0_local5[120] = f0_local29
f0_local5[121] = f0_local30
f0_local5[122] = f0_local31
f0_local5[123] = f0_local32
f0_local5[124] = f0_local33
f0_local5[125] = f0_local34
f0_local5[126] = f0_local35
f0_local5[127] = f0_local36
f0_local5[128] = f0_local37
f0_local5[129] = f0_local38
f0_local5[130] = f0_local39
f0_local5[131] = f0_local40
f0_local5[132] = f0_local41
f0_local5[133] = f0_local42
f0_local5[134] = f0_local43
f0_local5[135] = f0_local44
f0_local5[136] = f0_local45
f0_local5[137] = f0_local46
f0_local5[138] = f0_local47
f0_local5[139] = f0_local48
f0_local5[140] = f0_local49
f0_local5[141] = f0_local50
f0_local5[142] = f0_local51
f0_local5[143] = f0_local52
f0_local5[144] = f0_local53
f0_local5[145] = f0_local54
f0_local5[146] = f0_local55
f0_local6 = {
	"ret_subdivision_reward",
	0
}
f0_local7 = {
	"ret_monarch_01",
	0
}
f0_local8 = {
	"ret_monarch_02",
	0
}
f0_local9 = {
	"ret_monarch_03",
	0
}
f0_local10 = {
	"ret_monarch_04",
	0
}
f0_local11 = {
	"ret_monarch_05",
	0
}
f0_local12 = {
	"ret_monarch_06",
	0
}
f0_local13 = {
	"ret_monarch_07",
	0
}
f0_local14 = {
	"ret_monarch_reward",
	0
}
f0_local15 = {
	"ret_interrupt_01",
	0
}
f0_local16 = {
	"ret_interrupt_02",
	0
}
f0_local17 = {
	"ret_interrupt_03",
	0
}
f0_local18 = {
	"ret_interrupt_04",
	0
}
f0_local19 = {
	"ret_interrupt_05",
	0
}
f0_local20 = {
	"ret_interrupt_06",
	0
}
f0_local21 = {
	"ret_interrupt_07",
	0
}
f0_local22 = {
	"ret_interrupt_reward",
	0
}
f0_local23 = {
	"ret_phantasm_01",
	0
}
f0_local24 = {
	"ret_phantasm_02",
	0
}
f0_local25 = {
	"ret_phantasm_03",
	0
}
f0_local26 = {
	"ret_phantasm_04",
	0
}
f0_local27 = {
	"ret_phantasm_05",
	0
}
f0_local28 = {
	"ret_phantasm_06",
	0
}
f0_local29 = {
	"ret_phantasm_07",
	0
}
f0_local30 = {
	"ret_phantasm_reward",
	0
}
f0_local31 = {
	"ret_lynxcq300_01",
	0
}
f0_local32 = {
	"ret_pkpsd9_01",
	0
}
f0_local33 = {
	"ret_centermass_01",
	0
}
f0_local34 = {
	"ret_elder_01",
	0
}
f0_local35 = {
	"ret_obsidian_01",
	0
}
f0_local36 = {
	"ret_ghillie_01",
	0
}
f0_local37 = {
	"ret_urbanoperator_01",
	0
}
f0_local38 = {
	"ret_firedrake_01",
	0
}
f0_local39 = {
	"ret_specops_01",
	0
}
f0_local40 = {
	"ret_enforce_01",
	0
}
f0_local41 = {
	"ret_barber_01",
	0
}
f0_local42 = {
	"ret_dangerclose_01",
	0
}
f0_local43 = {
	"ret_monarch2_01",
	0
}
f0_local44 = {
	"ret_monarch2_02",
	0
}
f0_local45 = {
	"ret_monarch2_03",
	0
}
f0_local46 = {
	"ret_monarch2_04",
	0
}
f0_local47 = {
	"ret_monarch2_05",
	0
}
f0_local48 = {
	"ret_monarch2_06",
	0
}
f0_local49 = {
	"ret_monarch2_07",
	0
}
f0_local50 = {
	"ret_monarch2_reward",
	0
}
f0_local51 = {
	"ret_wildcard_01",
	0
}
f0_local52 = {
	"ret_wildcard_02",
	0
}
f0_local53 = {
	"ret_wildcard_03",
	0
}
f0_local54 = {
	"ret_wildcard_04",
	0
}
f0_local55 = {
	"ret_wildcard_05",
	0
}
f0_local5[129] = f0_local6
f0_local5[130] = f0_local7
f0_local5[131] = f0_local8
f0_local5[132] = f0_local9
f0_local5[133] = f0_local10
f0_local5[134] = f0_local11
f0_local5[135] = f0_local12
f0_local5[136] = f0_local13
f0_local5[137] = f0_local14
f0_local5[138] = f0_local15
f0_local5[139] = f0_local16
f0_local5[140] = f0_local17
f0_local5[141] = f0_local18
f0_local5[142] = f0_local19
f0_local5[143] = f0_local20
f0_local5[144] = f0_local21
f0_local5[145] = f0_local22
f0_local5[146] = f0_local23
f0_local5[147] = f0_local24
f0_local5[148] = f0_local25
f0_local5[149] = f0_local26
f0_local5[150] = f0_local27
f0_local5[151] = f0_local28
f0_local5[152] = f0_local29
f0_local5[153] = f0_local30
f0_local5[154] = f0_local31
f0_local5[155] = f0_local32
f0_local5[156] = f0_local33
f0_local5[157] = f0_local34
f0_local5[158] = f0_local35
f0_local5[159] = f0_local36
f0_local5[160] = f0_local37
f0_local5[161] = f0_local38
f0_local5[162] = f0_local39
f0_local5[163] = f0_local40
f0_local5[164] = f0_local41
f0_local5[165] = f0_local42
f0_local5[166] = f0_local43
f0_local5[167] = f0_local44
f0_local5[168] = f0_local45
f0_local5[169] = f0_local46
f0_local5[170] = f0_local47
f0_local5[171] = f0_local48
f0_local5[172] = f0_local49
f0_local5[173] = f0_local50
f0_local5[174] = f0_local51
f0_local5[175] = f0_local52
f0_local5[176] = f0_local53
f0_local5[177] = f0_local54
f0_local5[178] = f0_local55
f0_local6 = {
	"ret_wildcard_06",
	0
}
f0_local7 = {
	"ret_wildcard_07",
	0
}
f0_local8 = {
	"ret_wildcard_reward",
	0
}
f0_local5[161] = f0_local6
f0_local5[162] = f0_local7
f0_local5[163] = f0_local8
f0_local6 = "@MENU_RETICLE_CAPS"
f0_local7 = CoD.Material.LockedIcon
f0_local3[1] = f0_local4
f0_local3[2] = f0_local5
f0_local3[3] = f0_local6
f0_local3[4] = f0_local7
f0_local2[1] = f0_local3
f0_local1.Primary_Reticle = f0_local2
f0_local2 = "Secondary_Reticle"
f0_local3 = {}
f0_local4 = {}
f0_local5 = "reticle"
f0_local6 = {
	{
		"none",
		0
	},
	{
		"ret007",
		0
	},
	{
		"ret008",
		0
	},
	{
		"ret009",
		0
	},
	{
		"ret010",
		0
	},
	{
		"ret011",
		0
	},
	{
		"ret012",
		0
	},
	{
		"ret013",
		0
	},
	{
		"ret014",
		0
	},
	{
		"ret016",
		0
	},
	{
		"ret017",
		0
	},
	{
		"ret018",
		0
	},
	{
		"ret019",
		0
	},
	{
		"ret021",
		0
	},
	{
		"ret024",
		0
	},
	{
		"ret025",
		0
	},
	{
		"ret026",
		0
	},
	{
		"ret027",
		0
	},
	{
		"ret028",
		0
	},
	{
		"ret030",
		0
	},
	{
		"ret031",
		0
	},
	{
		"ret032",
		0
	},
	{
		"ret033",
		0
	},
	{
		"ret034",
		0
	},
	{
		"ret035",
		0
	},
	{
		"ret036",
		0
	},
	{
		"ret037",
		0
	},
	{
		"ret038",
		0
	},
	{
		"ret041",
		0
	},
	{
		"ret042",
		0
	},
	{
		"ret043",
		0
	},
	{
		"ret044",
		0
	},
	{
		"ret045",
		0
	},
	{
		"ret046",
		0
	},
	{
		"ret047",
		0
	},
	{
		"ret048",
		0
	},
	{
		"ret049",
		0
	},
	{
		"ret050",
		0
	},
	{
		"ret051",
		0
	},
	{
		"ret052",
		0
	},
	{
		"ret053",
		0
	},
	{
		"ret054",
		0
	},
	{
		"ret055",
		0
	},
	{
		"ret056",
		0
	},
	{
		"ret057",
		0
	},
	{
		"ret058",
		0
	},
	{
		"ret059",
		0
	},
	{
		"ret060",
		0
	},
	{
		"ret061",
		0
	},
	{
		"ret062",
		0
	}
}
f0_local7 = {
	"ret063",
	0
}
f0_local8 = {
	"ret064",
	0
}
f0_local9 = {
	"ret065",
	0
}
f0_local10 = {
	"ret066",
	0
}
f0_local11 = {
	"ret067",
	0
}
f0_local12 = {
	"ret068",
	0
}
f0_local13 = {
	"ret069",
	0
}
f0_local14 = {
	"ret070",
	0
}
f0_local15 = {
	"ret071",
	0
}
f0_local16 = {
	"ret072",
	0
}
f0_local17 = {
	"ret073",
	0
}
f0_local18 = {
	"ret074",
	0
}
f0_local19 = {
	"ret075",
	0
}
f0_local20 = {
	"ret076",
	0
}
f0_local21 = {
	"ret077",
	0
}
f0_local22 = {
	"ret078",
	0
}
f0_local23 = {
	"ret080",
	0
}
f0_local24 = {
	"ret081",
	0
}
f0_local25 = {
	"ret085",
	0
}
f0_local26 = {
	"ret086",
	0
}
f0_local27 = {
	"ret089",
	0
}
f0_local28 = {
	"ret091",
	0
}
f0_local29 = {
	"ret094",
	0
}
f0_local30 = {
	"ret095",
	0
}
f0_local31 = {
	"ret096",
	0
}
f0_local32 = {
	"ret097",
	0
}
f0_local33 = {
	"ret100",
	0
}
f0_local34 = {
	"ret101",
	0
}
f0_local35 = {
	"ret102",
	0
}
f0_local36 = {
	"ret103",
	0
}
f0_local37 = {
	"ret104",
	0
}
f0_local38 = {
	"ret105",
	0
}
f0_local39 = {
	"ret106",
	0
}
f0_local40 = {
	"ret107",
	0
}
f0_local41 = {
	"ret108",
	0
}
f0_local42 = {
	"ret115",
	0
}
f0_local43 = {
	"ret116",
	0
}
f0_local44 = {
	"ret117",
	0
}
f0_local45 = {
	"ret118",
	0
}
f0_local46 = {
	"ret120",
	0
}
f0_local47 = {
	"ret121",
	0
}
f0_local48 = {
	"ret_angle_01",
	0
}
f0_local49 = {
	"ret_angle_02",
	0
}
f0_local50 = {
	"ret_angle_03",
	0
}
f0_local51 = {
	"ret_angle_04",
	0
}
f0_local52 = {
	"ret_angle_05",
	0
}
f0_local53 = {
	"ret_angle_06",
	0
}
f0_local54 = {
	"ret_angle_07",
	0
}
f0_local55 = {
	"ret_angle_reward",
	0
}
local f0_local56 = {
	"ret_avalanche_01",
	0
}
f0_local6[33] = f0_local7
f0_local6[34] = f0_local8
f0_local6[35] = f0_local9
f0_local6[36] = f0_local10
f0_local6[37] = f0_local11
f0_local6[38] = f0_local12
f0_local6[39] = f0_local13
f0_local6[40] = f0_local14
f0_local6[41] = f0_local15
f0_local6[42] = f0_local16
f0_local6[43] = f0_local17
f0_local6[44] = f0_local18
f0_local6[45] = f0_local19
f0_local6[46] = f0_local20
f0_local6[47] = f0_local21
f0_local6[48] = f0_local22
f0_local6[49] = f0_local23
f0_local6[50] = f0_local24
f0_local6[51] = f0_local25
f0_local6[52] = f0_local26
f0_local6[53] = f0_local27
f0_local6[54] = f0_local28
f0_local6[55] = f0_local29
f0_local6[56] = f0_local30
f0_local6[57] = f0_local31
f0_local6[58] = f0_local32
f0_local6[59] = f0_local33
f0_local6[60] = f0_local34
f0_local6[61] = f0_local35
f0_local6[62] = f0_local36
f0_local6[63] = f0_local37
f0_local6[64] = f0_local38
f0_local6[65] = f0_local39
f0_local6[66] = f0_local40
f0_local6[67] = f0_local41
f0_local6[68] = f0_local42
f0_local6[69] = f0_local43
f0_local6[70] = f0_local44
f0_local6[71] = f0_local45
f0_local6[72] = f0_local46
f0_local6[73] = f0_local47
f0_local6[74] = f0_local48
f0_local6[75] = f0_local49
f0_local6[76] = f0_local50
f0_local6[77] = f0_local51
f0_local6[78] = f0_local52
f0_local6[79] = f0_local53
f0_local6[80] = f0_local54
f0_local6[81] = f0_local55
f0_local6[82] = f0_local56
f0_local7 = {
	"ret_bent_01",
	0
}
f0_local8 = {
	"ret_bent_02",
	0
}
f0_local9 = {
	"ret_bent_03",
	0
}
f0_local10 = {
	"ret_bent_04",
	0
}
f0_local11 = {
	"ret_bent_05",
	0
}
f0_local12 = {
	"ret_bent_06",
	0
}
f0_local13 = {
	"ret_bent_07",
	0
}
f0_local14 = {
	"ret_bent_reward",
	0
}
f0_local15 = {
	"ret_chalk_01",
	0
}
f0_local16 = {
	"ret_challenger_01",
	0
}
f0_local17 = {
	"ret_dmr25s_01",
	0
}
f0_local18 = {
	"ret_frag_01",
	0
}
f0_local19 = {
	"ret_graves_01",
	0
}
f0_local20 = {
	"ret_ironsmith_01",
	0
}
f0_local21 = {
	"ret_ironsmith_02",
	0
}
f0_local22 = {
	"ret_ironsmith_03",
	0
}
f0_local23 = {
	"ret_ironsmith_04",
	0
}
f0_local24 = {
	"ret_ironsmith_05",
	0
}
f0_local25 = {
	"ret_ironsmith_06",
	0
}
f0_local26 = {
	"ret_ironsmith_07",
	0
}
f0_local27 = {
	"ret_ironsmith_reward",
	0
}
f0_local28 = {
	"ret_killshot_01",
	0
}
f0_local29 = {
	"ret_kingpin_01",
	0
}
f0_local30 = {
	"ret_mac10_01",
	0
}
f0_local31 = {
	"ret_mastercraft_01",
	0
}
f0_local32 = {
	"ret_mechanic_01",
	0
}
f0_local33 = {
	"ret_noobtuber_01",
	0
}
f0_local34 = {
	"ret_pigpen_01",
	0
}
f0_local35 = {
	"ret_pkm_01",
	0
}
f0_local36 = {
	"ret_reflex_01",
	0
}
f0_local37 = {
	"ret_samurai_01",
	0
}
f0_local38 = {
	"ret_titanium_01",
	0
}
f0_local39 = {
	"ret_ultraviolet_01",
	0
}
f0_local40 = {
	"ret_venom_01",
	0
}
f0_local41 = {
	"ret_vortex_01",
	0
}
f0_local42 = {
	"ret_vortex_02",
	0
}
f0_local43 = {
	"ret_vortex_03",
	0
}
f0_local44 = {
	"ret_vortex_04",
	0
}
f0_local45 = {
	"ret_vortex_05",
	0
}
f0_local46 = {
	"ret_vortex_06",
	0
}
f0_local47 = {
	"ret_vortex_07",
	0
}
f0_local48 = {
	"ret_vortex_reward",
	0
}
f0_local49 = {
	"ret_wartorn_01",
	0
}
f0_local50 = {
	"ret_leprechaun_01",
	0
}
f0_local51 = {
	"ret_code",
	0
}
f0_local6[65] = f0_local7
f0_local6[66] = f0_local8
f0_local6[67] = f0_local9
f0_local6[68] = f0_local10
f0_local6[69] = f0_local11
f0_local6[70] = f0_local12
f0_local6[71] = f0_local13
f0_local6[72] = f0_local14
f0_local6[73] = f0_local15
f0_local6[74] = f0_local16
f0_local6[75] = f0_local17
f0_local6[76] = f0_local18
f0_local6[77] = f0_local19
f0_local6[78] = f0_local20
f0_local6[79] = f0_local21
f0_local6[80] = f0_local22
f0_local6[81] = f0_local23
f0_local6[82] = f0_local24
f0_local6[83] = f0_local25
f0_local6[84] = f0_local26
f0_local6[85] = f0_local27
f0_local6[86] = f0_local28
f0_local6[87] = f0_local29
f0_local6[88] = f0_local30
f0_local6[89] = f0_local31
f0_local6[90] = f0_local32
f0_local6[91] = f0_local33
f0_local6[92] = f0_local34
f0_local6[93] = f0_local35
f0_local6[94] = f0_local36
f0_local6[95] = f0_local37
f0_local6[96] = f0_local38
f0_local6[97] = f0_local39
f0_local6[98] = f0_local40
f0_local6[99] = f0_local41
f0_local6[100] = f0_local42
f0_local6[101] = f0_local43
f0_local6[102] = f0_local44
f0_local6[103] = f0_local45
f0_local6[104] = f0_local46
f0_local6[105] = f0_local47
f0_local6[106] = f0_local48
f0_local6[107] = f0_local49
f0_local6[108] = f0_local50
f0_local6[109] = f0_local51
f0_local7 = "@MENU_RETICLE_CAPS"
f0_local8 = CoD.Material.LockedIcon
f0_local4[1] = f0_local5
f0_local4[2] = f0_local6
f0_local4[3] = f0_local7
f0_local4[4] = f0_local8
f0_local3[1] = f0_local4
f0_local1[f0_local2] = f0_local3
f0_local2 = "Primary_Camo"
f0_local3 = {}
f0_local4 = {}
f0_local5 = "camo"
f0_local6 = {
	{
		"none",
		0
	},
	{
		"desert",
		0
	},
	{
		"woodland",
		0
	},
	{
		"digital",
		0
	},
	{
		"bluetiger",
		0
	},
	{
		"redtiger",
		0
	},
	{
		"redhex",
		0
	},
	{
		"odgreen",
		0
	},
	{
		"fde",
		0
	},
	{
		"white",
		0
	},
	{
		"nickel",
		0
	},
	{
		"neontiger",
		0
	},
	{
		"gold",
		0
	},
	{
		"diamond",
		0
	},
	{
		"darkmatter",
		0
	},
	{
		"camo016",
		0
	},
	{
		"camo017",
		0
	},
	{
		"camo018",
		0
	},
	{
		"camo019",
		0
	},
	{
		"camo020",
		0
	},
	{
		"camo021",
		0
	},
	{
		"camo022",
		0
	},
	{
		"camo023",
		0
	},
	{
		"camo024",
		0
	},
	{
		"camo025",
		0
	},
	{
		"camo026",
		0
	},
	{
		"camo027",
		0
	},
	{
		"camo028",
		0
	},
	{
		"camo029",
		0
	},
	{
		"camo030",
		0
	},
	{
		"camo031",
		0
	},
	{
		"camo032",
		0
	},
	{
		"camo033",
		0
	},
	{
		"camo034",
		0
	},
	{
		"camo035",
		0
	},
	{
		"camo036",
		0
	},
	{
		"camo037",
		0
	},
	{
		"camo038",
		0
	},
	{
		"camo039",
		0
	},
	{
		"camo040",
		0
	},
	{
		"camo041",
		0
	},
	{
		"camo042",
		0
	},
	{
		"camo043",
		0
	},
	{
		"camo044",
		0
	},
	{
		"camo045",
		0
	},
	{
		"camo046",
		0
	},
	{
		"camo047",
		0
	},
	{
		"camo048",
		0
	},
	{
		"camo049",
		0
	},
	{
		"camo050",
		0
	}
}
f0_local7 = {
	"camo051",
	0
}
f0_local8 = {
	"camo052",
	0
}
f0_local9 = {
	"camo053",
	0
}
f0_local10 = {
	"camo054",
	0
}
f0_local11 = {
	"camo055",
	0
}
f0_local12 = {
	"camo056",
	0
}
f0_local13 = {
	"camo057",
	0
}
f0_local14 = {
	"camo058",
	0
}
f0_local15 = {
	"camo059",
	0
}
f0_local16 = {
	"camo060",
	0
}
f0_local17 = {
	"camo061",
	0
}
f0_local18 = {
	"camo062",
	0
}
f0_local19 = {
	"camo063",
	0
}
f0_local20 = {
	"camo064",
	0
}
f0_local21 = {
	"camo065",
	0
}
f0_local22 = {
	"camo066",
	0
}
f0_local23 = {
	"camo067",
	0
}
f0_local24 = {
	"camo068",
	0
}
f0_local25 = {
	"camo069",
	0
}
f0_local26 = {
	"camo070",
	0
}
f0_local27 = {
	"camo071",
	0
}
f0_local28 = {
	"camo072",
	0
}
f0_local29 = {
	"camo073",
	0
}
f0_local30 = {
	"camo074",
	0
}
f0_local31 = {
	"camo075",
	0
}
f0_local32 = {
	"camo076",
	0
}
f0_local33 = {
	"camo077",
	0
}
f0_local34 = {
	"camo078",
	0
}
f0_local35 = {
	"camo079",
	0
}
f0_local36 = {
	"camo080",
	0
}
f0_local37 = {
	"camo081",
	0
}
f0_local38 = {
	"camo082",
	0
}
f0_local39 = {
	"camo083",
	0
}
f0_local40 = {
	"camo084",
	0
}
f0_local41 = {
	"camo085",
	0
}
f0_local42 = {
	"camo086",
	0
}
f0_local43 = {
	"camo087",
	0
}
f0_local44 = {
	"camo088",
	0
}
f0_local45 = {
	"camo089",
	0
}
f0_local46 = {
	"wcamo_code",
	0
}
f0_local47 = {
	"wc_aftermath_01",
	0
}
f0_local48 = {
	"wc_aftermath_02",
	0
}
f0_local49 = {
	"wc_aftermath_03",
	0
}
f0_local50 = {
	"wc_aftermath_04",
	0
}
f0_local51 = {
	"wc_aftermath_05",
	0
}
f0_local52 = {
	"wc_aftermath_06",
	0
}
f0_local53 = {
	"wc_aftermath_07",
	0
}
f0_local54 = {
	"wc_aftermath_reward",
	0
}
f0_local55 = {
	"wc_battlescarred_01",
	0
}
f0_local56 = {
	"wc_czar_01",
	0
}
f0_local6[33] = f0_local7
f0_local6[34] = f0_local8
f0_local6[35] = f0_local9
f0_local6[36] = f0_local10
f0_local6[37] = f0_local11
f0_local6[38] = f0_local12
f0_local6[39] = f0_local13
f0_local6[40] = f0_local14
f0_local6[41] = f0_local15
f0_local6[42] = f0_local16
f0_local6[43] = f0_local17
f0_local6[44] = f0_local18
f0_local6[45] = f0_local19
f0_local6[46] = f0_local20
f0_local6[47] = f0_local21
f0_local6[48] = f0_local22
f0_local6[49] = f0_local23
f0_local6[50] = f0_local24
f0_local6[51] = f0_local25
f0_local6[52] = f0_local26
f0_local6[53] = f0_local27
f0_local6[54] = f0_local28
f0_local6[55] = f0_local29
f0_local6[56] = f0_local30
f0_local6[57] = f0_local31
f0_local6[58] = f0_local32
f0_local6[59] = f0_local33
f0_local6[60] = f0_local34
f0_local6[61] = f0_local35
f0_local6[62] = f0_local36
f0_local6[63] = f0_local37
f0_local6[64] = f0_local38
f0_local6[65] = f0_local39
f0_local6[66] = f0_local40
f0_local6[67] = f0_local41
f0_local6[68] = f0_local42
f0_local6[69] = f0_local43
f0_local6[70] = f0_local44
f0_local6[71] = f0_local45
f0_local6[72] = f0_local46
f0_local6[73] = f0_local47
f0_local6[74] = f0_local48
f0_local6[75] = f0_local49
f0_local6[76] = f0_local50
f0_local6[77] = f0_local51
f0_local6[78] = f0_local52
f0_local6[79] = f0_local53
f0_local6[80] = f0_local54
f0_local6[81] = f0_local55
f0_local6[82] = f0_local56
f0_local7 = {
	"wc_diablo_01",
	0
}
f0_local8 = {
	"wc_diablo_02",
	0
}
f0_local9 = {
	"wc_diablo_03",
	0
}
f0_local10 = {
	"wc_diablo_04",
	0
}
f0_local11 = {
	"wc_diablo_05",
	0
}
f0_local12 = {
	"wc_diablo_06",
	0
}
f0_local13 = {
	"wc_diablo_07",
	0
}
f0_local14 = {
	"wc_diablo_reward",
	0
}
f0_local15 = {
	"wc_funhouse_01",
	0
}
f0_local16 = {
	"wc_funhouse_02",
	0
}
f0_local17 = {
	"wc_funhouse_03",
	0
}
f0_local18 = {
	"wc_funhouse_04",
	0
}
f0_local19 = {
	"wc_funhouse_05",
	0
}
f0_local20 = {
	"wc_funhouse_06",
	0
}
f0_local21 = {
	"wc_funhouse_07",
	0
}
f0_local22 = {
	"wc_funhouse_reward",
	0
}
f0_local23 = {
	"wc_gladiator_01",
	0
}
f0_local24 = {
	"wc_hatchetman_01",
	0
}
f0_local25 = {
	"wc_hunter_01",
	0
}
f0_local26 = {
	"wc_hunter_02",
	0
}
f0_local27 = {
	"wc_hunter_03",
	0
}
f0_local28 = {
	"wc_hunter_04",
	0
}
f0_local29 = {
	"wc_hunter_05",
	0
}
f0_local30 = {
	"wc_hunter_06",
	0
}
f0_local31 = {
	"wc_hunter_07",
	0
}
f0_local32 = {
	"wc_hunter_reward",
	0
}
f0_local33 = {
	"wc_huntsman_01",
	0
}
f0_local34 = {
	"wc_kamchatka12_01",
	0
}
f0_local35 = {
	"wc_lawman_01",
	0
}
f0_local36 = {
	"wc_magnum_01",
	0
}
f0_local37 = {
	"wc_xmlar_01",
	0
}
f0_local38 = {
	"wc_arcticwolf_01",
	0
}
f0_local39 = {
	"wc_amoeba_01",
	0
}
f0_local40 = {
	"wc_amoeba_02",
	0
}
f0_local41 = {
	"wc_amoeba_03",
	0
}
f0_local42 = {
	"wc_amoeba_04",
	0
}
f0_local43 = {
	"wc_amoeba_05",
	0
}
f0_local44 = {
	"wc_amoeba_06",
	0
}
f0_local45 = {
	"wc_amoeba_07",
	0
}
f0_local46 = {
	"wc_amoeba_reward",
	0
}
f0_local47 = {
	"wc_avalanche_01",
	0
}
f0_local48 = {
	"wc_boss_01",
	0
}
f0_local49 = {
	"wc_chalk_01",
	0
}
f0_local50 = {
	"wc_challenger_01",
	0
}
f0_local51 = {
	"wc_decay_01",
	0
}
f0_local52 = {
	"wc_decay_02",
	0
}
f0_local53 = {
	"wc_decay_03",
	0
}
f0_local54 = {
	"wc_decay_04",
	0
}
f0_local55 = {
	"wc_decay_05",
	0
}
f0_local56 = {
	"wc_decay_06",
	0
}
f0_local6[65] = f0_local7
f0_local6[66] = f0_local8
f0_local6[67] = f0_local9
f0_local6[68] = f0_local10
f0_local6[69] = f0_local11
f0_local6[70] = f0_local12
f0_local6[71] = f0_local13
f0_local6[72] = f0_local14
f0_local6[73] = f0_local15
f0_local6[74] = f0_local16
f0_local6[75] = f0_local17
f0_local6[76] = f0_local18
f0_local6[77] = f0_local19
f0_local6[78] = f0_local20
f0_local6[79] = f0_local21
f0_local6[80] = f0_local22
f0_local6[81] = f0_local23
f0_local6[82] = f0_local24
f0_local6[83] = f0_local25
f0_local6[84] = f0_local26
f0_local6[85] = f0_local27
f0_local6[86] = f0_local28
f0_local6[87] = f0_local29
f0_local6[88] = f0_local30
f0_local6[89] = f0_local31
f0_local6[90] = f0_local32
f0_local6[91] = f0_local33
f0_local6[92] = f0_local34
f0_local6[93] = f0_local35
f0_local6[94] = f0_local36
f0_local6[95] = f0_local37
f0_local6[96] = f0_local38
f0_local6[97] = f0_local39
f0_local6[98] = f0_local40
f0_local6[99] = f0_local41
f0_local6[100] = f0_local42
f0_local6[101] = f0_local43
f0_local6[102] = f0_local44
f0_local6[103] = f0_local45
f0_local6[104] = f0_local46
f0_local6[105] = f0_local47
f0_local6[106] = f0_local48
f0_local6[107] = f0_local49
f0_local6[108] = f0_local50
f0_local6[109] = f0_local51
f0_local6[110] = f0_local52
f0_local6[111] = f0_local53
f0_local6[112] = f0_local54
f0_local6[113] = f0_local55
f0_local6[114] = f0_local56
f0_local7 = {
	"wc_decay_07",
	0
}
f0_local8 = {
	"wc_decay_reward",
	0
}
f0_local9 = {
	"wc_dmr25s_01",
	0
}
f0_local10 = {
	"wc_etch_01",
	0
}
f0_local11 = {
	"wc_etch_02",
	0
}
f0_local12 = {
	"wc_etch_03",
	0
}
f0_local13 = {
	"wc_etch_04",
	0
}
f0_local14 = {
	"wc_etch_05",
	0
}
f0_local15 = {
	"wc_etch_06",
	0
}
f0_local16 = {
	"wc_etch_07",
	0
}
f0_local17 = {
	"wc_etch_reward",
	0
}
f0_local18 = {
	"wc_exlibris_01",
	0
}
f0_local19 = {
	"wc_exlibris_02",
	0
}
f0_local20 = {
	"wc_exlibris_03",
	0
}
f0_local21 = {
	"wc_exlibris_04",
	0
}
f0_local22 = {
	"wc_exlibris_05",
	0
}
f0_local23 = {
	"wc_exlibris_06",
	0
}
f0_local24 = {
	"wc_exlibris_07",
	0
}
f0_local25 = {
	"wc_exlibris_reward",
	0
}
f0_local26 = {
	"wc_frag_01",
	0
}
f0_local27 = {
	"wc_graves_01",
	0
}
f0_local28 = {
	"wc_killshot_01",
	0
}
f0_local29 = {
	"wc_kingpin_01",
	0
}
f0_local30 = {
	"wc_mac10_01",
	0
}
f0_local31 = {
	"wc_mastercraft_01",
	0
}
f0_local32 = {
	"wc_mechanic_01",
	0
}
f0_local33 = {
	"wc_minerva_01",
	0
}
f0_local34 = {
	"wc_minerva_02",
	0
}
f0_local35 = {
	"wc_minerva_03",
	0
}
f0_local36 = {
	"wc_minerva_04",
	0
}
f0_local37 = {
	"wc_minerva_05",
	0
}
f0_local38 = {
	"wc_minerva_06",
	0
}
f0_local39 = {
	"wc_minerva_07",
	0
}
f0_local40 = {
	"wc_minerva_reward",
	0
}
f0_local41 = {
	"wc_noobtuber_01",
	0
}
f0_local42 = {
	"wc_pigpen_01",
	0
}
f0_local43 = {
	"wc_pkm_01",
	0
}
f0_local44 = {
	"wc_reflex_01",
	0
}
f0_local45 = {
	"wc_reptile_01",
	0
}
f0_local46 = {
	"wc_reptile_02",
	0
}
f0_local47 = {
	"wc_reptile_03",
	0
}
f0_local48 = {
	"wc_reptile_04",
	0
}
f0_local49 = {
	"wc_reptile_05",
	0
}
f0_local50 = {
	"wc_reptile_06",
	0
}
f0_local51 = {
	"wc_reptile_07",
	0
}
f0_local52 = {
	"wc_reptile_reward",
	0
}
f0_local53 = {
	"wc_samurai_01",
	0
}
f0_local54 = {
	"wc_titanium_01",
	0
}
f0_local55 = {
	"wc_ultraviolet_01",
	0
}
f0_local56 = {
	"wc_venom_01",
	0
}
f0_local6[97] = f0_local7
f0_local6[98] = f0_local8
f0_local6[99] = f0_local9
f0_local6[100] = f0_local10
f0_local6[101] = f0_local11
f0_local6[102] = f0_local12
f0_local6[103] = f0_local13
f0_local6[104] = f0_local14
f0_local6[105] = f0_local15
f0_local6[106] = f0_local16
f0_local6[107] = f0_local17
f0_local6[108] = f0_local18
f0_local6[109] = f0_local19
f0_local6[110] = f0_local20
f0_local6[111] = f0_local21
f0_local6[112] = f0_local22
f0_local6[113] = f0_local23
f0_local6[114] = f0_local24
f0_local6[115] = f0_local25
f0_local6[116] = f0_local26
f0_local6[117] = f0_local27
f0_local6[118] = f0_local28
f0_local6[119] = f0_local29
f0_local6[120] = f0_local30
f0_local6[121] = f0_local31
f0_local6[122] = f0_local32
f0_local6[123] = f0_local33
f0_local6[124] = f0_local34
f0_local6[125] = f0_local35
f0_local6[126] = f0_local36
f0_local6[127] = f0_local37
f0_local6[128] = f0_local38
f0_local6[129] = f0_local39
f0_local6[130] = f0_local40
f0_local6[131] = f0_local41
f0_local6[132] = f0_local42
f0_local6[133] = f0_local43
f0_local6[134] = f0_local44
f0_local6[135] = f0_local45
f0_local6[136] = f0_local46
f0_local6[137] = f0_local47
f0_local6[138] = f0_local48
f0_local6[139] = f0_local49
f0_local6[140] = f0_local50
f0_local6[141] = f0_local51
f0_local6[142] = f0_local52
f0_local6[143] = f0_local53
f0_local6[144] = f0_local54
f0_local6[145] = f0_local55
f0_local6[146] = f0_local56
f0_local7 = {
	"wc_wartorn_01",
	0
}
f0_local8 = {
	"wc_leprechaun_01",
	0
}
f0_local9 = {
	"wc_stpatty_01",
	0
}
f0_local10 = {
	"wc_stpatty_02",
	0
}
f0_local11 = {
	"wc_highnoon_01",
	0
}
f0_local12 = {
	"wc_phalanx_01",
	0
}
f0_local13 = {
	"wc_urbanwarfare_01",
	0
}
f0_local14 = {
	"wc_fieldtested_01",
	0
}
f0_local15 = {
	"wc_kingfish_01",
	0
}
f0_local16 = {
	"wc_tacticalfighter_01",
	0
}
f0_local17 = {
	"wc_battletested_01",
	0
}
f0_local18 = {
	"wc_diabolical_01",
	0
}
f0_local19 = {
	"wc_caveman_01",
	0
}
f0_local20 = {
	"wc_sawtooth_01",
	0
}
f0_local21 = {
	"wc_bos14_01",
	0
}
f0_local22 = {
	"wc_fang45_01",
	0
}
f0_local23 = {
	"wc_prokolot_01",
	0
}
f0_local24 = {
	"wc_hightech_01",
	0
}
f0_local25 = {
	"wc_hightech_02",
	0
}
f0_local26 = {
	"wc_hightech_03",
	0
}
f0_local27 = {
	"wc_hightech_04",
	0
}
f0_local28 = {
	"wc_hightech_05",
	0
}
f0_local29 = {
	"wc_hightech_06",
	0
}
f0_local30 = {
	"wc_hightech_07",
	0
}
f0_local31 = {
	"wc_hightech_reward",
	0
}
f0_local32 = {
	"wc_rebel_01",
	0
}
f0_local33 = {
	"wc_rebel_02",
	0
}
f0_local34 = {
	"wc_rebel_03",
	0
}
f0_local35 = {
	"wc_rebel_04",
	0
}
f0_local36 = {
	"wc_rebel_05",
	0
}
f0_local37 = {
	"wc_rebel_06",
	0
}
f0_local38 = {
	"wc_rebel_07",
	0
}
f0_local39 = {
	"wc_rebel_reward",
	0
}
f0_local40 = {
	"wc_geist_01",
	0
}
f0_local41 = {
	"wc_geist_02",
	0
}
f0_local42 = {
	"wc_geist_03",
	0
}
f0_local43 = {
	"wc_geist_04",
	0
}
f0_local44 = {
	"wc_geist_05",
	0
}
f0_local45 = {
	"wc_geist_06",
	0
}
f0_local46 = {
	"wc_geist_07",
	0
}
f0_local47 = {
	"wc_geist_reward",
	0
}
f0_local48 = {
	"wc_operator_01",
	0
}
f0_local49 = {
	"wc_operator_02",
	0
}
f0_local50 = {
	"wc_operator_03",
	0
}
f0_local51 = {
	"wc_operator_04",
	0
}
f0_local52 = {
	"wc_operator_05",
	0
}
f0_local53 = {
	"wc_operator_06",
	0
}
f0_local54 = {
	"wc_operator_07",
	0
}
f0_local55 = {
	"wc_operator_reward",
	0
}
f0_local56 = {
	"wc_summertime_01",
	0
}
f0_local6[129] = f0_local7
f0_local6[130] = f0_local8
f0_local6[131] = f0_local9
f0_local6[132] = f0_local10
f0_local6[133] = f0_local11
f0_local6[134] = f0_local12
f0_local6[135] = f0_local13
f0_local6[136] = f0_local14
f0_local6[137] = f0_local15
f0_local6[138] = f0_local16
f0_local6[139] = f0_local17
f0_local6[140] = f0_local18
f0_local6[141] = f0_local19
f0_local6[142] = f0_local20
f0_local6[143] = f0_local21
f0_local6[144] = f0_local22
f0_local6[145] = f0_local23
f0_local6[146] = f0_local24
f0_local6[147] = f0_local25
f0_local6[148] = f0_local26
f0_local6[149] = f0_local27
f0_local6[150] = f0_local28
f0_local6[151] = f0_local29
f0_local6[152] = f0_local30
f0_local6[153] = f0_local31
f0_local6[154] = f0_local32
f0_local6[155] = f0_local33
f0_local6[156] = f0_local34
f0_local6[157] = f0_local35
f0_local6[158] = f0_local36
f0_local6[159] = f0_local37
f0_local6[160] = f0_local38
f0_local6[161] = f0_local39
f0_local6[162] = f0_local40
f0_local6[163] = f0_local41
f0_local6[164] = f0_local42
f0_local6[165] = f0_local43
f0_local6[166] = f0_local44
f0_local6[167] = f0_local45
f0_local6[168] = f0_local46
f0_local6[169] = f0_local47
f0_local6[170] = f0_local48
f0_local6[171] = f0_local49
f0_local6[172] = f0_local50
f0_local6[173] = f0_local51
f0_local6[174] = f0_local52
f0_local6[175] = f0_local53
f0_local6[176] = f0_local54
f0_local6[177] = f0_local55
f0_local6[178] = f0_local56
f0_local7 = {
	"wc_nauticus_01",
	0
}
f0_local8 = {
	"wc_celebration_01",
	0
}
f0_local9 = {
	"wc_pyrotechnic_01",
	0
}
f0_local10 = {
	"wc_stac330_01",
	0
}
f0_local11 = {
	"wc_beredmk8_01",
	0
}
f0_local12 = {
	"wc_wolfen_01",
	0
}
f0_local13 = {
	"wc_warscarred_01",
	0
}
f0_local14 = {
	"wc_slate_01",
	0
}
f0_local15 = {
	"wc_grisly_01",
	0
}
f0_local16 = {
	"wc_blackout_01",
	0
}
f0_local17 = {
	"wc_glacier_01",
	0
}
f0_local18 = {
	"wc_masterpiece_01",
	0
}
f0_local19 = {
	"wc_don_01",
	0
}
f0_local20 = {
	"wc_mudder_01",
	0
}
f0_local21 = {
	"wc_liquidator_01",
	0
}
f0_local22 = {
	"wc_neanderthal_01",
	0
}
f0_local23 = {
	"wc_reaper_01",
	0
}
f0_local24 = {
	"wc_relic_01",
	0
}
f0_local25 = {
	"wc_tribal_01",
	0
}
f0_local26 = {
	"wc_bludgeon_01",
	0
}
f0_local27 = {
	"wc_foliage_01",
	0
}
f0_local28 = {
	"wc_foliage_02",
	0
}
f0_local29 = {
	"wc_foliage_03",
	0
}
f0_local30 = {
	"wc_foliage_04",
	0
}
f0_local31 = {
	"wc_foliage_05",
	0
}
f0_local32 = {
	"wc_foliage_06",
	0
}
f0_local33 = {
	"wc_foliage_07",
	0
}
f0_local34 = {
	"wc_foliage_reward",
	0
}
f0_local35 = {
	"wc_flow_01",
	0
}
f0_local36 = {
	"wc_flow_02",
	0
}
f0_local37 = {
	"wc_flow_03",
	0
}
f0_local38 = {
	"wc_flow_04",
	0
}
f0_local39 = {
	"wc_flow_05",
	0
}
f0_local40 = {
	"wc_flow_06",
	0
}
f0_local41 = {
	"wc_flow_07",
	0
}
f0_local42 = {
	"wc_flow_reward",
	0
}
f0_local43 = {
	"wc_pixel_01",
	0
}
f0_local44 = {
	"wc_pixel_02",
	0
}
f0_local45 = {
	"wc_pixel_03",
	0
}
f0_local46 = {
	"wc_pixel_04",
	0
}
f0_local47 = {
	"wc_pixel_05",
	0
}
f0_local48 = {
	"wc_pixel_06",
	0
}
f0_local49 = {
	"wc_pixel_07",
	0
}
f0_local50 = {
	"wc_pixel_reward",
	0
}
f0_local51 = {
	"wc_texture_01",
	0
}
f0_local52 = {
	"wc_texture_02",
	0
}
f0_local53 = {
	"wc_texture_03",
	0
}
f0_local54 = {
	"wc_texture_04",
	0
}
f0_local55 = {
	"wc_texture_05",
	0
}
f0_local56 = {
	"wc_texture_06",
	0
}
f0_local6[161] = f0_local7
f0_local6[162] = f0_local8
f0_local6[163] = f0_local9
f0_local6[164] = f0_local10
f0_local6[165] = f0_local11
f0_local6[166] = f0_local12
f0_local6[167] = f0_local13
f0_local6[168] = f0_local14
f0_local6[169] = f0_local15
f0_local6[170] = f0_local16
f0_local6[171] = f0_local17
f0_local6[172] = f0_local18
f0_local6[173] = f0_local19
f0_local6[174] = f0_local20
f0_local6[175] = f0_local21
f0_local6[176] = f0_local22
f0_local6[177] = f0_local23
f0_local6[178] = f0_local24
f0_local6[179] = f0_local25
f0_local6[180] = f0_local26
f0_local6[181] = f0_local27
f0_local6[182] = f0_local28
f0_local6[183] = f0_local29
f0_local6[184] = f0_local30
f0_local6[185] = f0_local31
f0_local6[186] = f0_local32
f0_local6[187] = f0_local33
f0_local6[188] = f0_local34
f0_local6[189] = f0_local35
f0_local6[190] = f0_local36
f0_local6[191] = f0_local37
f0_local6[192] = f0_local38
f0_local6[193] = f0_local39
f0_local6[194] = f0_local40
f0_local6[195] = f0_local41
f0_local6[196] = f0_local42
f0_local6[197] = f0_local43
f0_local6[198] = f0_local44
f0_local6[199] = f0_local45
f0_local6[200] = f0_local46
f0_local6[201] = f0_local47
f0_local6[202] = f0_local48
f0_local6[203] = f0_local49
f0_local6[204] = f0_local50
f0_local6[205] = f0_local51
f0_local6[206] = f0_local52
f0_local6[207] = f0_local53
f0_local6[208] = f0_local54
f0_local6[209] = f0_local55
f0_local6[210] = f0_local56
f0_local7 = {
	"wc_texture_07",
	0
}
f0_local8 = {
	"wc_texture_reward",
	0
}
f0_local9 = {
	"wc_iris_01",
	0
}
f0_local10 = {
	"wc_iris_02",
	0
}
f0_local11 = {
	"wc_iris_03",
	0
}
f0_local12 = {
	"wc_iris_04",
	0
}
f0_local13 = {
	"wc_iris_05",
	0
}
f0_local14 = {
	"wc_iris_06",
	0
}
f0_local15 = {
	"wc_iris_07",
	0
}
f0_local16 = {
	"wc_iris_reward",
	0
}
f0_local17 = {
	"wc_burnt_01",
	0
}
f0_local18 = {
	"wc_burnt_02",
	0
}
f0_local19 = {
	"wc_burnt_03",
	0
}
f0_local20 = {
	"wc_burnt_04",
	0
}
f0_local21 = {
	"wc_burnt_05",
	0
}
f0_local22 = {
	"wc_burnt_06",
	0
}
f0_local23 = {
	"wc_burnt_07",
	0
}
f0_local24 = {
	"wc_burnt_reward",
	0
}
f0_local25 = {
	"wc_summer_01",
	0
}
f0_local26 = {
	"wc_summer_02",
	0
}
f0_local27 = {
	"wc_summer_03",
	0
}
f0_local28 = {
	"wc_summer_04",
	0
}
f0_local29 = {
	"wc_ranger_01",
	0
}
f0_local30 = {
	"wc_ranger_02",
	0
}
f0_local31 = {
	"wc_lynxcq300_01",
	0
}
f0_local32 = {
	"wc_pkpsd9_01",
	0
}
f0_local33 = {
	"wc_br9_01",
	0
}
f0_local34 = {
	"wc_centermass_01",
	0
}
f0_local35 = {
	"wc_elder_01",
	0
}
f0_local36 = {
	"wc_obsidian_01",
	0
}
f0_local37 = {
	"wc_ghillie_01",
	0
}
f0_local38 = {
	"wc_urbanoperator_01",
	0
}
f0_local39 = {
	"wc_firedrake_01",
	0
}
f0_local40 = {
	"wc_specops_01",
	0
}
f0_local41 = {
	"wc_enforce_01",
	0
}
f0_local42 = {
	"wc_barber_01",
	0
}
f0_local43 = {
	"wc_dangerclose_01",
	0
}
f0_local44 = {
	"wc_cosmos_01",
	0
}
f0_local45 = {
	"wc_cosmos_02",
	0
}
f0_local46 = {
	"wc_cosmos_03",
	0
}
f0_local47 = {
	"wc_cosmos_04",
	0
}
f0_local48 = {
	"wc_cosmos_05",
	0
}
f0_local49 = {
	"wc_cosmos_06",
	0
}
f0_local50 = {
	"wc_cosmos_07",
	0
}
f0_local51 = {
	"wc_cosmos_reward",
	0
}
f0_local52 = {
	"wc_sweettooth_01",
	0
}
f0_local53 = {
	"wc_sweettooth_02",
	0
}
f0_local54 = {
	"wc_sweettooth_03",
	0
}
f0_local55 = {
	"wc_sweettooth_04",
	0
}
f0_local56 = {
	"wc_sweettooth_05",
	0
}
f0_local6[193] = f0_local7
f0_local6[194] = f0_local8
f0_local6[195] = f0_local9
f0_local6[196] = f0_local10
f0_local6[197] = f0_local11
f0_local6[198] = f0_local12
f0_local6[199] = f0_local13
f0_local6[200] = f0_local14
f0_local6[201] = f0_local15
f0_local6[202] = f0_local16
f0_local6[203] = f0_local17
f0_local6[204] = f0_local18
f0_local6[205] = f0_local19
f0_local6[206] = f0_local20
f0_local6[207] = f0_local21
f0_local6[208] = f0_local22
f0_local6[209] = f0_local23
f0_local6[210] = f0_local24
f0_local6[211] = f0_local25
f0_local6[212] = f0_local26
f0_local6[213] = f0_local27
f0_local6[214] = f0_local28
f0_local6[215] = f0_local29
f0_local6[216] = f0_local30
f0_local6[217] = f0_local31
f0_local6[218] = f0_local32
f0_local6[219] = f0_local33
f0_local6[220] = f0_local34
f0_local6[221] = f0_local35
f0_local6[222] = f0_local36
f0_local6[223] = f0_local37
f0_local6[224] = f0_local38
f0_local6[225] = f0_local39
f0_local6[226] = f0_local40
f0_local6[227] = f0_local41
f0_local6[228] = f0_local42
f0_local6[229] = f0_local43
f0_local6[230] = f0_local44
f0_local6[231] = f0_local45
f0_local6[232] = f0_local46
f0_local6[233] = f0_local47
f0_local6[234] = f0_local48
f0_local6[235] = f0_local49
f0_local6[236] = f0_local50
f0_local6[237] = f0_local51
f0_local6[238] = f0_local52
f0_local6[239] = f0_local53
f0_local6[240] = f0_local54
f0_local6[241] = f0_local55
f0_local6[242] = f0_local56
f0_local7 = {
	"wc_sweettooth_06",
	0
}
f0_local8 = {
	"wc_sweettooth_07",
	0
}
f0_local9 = {
	"wc_sweettooth_reward",
	0
}
f0_local10 = {
	"wc_tomahawk_01",
	0
}
f0_local11 = {
	"wc_tomahawk_02",
	0
}
f0_local12 = {
	"wc_tomahawk_03",
	0
}
f0_local13 = {
	"wc_tomahawk_04",
	0
}
f0_local14 = {
	"wc_tomahawk_05",
	0
}
f0_local15 = {
	"wc_tomahawk_06",
	0
}
f0_local16 = {
	"wc_tomahawk_07",
	0
}
f0_local17 = {
	"wc_tomahawk_reward",
	0
}
f0_local18 = {
	"wc_super_01",
	0
}
f0_local19 = {
	"wc_super_02",
	0
}
f0_local20 = {
	"wc_super_03",
	0
}
f0_local21 = {
	"wc_super_04",
	0
}
f0_local22 = {
	"wc_super_05",
	0
}
f0_local23 = {
	"wc_super_06",
	0
}
f0_local24 = {
	"wc_super_07",
	0
}
f0_local25 = {
	"wc_super_reward",
	0
}
f0_local6[225] = f0_local7
f0_local6[226] = f0_local8
f0_local6[227] = f0_local9
f0_local6[228] = f0_local10
f0_local6[229] = f0_local11
f0_local6[230] = f0_local12
f0_local6[231] = f0_local13
f0_local6[232] = f0_local14
f0_local6[233] = f0_local15
f0_local6[234] = f0_local16
f0_local6[235] = f0_local17
f0_local6[236] = f0_local18
f0_local6[237] = f0_local19
f0_local6[238] = f0_local20
f0_local6[239] = f0_local21
f0_local6[240] = f0_local22
f0_local6[241] = f0_local23
f0_local6[242] = f0_local24
f0_local6[243] = f0_local25
f0_local7 = "@MENU_CAMO_SHORT_CAPS"
f0_local8 = CoD.Material.LockedIcon
f0_local4[1] = f0_local5
f0_local4[2] = f0_local6
f0_local4[3] = f0_local7
f0_local4[4] = f0_local8
f0_local3[1] = f0_local4
f0_local1[f0_local2] = f0_local3
f0_local1.Secondary = {
	{
		"weapon_pistol",
		{
			{
				"h1_beretta",
				0
			},
			{
				"h1_usp",
				0
			},
			{
				"h1_colt45",
				0
			},
			{
				"h1_deserteagle",
				0
			},
			{
				"h1_deserteagle55",
				0
			},
			{
				"h1_janpst",
				0
			},
			{
				"h1_aprpst",
				0
			},
			{
				"h1_augpst",
				0
			}
		},
		"@MENU_PISTOLS_CAPS",
		CoD.Material.LockedIcon,
		"@LUA_MENU_WEAPTYPE_SINGLE_HANDGUN"
	}
}
f0_local1.Secondary_AttachKit = {
	{
		"attachkit",
		{},
		"",
		CoD.Material.LockedIcon
	}
}
f0_local1.Secondary_FurnitureKit = {
	{
		"furniturekit",
		{},
		"",
		CoD.Material.LockedIcon
	}
}
f0_local2 = "Secondary_Camo"
f0_local3 = {}
f0_local4 = {}
f0_local5 = "camo"
f0_local6 = {
	{
		"none",
		0
	},
	{
		"desert",
		0
	},
	{
		"woodland",
		0
	},
	{
		"digital",
		0
	},
	{
		"bluetiger",
		0
	},
	{
		"redtiger",
		0
	},
	{
		"redhex",
		0
	},
	{
		"odgreen",
		0
	},
	{
		"fde",
		0
	},
	{
		"white",
		0
	},
	{
		"nickel",
		0
	},
	{
		"neontiger",
		0
	},
	{
		"gold",
		0
	},
	{
		"diamond",
		0
	},
	{
		"darkmatter",
		0
	},
	{
		"camo016",
		0
	},
	{
		"camo017",
		0
	},
	{
		"camo018",
		0
	},
	{
		"camo019",
		0
	},
	{
		"camo020",
		0
	},
	{
		"camo021",
		0
	},
	{
		"camo022",
		0
	},
	{
		"camo023",
		0
	},
	{
		"camo024",
		0
	},
	{
		"camo025",
		0
	},
	{
		"camo026",
		0
	},
	{
		"camo027",
		0
	},
	{
		"camo028",
		0
	},
	{
		"camo029",
		0
	},
	{
		"camo030",
		0
	},
	{
		"camo031",
		0
	},
	{
		"camo032",
		0
	},
	{
		"camo033",
		0
	},
	{
		"camo034",
		0
	},
	{
		"camo035",
		0
	},
	{
		"camo036",
		0
	},
	{
		"camo037",
		0
	},
	{
		"camo038",
		0
	},
	{
		"camo039",
		0
	},
	{
		"camo040",
		0
	},
	{
		"camo041",
		0
	},
	{
		"camo042",
		0
	},
	{
		"camo043",
		0
	},
	{
		"camo044",
		0
	},
	{
		"camo045",
		0
	},
	{
		"camo046",
		0
	},
	{
		"camo047",
		0
	},
	{
		"camo048",
		0
	},
	{
		"camo049",
		0
	},
	{
		"camo050",
		0
	}
}
f0_local7 = {
	"camo051",
	0
}
f0_local8 = {
	"camo052",
	0
}
f0_local9 = {
	"camo053",
	0
}
f0_local10 = {
	"camo054",
	0
}
f0_local11 = {
	"camo055",
	0
}
f0_local12 = {
	"camo056",
	0
}
f0_local13 = {
	"camo057",
	0
}
f0_local14 = {
	"camo058",
	0
}
f0_local15 = {
	"camo059",
	0
}
f0_local16 = {
	"camo060",
	0
}
f0_local17 = {
	"camo061",
	0
}
f0_local18 = {
	"camo062",
	0
}
f0_local19 = {
	"camo063",
	0
}
f0_local20 = {
	"camo064",
	0
}
f0_local21 = {
	"camo065",
	0
}
f0_local22 = {
	"camo066",
	0
}
f0_local23 = {
	"camo067",
	0
}
f0_local24 = {
	"camo068",
	0
}
f0_local25 = {
	"camo069",
	0
}
f0_local26 = {
	"camo070",
	0
}
f0_local27 = {
	"camo071",
	0
}
f0_local28 = {
	"camo072",
	0
}
f0_local29 = {
	"camo073",
	0
}
f0_local30 = {
	"camo074",
	0
}
f0_local31 = {
	"camo075",
	0
}
f0_local32 = {
	"camo076",
	0
}
f0_local33 = {
	"camo077",
	0
}
f0_local34 = {
	"camo078",
	0
}
f0_local35 = {
	"camo079",
	0
}
f0_local36 = {
	"camo080",
	0
}
f0_local37 = {
	"camo081",
	0
}
f0_local38 = {
	"camo082",
	0
}
f0_local39 = {
	"camo083",
	0
}
f0_local40 = {
	"camo084",
	0
}
f0_local41 = {
	"camo085",
	0
}
f0_local42 = {
	"camo086",
	0
}
f0_local43 = {
	"camo087",
	0
}
f0_local44 = {
	"camo088",
	0
}
f0_local45 = {
	"camo089",
	0
}
f0_local46 = {
	"wcamo_code",
	0
}
f0_local47 = {
	"wc_aftermath_01",
	0
}
f0_local48 = {
	"wc_aftermath_02",
	0
}
f0_local49 = {
	"wc_aftermath_03",
	0
}
f0_local50 = {
	"wc_aftermath_04",
	0
}
f0_local51 = {
	"wc_aftermath_05",
	0
}
f0_local52 = {
	"wc_aftermath_06",
	0
}
f0_local53 = {
	"wc_aftermath_07",
	0
}
f0_local54 = {
	"wc_aftermath_reward",
	0
}
f0_local55 = {
	"wc_battlescarred_01",
	0
}
f0_local56 = {
	"wc_czar_01",
	0
}
f0_local6[33] = f0_local7
f0_local6[34] = f0_local8
f0_local6[35] = f0_local9
f0_local6[36] = f0_local10
f0_local6[37] = f0_local11
f0_local6[38] = f0_local12
f0_local6[39] = f0_local13
f0_local6[40] = f0_local14
f0_local6[41] = f0_local15
f0_local6[42] = f0_local16
f0_local6[43] = f0_local17
f0_local6[44] = f0_local18
f0_local6[45] = f0_local19
f0_local6[46] = f0_local20
f0_local6[47] = f0_local21
f0_local6[48] = f0_local22
f0_local6[49] = f0_local23
f0_local6[50] = f0_local24
f0_local6[51] = f0_local25
f0_local6[52] = f0_local26
f0_local6[53] = f0_local27
f0_local6[54] = f0_local28
f0_local6[55] = f0_local29
f0_local6[56] = f0_local30
f0_local6[57] = f0_local31
f0_local6[58] = f0_local32
f0_local6[59] = f0_local33
f0_local6[60] = f0_local34
f0_local6[61] = f0_local35
f0_local6[62] = f0_local36
f0_local6[63] = f0_local37
f0_local6[64] = f0_local38
f0_local6[65] = f0_local39
f0_local6[66] = f0_local40
f0_local6[67] = f0_local41
f0_local6[68] = f0_local42
f0_local6[69] = f0_local43
f0_local6[70] = f0_local44
f0_local6[71] = f0_local45
f0_local6[72] = f0_local46
f0_local6[73] = f0_local47
f0_local6[74] = f0_local48
f0_local6[75] = f0_local49
f0_local6[76] = f0_local50
f0_local6[77] = f0_local51
f0_local6[78] = f0_local52
f0_local6[79] = f0_local53
f0_local6[80] = f0_local54
f0_local6[81] = f0_local55
f0_local6[82] = f0_local56
f0_local7 = {
	"wc_diablo_01",
	0
}
f0_local8 = {
	"wc_diablo_02",
	0
}
f0_local9 = {
	"wc_diablo_03",
	0
}
f0_local10 = {
	"wc_diablo_04",
	0
}
f0_local11 = {
	"wc_diablo_05",
	0
}
f0_local12 = {
	"wc_diablo_06",
	0
}
f0_local13 = {
	"wc_diablo_07",
	0
}
f0_local14 = {
	"wc_diablo_reward",
	0
}
f0_local15 = {
	"wc_funhouse_01",
	0
}
f0_local16 = {
	"wc_funhouse_02",
	0
}
f0_local17 = {
	"wc_funhouse_03",
	0
}
f0_local18 = {
	"wc_funhouse_04",
	0
}
f0_local19 = {
	"wc_funhouse_05",
	0
}
f0_local20 = {
	"wc_funhouse_06",
	0
}
f0_local21 = {
	"wc_funhouse_07",
	0
}
f0_local22 = {
	"wc_funhouse_reward",
	0
}
f0_local23 = {
	"wc_gladiator_01",
	0
}
f0_local24 = {
	"wc_hatchetman_01",
	0
}
f0_local25 = {
	"wc_hunter_01",
	0
}
f0_local26 = {
	"wc_hunter_02",
	0
}
f0_local27 = {
	"wc_hunter_03",
	0
}
f0_local28 = {
	"wc_hunter_04",
	0
}
f0_local29 = {
	"wc_hunter_05",
	0
}
f0_local30 = {
	"wc_hunter_06",
	0
}
f0_local31 = {
	"wc_hunter_07",
	0
}
f0_local32 = {
	"wc_hunter_reward",
	0
}
f0_local33 = {
	"wc_huntsman_01",
	0
}
f0_local34 = {
	"wc_kamchatka12_01",
	0
}
f0_local35 = {
	"wc_lawman_01",
	0
}
f0_local36 = {
	"wc_magnum_01",
	0
}
f0_local37 = {
	"wc_xmlar_01",
	0
}
f0_local38 = {
	"wc_arcticwolf_01",
	0
}
f0_local39 = {
	"wc_amoeba_01",
	0
}
f0_local40 = {
	"wc_amoeba_02",
	0
}
f0_local41 = {
	"wc_amoeba_03",
	0
}
f0_local42 = {
	"wc_amoeba_04",
	0
}
f0_local43 = {
	"wc_amoeba_05",
	0
}
f0_local44 = {
	"wc_amoeba_06",
	0
}
f0_local45 = {
	"wc_amoeba_07",
	0
}
f0_local46 = {
	"wc_amoeba_reward",
	0
}
f0_local47 = {
	"wc_avalanche_01",
	0
}
f0_local48 = {
	"wc_boss_01",
	0
}
f0_local49 = {
	"wc_chalk_01",
	0
}
f0_local50 = {
	"wc_challenger_01",
	0
}
f0_local51 = {
	"wc_decay_01",
	0
}
f0_local52 = {
	"wc_decay_02",
	0
}
f0_local53 = {
	"wc_decay_03",
	0
}
f0_local54 = {
	"wc_decay_04",
	0
}
f0_local55 = {
	"wc_decay_05",
	0
}
f0_local56 = {
	"wc_decay_06",
	0
}
f0_local6[65] = f0_local7
f0_local6[66] = f0_local8
f0_local6[67] = f0_local9
f0_local6[68] = f0_local10
f0_local6[69] = f0_local11
f0_local6[70] = f0_local12
f0_local6[71] = f0_local13
f0_local6[72] = f0_local14
f0_local6[73] = f0_local15
f0_local6[74] = f0_local16
f0_local6[75] = f0_local17
f0_local6[76] = f0_local18
f0_local6[77] = f0_local19
f0_local6[78] = f0_local20
f0_local6[79] = f0_local21
f0_local6[80] = f0_local22
f0_local6[81] = f0_local23
f0_local6[82] = f0_local24
f0_local6[83] = f0_local25
f0_local6[84] = f0_local26
f0_local6[85] = f0_local27
f0_local6[86] = f0_local28
f0_local6[87] = f0_local29
f0_local6[88] = f0_local30
f0_local6[89] = f0_local31
f0_local6[90] = f0_local32
f0_local6[91] = f0_local33
f0_local6[92] = f0_local34
f0_local6[93] = f0_local35
f0_local6[94] = f0_local36
f0_local6[95] = f0_local37
f0_local6[96] = f0_local38
f0_local6[97] = f0_local39
f0_local6[98] = f0_local40
f0_local6[99] = f0_local41
f0_local6[100] = f0_local42
f0_local6[101] = f0_local43
f0_local6[102] = f0_local44
f0_local6[103] = f0_local45
f0_local6[104] = f0_local46
f0_local6[105] = f0_local47
f0_local6[106] = f0_local48
f0_local6[107] = f0_local49
f0_local6[108] = f0_local50
f0_local6[109] = f0_local51
f0_local6[110] = f0_local52
f0_local6[111] = f0_local53
f0_local6[112] = f0_local54
f0_local6[113] = f0_local55
f0_local6[114] = f0_local56
f0_local7 = {
	"wc_decay_07",
	0
}
f0_local8 = {
	"wc_decay_reward",
	0
}
f0_local9 = {
	"wc_dmr25s_01",
	0
}
f0_local10 = {
	"wc_etch_01",
	0
}
f0_local11 = {
	"wc_etch_02",
	0
}
f0_local12 = {
	"wc_etch_03",
	0
}
f0_local13 = {
	"wc_etch_04",
	0
}
f0_local14 = {
	"wc_etch_05",
	0
}
f0_local15 = {
	"wc_etch_06",
	0
}
f0_local16 = {
	"wc_etch_07",
	0
}
f0_local17 = {
	"wc_etch_reward",
	0
}
f0_local18 = {
	"wc_exlibris_01",
	0
}
f0_local19 = {
	"wc_exlibris_02",
	0
}
f0_local20 = {
	"wc_exlibris_03",
	0
}
f0_local21 = {
	"wc_exlibris_04",
	0
}
f0_local22 = {
	"wc_exlibris_05",
	0
}
f0_local23 = {
	"wc_exlibris_06",
	0
}
f0_local24 = {
	"wc_exlibris_07",
	0
}
f0_local25 = {
	"wc_exlibris_reward",
	0
}
f0_local26 = {
	"wc_frag_01",
	0
}
f0_local27 = {
	"wc_graves_01",
	0
}
f0_local28 = {
	"wc_killshot_01",
	0
}
f0_local29 = {
	"wc_kingpin_01",
	0
}
f0_local30 = {
	"wc_mac10_01",
	0
}
f0_local31 = {
	"wc_mastercraft_01",
	0
}
f0_local32 = {
	"wc_mechanic_01",
	0
}
f0_local33 = {
	"wc_minerva_01",
	0
}
f0_local34 = {
	"wc_minerva_02",
	0
}
f0_local35 = {
	"wc_minerva_03",
	0
}
f0_local36 = {
	"wc_minerva_04",
	0
}
f0_local37 = {
	"wc_minerva_05",
	0
}
f0_local38 = {
	"wc_minerva_06",
	0
}
f0_local39 = {
	"wc_minerva_07",
	0
}
f0_local40 = {
	"wc_minerva_reward",
	0
}
f0_local41 = {
	"wc_noobtuber_01",
	0
}
f0_local42 = {
	"wc_pigpen_01",
	0
}
f0_local43 = {
	"wc_prokolot_01",
	0
}
f0_local44 = {
	"wc_pkm_01",
	0
}
f0_local45 = {
	"wc_reflex_01",
	0
}
f0_local46 = {
	"wc_reptile_01",
	0
}
f0_local47 = {
	"wc_reptile_02",
	0
}
f0_local48 = {
	"wc_reptile_03",
	0
}
f0_local49 = {
	"wc_reptile_04",
	0
}
f0_local50 = {
	"wc_reptile_05",
	0
}
f0_local51 = {
	"wc_reptile_06",
	0
}
f0_local52 = {
	"wc_reptile_07",
	0
}
f0_local53 = {
	"wc_reptile_reward",
	0
}
f0_local54 = {
	"wc_samurai_01",
	0
}
f0_local55 = {
	"wc_titanium_01",
	0
}
f0_local56 = {
	"wc_ultraviolet_01",
	0
}
f0_local6[97] = f0_local7
f0_local6[98] = f0_local8
f0_local6[99] = f0_local9
f0_local6[100] = f0_local10
f0_local6[101] = f0_local11
f0_local6[102] = f0_local12
f0_local6[103] = f0_local13
f0_local6[104] = f0_local14
f0_local6[105] = f0_local15
f0_local6[106] = f0_local16
f0_local6[107] = f0_local17
f0_local6[108] = f0_local18
f0_local6[109] = f0_local19
f0_local6[110] = f0_local20
f0_local6[111] = f0_local21
f0_local6[112] = f0_local22
f0_local6[113] = f0_local23
f0_local6[114] = f0_local24
f0_local6[115] = f0_local25
f0_local6[116] = f0_local26
f0_local6[117] = f0_local27
f0_local6[118] = f0_local28
f0_local6[119] = f0_local29
f0_local6[120] = f0_local30
f0_local6[121] = f0_local31
f0_local6[122] = f0_local32
f0_local6[123] = f0_local33
f0_local6[124] = f0_local34
f0_local6[125] = f0_local35
f0_local6[126] = f0_local36
f0_local6[127] = f0_local37
f0_local6[128] = f0_local38
f0_local6[129] = f0_local39
f0_local6[130] = f0_local40
f0_local6[131] = f0_local41
f0_local6[132] = f0_local42
f0_local6[133] = f0_local43
f0_local6[134] = f0_local44
f0_local6[135] = f0_local45
f0_local6[136] = f0_local46
f0_local6[137] = f0_local47
f0_local6[138] = f0_local48
f0_local6[139] = f0_local49
f0_local6[140] = f0_local50
f0_local6[141] = f0_local51
f0_local6[142] = f0_local52
f0_local6[143] = f0_local53
f0_local6[144] = f0_local54
f0_local6[145] = f0_local55
f0_local6[146] = f0_local56
f0_local7 = {
	"wc_venom_01",
	0
}
f0_local8 = {
	"wc_wartorn_01",
	0
}
f0_local9 = {
	"wc_leprechaun_01",
	0
}
f0_local10 = {
	"wc_stpatty_01",
	0
}
f0_local11 = {
	"wc_stpatty_02",
	0
}
f0_local12 = {
	"wc_highnoon_01",
	0
}
f0_local13 = {
	"wc_phalanx_01",
	0
}
f0_local14 = {
	"wc_urbanwarfare_01",
	0
}
f0_local15 = {
	"wc_fieldtested_01",
	0
}
f0_local16 = {
	"wc_kingfish_01",
	0
}
f0_local17 = {
	"wc_tacticalfighter_01",
	0
}
f0_local18 = {
	"wc_battletested_01",
	0
}
f0_local19 = {
	"wc_diabolical_01",
	0
}
f0_local20 = {
	"wc_caveman_01",
	0
}
f0_local21 = {
	"wc_sawtooth_01",
	0
}
f0_local22 = {
	"wc_bos14_01",
	0
}
f0_local23 = {
	"wc_fang45_01",
	0
}
f0_local24 = {
	"wc_hightech_01",
	0
}
f0_local25 = {
	"wc_hightech_02",
	0
}
f0_local26 = {
	"wc_hightech_03",
	0
}
f0_local27 = {
	"wc_hightech_04",
	0
}
f0_local28 = {
	"wc_hightech_05",
	0
}
f0_local29 = {
	"wc_hightech_06",
	0
}
f0_local30 = {
	"wc_hightech_07",
	0
}
f0_local31 = {
	"wc_hightech_reward",
	0
}
f0_local32 = {
	"wc_rebel_01",
	0
}
f0_local33 = {
	"wc_rebel_02",
	0
}
f0_local34 = {
	"wc_rebel_03",
	0
}
f0_local35 = {
	"wc_rebel_04",
	0
}
f0_local36 = {
	"wc_rebel_05",
	0
}
f0_local37 = {
	"wc_rebel_06",
	0
}
f0_local38 = {
	"wc_rebel_07",
	0
}
f0_local39 = {
	"wc_rebel_reward",
	0
}
f0_local40 = {
	"wc_geist_01",
	0
}
f0_local41 = {
	"wc_geist_02",
	0
}
f0_local42 = {
	"wc_geist_03",
	0
}
f0_local43 = {
	"wc_geist_04",
	0
}
f0_local44 = {
	"wc_geist_05",
	0
}
f0_local45 = {
	"wc_geist_06",
	0
}
f0_local46 = {
	"wc_geist_07",
	0
}
f0_local47 = {
	"wc_geist_reward",
	0
}
f0_local48 = {
	"wc_operator_01",
	0
}
f0_local49 = {
	"wc_operator_02",
	0
}
f0_local50 = {
	"wc_operator_03",
	0
}
f0_local51 = {
	"wc_operator_04",
	0
}
f0_local52 = {
	"wc_operator_05",
	0
}
f0_local53 = {
	"wc_operator_06",
	0
}
f0_local54 = {
	"wc_operator_07",
	0
}
f0_local55 = {
	"wc_operator_reward",
	0
}
f0_local56 = {
	"wc_summertime_01",
	0
}
f0_local6[129] = f0_local7
f0_local6[130] = f0_local8
f0_local6[131] = f0_local9
f0_local6[132] = f0_local10
f0_local6[133] = f0_local11
f0_local6[134] = f0_local12
f0_local6[135] = f0_local13
f0_local6[136] = f0_local14
f0_local6[137] = f0_local15
f0_local6[138] = f0_local16
f0_local6[139] = f0_local17
f0_local6[140] = f0_local18
f0_local6[141] = f0_local19
f0_local6[142] = f0_local20
f0_local6[143] = f0_local21
f0_local6[144] = f0_local22
f0_local6[145] = f0_local23
f0_local6[146] = f0_local24
f0_local6[147] = f0_local25
f0_local6[148] = f0_local26
f0_local6[149] = f0_local27
f0_local6[150] = f0_local28
f0_local6[151] = f0_local29
f0_local6[152] = f0_local30
f0_local6[153] = f0_local31
f0_local6[154] = f0_local32
f0_local6[155] = f0_local33
f0_local6[156] = f0_local34
f0_local6[157] = f0_local35
f0_local6[158] = f0_local36
f0_local6[159] = f0_local37
f0_local6[160] = f0_local38
f0_local6[161] = f0_local39
f0_local6[162] = f0_local40
f0_local6[163] = f0_local41
f0_local6[164] = f0_local42
f0_local6[165] = f0_local43
f0_local6[166] = f0_local44
f0_local6[167] = f0_local45
f0_local6[168] = f0_local46
f0_local6[169] = f0_local47
f0_local6[170] = f0_local48
f0_local6[171] = f0_local49
f0_local6[172] = f0_local50
f0_local6[173] = f0_local51
f0_local6[174] = f0_local52
f0_local6[175] = f0_local53
f0_local6[176] = f0_local54
f0_local6[177] = f0_local55
f0_local6[178] = f0_local56
f0_local7 = {
	"wc_nauticus_01",
	0
}
f0_local8 = {
	"wc_celebration_01",
	0
}
f0_local9 = {
	"wc_pyrotechnic_01",
	0
}
f0_local10 = {
	"wc_stac330_01",
	0
}
f0_local11 = {
	"wc_beredmk8_01",
	0
}
f0_local12 = {
	"wc_wolfen_01",
	0
}
f0_local13 = {
	"wc_warscarred_01",
	0
}
f0_local14 = {
	"wc_slate_01",
	0
}
f0_local15 = {
	"wc_grisly_01",
	0
}
f0_local16 = {
	"wc_blackout_01",
	0
}
f0_local17 = {
	"wc_glacier_01",
	0
}
f0_local18 = {
	"wc_masterpiece_01",
	0
}
f0_local19 = {
	"wc_don_01",
	0
}
f0_local20 = {
	"wc_mudder_01",
	0
}
f0_local21 = {
	"wc_liquidator_01",
	0
}
f0_local22 = {
	"wc_neanderthal_01",
	0
}
f0_local23 = {
	"wc_reaper_01",
	0
}
f0_local24 = {
	"wc_relic_01",
	0
}
f0_local25 = {
	"wc_tribal_01",
	0
}
f0_local26 = {
	"wc_bludgeon_01",
	0
}
f0_local27 = {
	"wc_foliage_01",
	0
}
f0_local28 = {
	"wc_foliage_02",
	0
}
f0_local29 = {
	"wc_foliage_03",
	0
}
f0_local30 = {
	"wc_foliage_04",
	0
}
f0_local31 = {
	"wc_foliage_05",
	0
}
f0_local32 = {
	"wc_foliage_06",
	0
}
f0_local33 = {
	"wc_foliage_07",
	0
}
f0_local34 = {
	"wc_foliage_reward",
	0
}
f0_local35 = {
	"wc_flow_01",
	0
}
f0_local36 = {
	"wc_flow_02",
	0
}
f0_local37 = {
	"wc_flow_03",
	0
}
f0_local38 = {
	"wc_flow_04",
	0
}
f0_local39 = {
	"wc_flow_05",
	0
}
f0_local40 = {
	"wc_flow_06",
	0
}
f0_local41 = {
	"wc_flow_07",
	0
}
f0_local42 = {
	"wc_flow_reward",
	0
}
f0_local43 = {
	"wc_pixel_01",
	0
}
f0_local44 = {
	"wc_pixel_02",
	0
}
f0_local45 = {
	"wc_pixel_03",
	0
}
f0_local46 = {
	"wc_pixel_04",
	0
}
f0_local47 = {
	"wc_pixel_05",
	0
}
f0_local48 = {
	"wc_pixel_06",
	0
}
f0_local49 = {
	"wc_pixel_07",
	0
}
f0_local50 = {
	"wc_pixel_reward",
	0
}
f0_local51 = {
	"wc_texture_01",
	0
}
f0_local52 = {
	"wc_texture_02",
	0
}
f0_local53 = {
	"wc_texture_03",
	0
}
f0_local54 = {
	"wc_texture_04",
	0
}
f0_local55 = {
	"wc_texture_05",
	0
}
f0_local56 = {
	"wc_texture_06",
	0
}
f0_local6[161] = f0_local7
f0_local6[162] = f0_local8
f0_local6[163] = f0_local9
f0_local6[164] = f0_local10
f0_local6[165] = f0_local11
f0_local6[166] = f0_local12
f0_local6[167] = f0_local13
f0_local6[168] = f0_local14
f0_local6[169] = f0_local15
f0_local6[170] = f0_local16
f0_local6[171] = f0_local17
f0_local6[172] = f0_local18
f0_local6[173] = f0_local19
f0_local6[174] = f0_local20
f0_local6[175] = f0_local21
f0_local6[176] = f0_local22
f0_local6[177] = f0_local23
f0_local6[178] = f0_local24
f0_local6[179] = f0_local25
f0_local6[180] = f0_local26
f0_local6[181] = f0_local27
f0_local6[182] = f0_local28
f0_local6[183] = f0_local29
f0_local6[184] = f0_local30
f0_local6[185] = f0_local31
f0_local6[186] = f0_local32
f0_local6[187] = f0_local33
f0_local6[188] = f0_local34
f0_local6[189] = f0_local35
f0_local6[190] = f0_local36
f0_local6[191] = f0_local37
f0_local6[192] = f0_local38
f0_local6[193] = f0_local39
f0_local6[194] = f0_local40
f0_local6[195] = f0_local41
f0_local6[196] = f0_local42
f0_local6[197] = f0_local43
f0_local6[198] = f0_local44
f0_local6[199] = f0_local45
f0_local6[200] = f0_local46
f0_local6[201] = f0_local47
f0_local6[202] = f0_local48
f0_local6[203] = f0_local49
f0_local6[204] = f0_local50
f0_local6[205] = f0_local51
f0_local6[206] = f0_local52
f0_local6[207] = f0_local53
f0_local6[208] = f0_local54
f0_local6[209] = f0_local55
f0_local6[210] = f0_local56
f0_local7 = {
	"wc_texture_07",
	0
}
f0_local8 = {
	"wc_texture_reward",
	0
}
f0_local9 = {
	"wc_iris_01",
	0
}
f0_local10 = {
	"wc_iris_02",
	0
}
f0_local11 = {
	"wc_iris_03",
	0
}
f0_local12 = {
	"wc_iris_04",
	0
}
f0_local13 = {
	"wc_iris_05",
	0
}
f0_local14 = {
	"wc_iris_06",
	0
}
f0_local15 = {
	"wc_iris_07",
	0
}
f0_local16 = {
	"wc_iris_reward",
	0
}
f0_local17 = {
	"wc_burnt_01",
	0
}
f0_local18 = {
	"wc_burnt_02",
	0
}
f0_local19 = {
	"wc_burnt_03",
	0
}
f0_local20 = {
	"wc_burnt_04",
	0
}
f0_local21 = {
	"wc_burnt_05",
	0
}
f0_local22 = {
	"wc_burnt_06",
	0
}
f0_local23 = {
	"wc_burnt_07",
	0
}
f0_local24 = {
	"wc_burnt_reward",
	0
}
f0_local25 = {
	"wc_summer_01",
	0
}
f0_local26 = {
	"wc_summer_02",
	0
}
f0_local27 = {
	"wc_summer_03",
	0
}
f0_local28 = {
	"wc_summer_04",
	0
}
f0_local29 = {
	"wc_ranger_01",
	0
}
f0_local30 = {
	"wc_ranger_02",
	0
}
f0_local31 = {
	"wc_lynxcq300_01",
	0
}
f0_local32 = {
	"wc_pkpsd9_01",
	0
}
f0_local33 = {
	"wc_br9_01",
	0
}
f0_local34 = {
	"wc_centermass_01",
	0
}
f0_local35 = {
	"wc_elder_01",
	0
}
f0_local36 = {
	"wc_obsidian_01",
	0
}
f0_local37 = {
	"wc_ghillie_01",
	0
}
f0_local38 = {
	"wc_urbanoperator_01",
	0
}
f0_local39 = {
	"wc_firedrake_01",
	0
}
f0_local40 = {
	"wc_specops_01",
	0
}
f0_local41 = {
	"wc_enforce_01",
	0
}
f0_local42 = {
	"wc_barber_01",
	0
}
f0_local43 = {
	"wc_dangerclose_01",
	0
}
f0_local44 = {
	"wc_cosmos_01",
	0
}
f0_local45 = {
	"wc_cosmos_02",
	0
}
f0_local46 = {
	"wc_cosmos_03",
	0
}
f0_local47 = {
	"wc_cosmos_04",
	0
}
f0_local48 = {
	"wc_cosmos_05",
	0
}
f0_local49 = {
	"wc_cosmos_06",
	0
}
f0_local50 = {
	"wc_cosmos_07",
	0
}
f0_local51 = {
	"wc_cosmos_reward",
	0
}
f0_local52 = {
	"wc_sweettooth_01",
	0
}
f0_local53 = {
	"wc_sweettooth_02",
	0
}
f0_local54 = {
	"wc_sweettooth_03",
	0
}
f0_local55 = {
	"wc_sweettooth_04",
	0
}
f0_local56 = {
	"wc_sweettooth_05",
	0
}
f0_local6[193] = f0_local7
f0_local6[194] = f0_local8
f0_local6[195] = f0_local9
f0_local6[196] = f0_local10
f0_local6[197] = f0_local11
f0_local6[198] = f0_local12
f0_local6[199] = f0_local13
f0_local6[200] = f0_local14
f0_local6[201] = f0_local15
f0_local6[202] = f0_local16
f0_local6[203] = f0_local17
f0_local6[204] = f0_local18
f0_local6[205] = f0_local19
f0_local6[206] = f0_local20
f0_local6[207] = f0_local21
f0_local6[208] = f0_local22
f0_local6[209] = f0_local23
f0_local6[210] = f0_local24
f0_local6[211] = f0_local25
f0_local6[212] = f0_local26
f0_local6[213] = f0_local27
f0_local6[214] = f0_local28
f0_local6[215] = f0_local29
f0_local6[216] = f0_local30
f0_local6[217] = f0_local31
f0_local6[218] = f0_local32
f0_local6[219] = f0_local33
f0_local6[220] = f0_local34
f0_local6[221] = f0_local35
f0_local6[222] = f0_local36
f0_local6[223] = f0_local37
f0_local6[224] = f0_local38
f0_local6[225] = f0_local39
f0_local6[226] = f0_local40
f0_local6[227] = f0_local41
f0_local6[228] = f0_local42
f0_local6[229] = f0_local43
f0_local6[230] = f0_local44
f0_local6[231] = f0_local45
f0_local6[232] = f0_local46
f0_local6[233] = f0_local47
f0_local6[234] = f0_local48
f0_local6[235] = f0_local49
f0_local6[236] = f0_local50
f0_local6[237] = f0_local51
f0_local6[238] = f0_local52
f0_local6[239] = f0_local53
f0_local6[240] = f0_local54
f0_local6[241] = f0_local55
f0_local6[242] = f0_local56
f0_local7 = {
	"wc_sweettooth_06",
	0
}
f0_local8 = {
	"wc_sweettooth_07",
	0
}
f0_local9 = {
	"wc_sweettooth_reward",
	0
}
f0_local10 = {
	"wc_tomahawk_01",
	0
}
f0_local11 = {
	"wc_tomahawk_02",
	0
}
f0_local12 = {
	"wc_tomahawk_03",
	0
}
f0_local13 = {
	"wc_tomahawk_04",
	0
}
f0_local14 = {
	"wc_tomahawk_05",
	0
}
f0_local15 = {
	"wc_tomahawk_06",
	0
}
f0_local16 = {
	"wc_tomahawk_07",
	0
}
f0_local17 = {
	"wc_tomahawk_reward",
	0
}
f0_local18 = {
	"wc_super_01",
	0
}
f0_local19 = {
	"wc_super_02",
	0
}
f0_local20 = {
	"wc_super_03",
	0
}
f0_local21 = {
	"wc_super_04",
	0
}
f0_local22 = {
	"wc_super_05",
	0
}
f0_local23 = {
	"wc_super_06",
	0
}
f0_local24 = {
	"wc_super_07",
	0
}
f0_local25 = {
	"wc_super_reward",
	0
}
f0_local6[225] = f0_local7
f0_local6[226] = f0_local8
f0_local6[227] = f0_local9
f0_local6[228] = f0_local10
f0_local6[229] = f0_local11
f0_local6[230] = f0_local12
f0_local6[231] = f0_local13
f0_local6[232] = f0_local14
f0_local6[233] = f0_local15
f0_local6[234] = f0_local16
f0_local6[235] = f0_local17
f0_local6[236] = f0_local18
f0_local6[237] = f0_local19
f0_local6[238] = f0_local20
f0_local6[239] = f0_local21
f0_local6[240] = f0_local22
f0_local6[241] = f0_local23
f0_local6[242] = f0_local24
f0_local6[243] = f0_local25
f0_local7 = "@MENU_CAMO_SHORT_CAPS"
f0_local8 = CoD.Material.LockedIcon
f0_local4[1] = f0_local5
f0_local4[2] = f0_local6
f0_local4[3] = f0_local7
f0_local4[4] = f0_local8
f0_local3[1] = f0_local4
f0_local1[f0_local2] = f0_local3
f0_local1.Melee = {
	{
		"weapon_melee",
		{
			{
				"none",
				0
			},
			{
				"h1_meleeshovel",
				0
			},
			{
				"h1_meleepaddle",
				0
			},
			{
				"h1_meleebottle",
				0
			},
			{
				"h1_meleeblade",
				0
			},
			{
				"h1_meleeicepick",
				0
			},
			{
				"h1_meleebayonet",
				0
			},
			{
				"h1_meleegladius",
				0
			},
			{
				"h1_meleesickle",
				0
			},
			{
				"h1_meleehatchet",
				0
			},
			{
				"h1_meleefeb1",
				0
			},
			{
				"h1_meleefeb2",
				0
			},
			{
				"h1_meleefeb3",
				0
			},
			{
				"h1_meleefeb4",
				0
			},
			{
				"h1_meleefeb5",
				0
			},
			{
				"h1_meleeapr1",
				0
			},
			{
				"h1_meleeapr2",
				0
			},
			{
				"h1_meleeapr3",
				0
			},
			{
				"h1_meleeapr4",
				0
			},
			{
				"h1_meleejun1",
				0
			},
			{
				"h1_meleejun2",
				0
			},
			{
				"h1_meleejun3",
				0
			},
			{
				"h1_meleejun4",
				0
			},
			{
				"h1_meleejun5",
				0
			},
			{
				"h1_meleejun6",
				0
			},
			{
				"h1_meleeaug1",
				0
			},
			{
				"h1_meleeaug2",
				0
			},
			{
				"h1_meleeaug3",
				0
			},
			{
				"h1_meleeaug4",
				0
			}
		},
		"@MENU_MELEE_CAPS",
		CoD.Material.LockedIcon,
		"@MP_MELEE"
	}
}
f0_local1.Lethal = {
	{
		"equipment_lethal",
		{
			{
				"h1_fraggrenade_mp",
				0
			}
		},
		"",
		CoD.Material.LockedIcon
	}
}
f0_local1.Tactical = {
	{
		"equipment_tactical",
		{
			{
				"h1_flashgrenade_mp",
				0
			},
			{
				"h1_concussiongrenade_mp",
				0
			},
			{
				"h1_smokegrenade_mp",
				0
			}
		},
		"",
		CoD.Material.LockedIcon
	}
}
f0_local1.Perk_Slot1 = {
	{
		"perk",
		{
			{
				"c4_mp",
				0
			},
			{
				"rpg_mp",
				0
			},
			{
				"specialty_specialgrenade",
				0
			},
			{
				"specialty_detectexplosive",
				0
			},
			{
				"claymore_mp",
				0
			},
			{
				"specialty_extraammo",
				0
			},
			{
				"specialty_fraggrenade",
				0
			}
		},
		"",
		CoD.Material.LockedIcon
	}
}
f0_local1.Perk_Slot2 = {
	{
		"perk",
		{
			{
				"specialty_bulletdamage",
				0
			},
			{
				"specialty_armorvest",
				0
			},
			{
				"specialty_explosivedamage",
				0
			},
			{
				"specialty_radarimmune",
				0
			},
			{
				"specialty_fastreload",
				0
			},
			{
				"specialty_rof",
				0
			},
			{
				"specialty_twoprimaries",
				0
			}
		},
		"",
		CoD.Material.LockedIcon
	}
}
f0_local1.Perk_Slot3 = {
	{
		"perk",
		{
			{
				"specialty_longersprint",
				0
			},
			{
				"specialty_bulletaccuracy",
				0
			},
			{
				"specialty_bulletpenetration",
				0
			},
			{
				"specialty_pistoldeath",
				0
			},
			{
				"specialty_grenadepulldeath",
				0
			},
			{
				"specialty_holdbreath",
				0
			},
			{
				"specialty_parabolic",
				0
			},
			{
				"specialty_quieter",
				0
			}
		},
		"",
		CoD.Material.LockedIcon
	}
}
f0_local1.Streak = {
	{
		"streak",
		{
			{
				"radar_mp",
				0
			},
			{
				"airstrike_mp",
				0
			},
			{
				"helicopter_mp",
				0
			}
		},
		"",
		"weapon_locked_pistol"
	}
}
f0_local1.Equipment = {
	{
		"equipment_lethal",
		{
			{
				"h1_fraggrenade_mp",
				0
			}
		},
		"",
		CoD.Material.LockedIcon
	},
	{
		"equipment_tactical",
		{
			{
				"h1_flashgrenade_mp",
				0
			},
			{
				"h1_concussiongrenade_mp",
				0
			},
			{
				"h1_smokegrenade_mp",
				0
			}
		},
		"",
		CoD.Material.LockedIcon
	},
	{
		"perk",
		{
			{
				"c4_mp",
				0
			},
			{
				"rpg_mp",
				0
			},
			{
				"claymore_mp",
				0
			}
		},
		"",
		CoD.Material.LockedIcon
	}
}
f0_local1.Attachments = {
	{
		"undermount",
		{
			{
				"glmwr",
				0
			}
		},
		"",
		CoD.Material.LockedIcon
	}
}
f0_local0.Weapons = f0_local1
f0_local0.LootWeapons = {
	Primary = {
		{
			"weapon_assault",
			{
				{
					"h1_xmlar",
					0
				},
				{
					"h1_aprast",
					0
				}
			},
			"@MENU_ASSAULT_RIFLES_CAPS",
			CoD.Material.LockedIcon,
			"@LUA_MENU_WEAPTYPE_SINGLE_AR"
		},
		{
			"weapon_smg",
			{
				{
					"h1_febsmg",
					0
				},
				{
					"h1_aprsmg",
					0
				}
			},
			"@MENU_SMGS_CAPS",
			CoD.Material.LockedIcon,
			"@MPUI_SUB_MACHINE_GUN"
		},
		{
			"weapon_sniper",
			{
				{
					"h1_febsnp",
					0
				},
				{
					"h1_junsnp",
					0
				}
			},
			"@MENU_SNIPER_RIFLES_CAPS",
			CoD.Material.LockedIcon,
			"@LUA_MENU_WEAPTYPE_SINGLE_SNIPER"
		},
		{
			"weapon_shotgun",
			{
				{
					"h1_kam12",
					0
				},
				{
					"h1_junsho",
					0
				}
			},
			"@MENU_SHOTGUNS_CAPS",
			CoD.Material.LockedIcon,
			"@LUA_MENU_WEAPTYPE_SINGLE_SHOTGUN"
		},
		{
			"weapon_heavy",
			{
				{
					"h1_feblmg",
					0
				},
				{
					"h1_junlmg",
					0
				}
			},
			"@MENU_LMGS_CAPS",
			CoD.Material.LockedIcon,
			"@LUA_MENU_WEAPTYPE_SINGLE_LMG"
		}
	},
	Secondary = {
		{
			"weapon_pistol",
			{
				{
					"h1_janpst",
					0
				},
				{
					"h1_aprpst",
					0
				}
			},
			"@MENU_PISTOLS_CAPS",
			CoD.Material.LockedIcon,
			"@LUA_MENU_WEAPTYPE_SINGLE_HANDGUN"
		}
	},
	Melee = {
		{
			"weapon_melee",
			{
				{
					"none",
					0
				},
				{
					"h1_meleeshovel",
					0
				},
				{
					"h1_meleepaddle",
					0
				},
				{
					"h1_meleebottle",
					0
				},
				{
					"h1_meleeblade",
					0
				},
				{
					"h1_meleeicepick",
					0
				},
				{
					"h1_meleebayonet",
					0
				},
				{
					"h1_meleegladius",
					0
				},
				{
					"h1_meleesickle",
					0
				},
				{
					"h1_meleehatchet",
					0
				},
				{
					"h1_meleefeb1",
					0
				},
				{
					"h1_meleefeb2",
					0
				},
				{
					"h1_meleefeb3",
					0
				},
				{
					"h1_meleefeb4",
					0
				},
				{
					"h1_meleefeb5",
					0
				},
				{
					"h1_meleeapr1",
					0
				},
				{
					"h1_meleeapr2",
					0
				},
				{
					"h1_meleeapr3",
					0
				},
				{
					"h1_meleeapr4",
					0
				},
				{
					"h1_meleejun1",
					0
				},
				{
					"h1_meleejun2",
					0
				},
				{
					"h1_meleejun3",
					0
				},
				{
					"h1_meleejun4",
					0
				},
				{
					"h1_meleejun5",
					0
				},
				{
					"h1_meleejun6",
					0
				},
				{
					"h1_meleeaug1",
					0
				},
				{
					"h1_meleeaug2",
					0
				},
				{
					"h1_meleeaug3",
					0
				},
				{
					"h1_meleeaug4",
					0
				}
			},
			"@MENU_MELEE_CAPS",
			CoD.Material.LockedIcon,
			"@MP_MELEE"
		}
	}
}
f0_local0.LimitedWeaponCategories = {
	"Primary",
	"Secondary",
	"Lethal",
	"Tactical",
	"Perk_Slot1",
	"Perk_Slot2",
	"Perk_Slot3"
}
f0_local0.NullWeaponName_Primary = "iw5_combatknife"
f0_local0.NullWeaponName_Primary_AttachKit = "none"
f0_local0.NullWeaponName_Primary_FurnitureKit = "base"
f0_local0.NullWeaponName_Primary_Camo = "none"
f0_local0.NullWeaponName_Primary_Reticle = "none"
f0_local0.NullWeaponName_Secondary = "iw5_combatknife"
f0_local0.NullWeaponName_Secondary_AttachKit = "none"
f0_local0.NullWeaponName_Secondary_FurnitureKit = "base"
f0_local0.NullWeaponName_Secondary_Camo = "none"
f0_local0.NullWeaponName_Secondary_Reticle = "none"
f0_local0.NullWeaponName_Lethal = "specialty_null"
f0_local0.NullWeaponName_Tactical = "specialty_null"
f0_local0.NullWeaponName_Perk_Slot1 = "specialty_null"
f0_local0.NullWeaponName_Perk_Slot2 = "specialty_null"
f0_local0.NullWeaponName_Perk_Slot3 = "specialty_null"
f0_local0.NullWeaponNames = {
	Primary = "iw5_combatknife",
	Primary_AttachKit = "none",
	Primary_FurnitureKit = "base",
	Primary_Camo = "none",
	Primary_Reticle = "none",
	Secondary = "iw5_combatknife",
	Secondary_AttachKit = "none",
	Secondary_FurnitureKit = "base",
	Secondary_Camo = "none",
	Secondary_Reticle = "none",
	Lethal = "specialty_null",
	Tactical = "specialty_null",
	Perk_Slot1 = "specialty_null",
	Perk_Slot2 = "specialty_null",
	Perk_Slot3 = "specialty_null",
	Melee = "none"
}
f0_local0.DefaultWeaponNames = {
	Primary = "h1_m16",
	Primary_AttachKit = "gl",
	Primary_FurnitureKit = "base",
	Primary_Camo = "none",
	Primary_Reticle = "none",
	Secondary = "h1_beretta",
	Secondary_AttachKit = "none",
	Secondary_FurnitureKit = "base",
	Secondary_Camo = "none",
	Secondary_Reticle = "none",
	Lethal = "h1_fraggrenade_mp",
	Tactical = "h1_flashgrenade_mp",
	Perk_Slot1 = "specialty_null",
	Perk_Slot2 = "specialty_bulletdamage",
	Perk_Slot3 = "specialty_longersprint",
	Melee = "none"
}
f0_local0.KitWeaponTypes = {
	weapon_assault = "ast",
	weapon_smg = "smg",
	weapon_sniper = "snp",
	weapon_shotgun = "sht",
	weapon_heavy = "lmg",
	weapon_lmg = "lmg",
	weapon_pistol = "pst"
}
f0_local0.BreadcrumbCategoryIndex = {
	Primary = 0,
	Primary_AttachKit = 1,
	Primary_FurnitureKit = 2,
	Primary_Camo = 3,
	Primary_Reticle = 4,
	Secondary = 5,
	Secondary_AttachKit = 6,
	Secondary_FurnitureKit = 7,
	Secondary_Camo = 8,
	Secondary_Reticle = 9,
	Lethal = 10,
	Tactical = 11,
	Perk_Slot1 = 12,
	Perk_Slot2 = 13,
	Perk_Slot3 = 14,
	Emblem = 15,
	CallingCard = 16
}
f0_local0.BreadcrumbSubCategoryIndex = {
	weapon_assault = 0,
	weapon_smg = 1,
	weapon_sniper = 2,
	weapon_shotgun = 3,
	weapon_heavy = 4,
	h1_m16 = 5,
	h1_ak47 = 6,
	h1_m4 = 7,
	h1_g3 = 8,
	h1_g36c = 9,
	h1_m14 = 10,
	h1_mp44 = 11,
	h1_xmlar = 12,
	h1_galil = 13,
	h1_mp5 = 14,
	h1_skorpion = 15,
	h1_uzi = 16,
	h1_ak74u = 17,
	h1_p90 = 18,
	h1_mac10 = 19,
	h1_pp2000 = 20,
	h1_m40a3 = 21,
	h1_m21 = 22,
	h1_dragunov = 23,
	h1_remington700 = 24,
	h1_barrett = 25,
	h1_vssvintorez = 26,
	h1_winchester1200 = 27,
	h1_m1014 = 28,
	h1_kam12 = 29,
	h1_saw = 30,
	h1_rpd = 31,
	h1_m60e4 = 32,
	h1_m240 = 33,
	h1_beretta = 34,
	h1_usp = 35,
	h1_colt45 = 36,
	h1_deserteagle = 37,
	h1_deserteagle55 = 38,
	em_general = 39,
	em_bootcamp = 40,
	em_operations = 41,
	em_killer = 42,
	em_humiliation = 43,
	em_perks = 44,
	em_gamemodes = 45,
	em_valor = 46,
	em_prestige = 47,
	cc_general = 48,
	cc_bootcamp = 49,
	cc_operations = 50,
	cc_killer = 51,
	cc_humiliation = 52,
	cc_perks = 53,
	cc_gamemodes = 54,
	cc_valor = 55,
	cc_prestige = 56,
	em_dlc = 57,
	cc_dlc = 58,
	em_LootDrop1 = 59,
	cc_LootDrop1 = 60,
	h1_janpst = 61,
	h1_febsmg = 62,
	h1_feblmg = 63,
	h1_febsnp = 64,
	h1_aprpst = 65,
	h1_aprast = 66,
	h1_aprsmg = 67,
	h1_junsho = 68,
	h1_junlmg = 69,
	h1_junsnp = 70,
	h1_augast = 71,
	h1_augsmg = 72,
	h1_augpst = 73
}
f0_local0.EquipmentSlots = {
	{
		weaponCategory = "Primary",
		weaponIndex = 0
	},
	{
		weaponCategory = "Primary_AttachKit",
		weaponIndex = 0
	},
	{
		weaponCategory = "Primary_FurnitureKit",
		weaponIndex = 0
	},
	{
		weaponCategory = "Primary_Camo",
		weaponIndex = 0
	},
	{
		weaponCategory = "Primary_Reticle",
		weaponIndex = 0
	},
	{
		weaponCategory = "Secondary",
		weaponIndex = 0
	},
	{
		weaponCategory = "Secondary_AttachKit",
		weaponIndex = 0
	},
	{
		weaponCategory = "Secondary_FurnitureKit",
		weaponIndex = 0
	},
	{
		weaponCategory = "Secondary_Camo",
		weaponIndex = 0
	},
	{
		weaponCategory = "Secondary_Reticle",
		weaponIndex = 0
	},
	{
		weaponCategory = "Lethal",
		weaponIndex = 0
	},
	{
		weaponCategory = "Tactical",
		weaponIndex = 0
	},
	{
		weaponCategory = "Perk_Slot1",
		weaponIndex = 0
	},
	{
		weaponCategory = "Perk_Slot2",
		weaponIndex = 0
	},
	{
		weaponCategory = "Perk_Slot3",
		weaponIndex = 0
	},
	{
		weaponCategory = "Melee",
		weaponIndex = 0
	}
}
f0_local0.WeaponGridDims = {
	default = {
		3,
		3
	},
	Primary_Camo = {
		3,
		2
	},
	Secondary_Camo = {
		3,
		2
	}
}
f0_local0.ItemLockStatus = {
	Unlocked = 0,
	ChallengeNotCompleted = 1,
	LevelNotReached = 2,
	OnlineDataNotFetched = 3,
	AllLocked = 4,
	InvalidIntenvoryStatus = 5,
	EntitlementNotUnlocked = 6,
	ExtLevelNotReached = 7,
	ExtPrestigeLevelNotReached = 8,
	ExtinctionEscapesNotReached = 9,
	ExtRelicEscapesNotReached = 10,
	ExtKillsNotReached = 11,
	ExtRevivesNotReached = 12,
	PrestigeNotReached = 13,
	DlcRequired = 14,
	NotInInventory = 15,
	Unknown = 16
}
f0_local0.InventoryItemType = {
	Default = 0,
	Loot = 1,
	MTX = 2,
	Entitlement = 3,
	Challenge = 4,
	SupplyDrop = 5,
	Reward = 6
}
f0_local0.InventoryItemRarity = {
	None = 0,
	Entitlement = 1,
	Reward = 2,
	Common = 3,
	Rare = 4,
	Legendary = 5,
	Epic = 6
}
f0_local0.LootDropRewardImages = {
	0x100D0BE = {
		complete = "collection_season1_complete",
		incomplete = "collection_season1_incomplete",
		seasonTag = "LootDrop1|LootDrop2"
	},
	0x6300031 = {
		complete = "collection_promo1_complete",
		incomplete = "collection_promo1_incomplete",
		seasonTag = "LootDrop3:1"
	},
	0x6300040 = {
		complete = "collection_season2_complete",
		incomplete = "collection_season2_incomplete",
		seasonTag = "LootDrop3|LootDrop4"
	},
	0x630004E = {
		complete = "collection_promo2_complete",
		incomplete = "collection_promo2_incomplete",
		seasonTag = "LootDrop5:2"
	},
	0x6300063 = {
		complete = "collection_season3_complete",
		incomplete = "collection_season3_incomplete",
		seasonTag = "LootDrop5|LootDrop6"
	}
}
f0_local0.ExtendedLoadoutUnlockRef = "CustomClasses"
f0_local0.AttachmentMap = nil
f0_local0.SelectedWeaponIndex = 0
f0_local0.EditRemove_SelectedCategory = nil
f0_local0.EditRemove_SelectedIndex = nil
f0_local0.EditRemove_SelectedWeapon = nil
f0_local0.inPlayerJoinedTask = false
f0_local0.playerJoined_num_retries = nil
f0_local0.playerJoined_timer = nil
f0_local0.IsAnyCustomClassRestrictedCache = false
f0_local0.CustomClassIndexForRestrictCheck = 0
Cac = f0_local0
UnlockTable = {
	File = "mp/unlockTable.csv",
	Cols = {
		ItemId = 0,
		Type = 1,
		Rank = 2,
		Challenge = 3,
		Unused = 4,
		Tier = 5,
		Weight = 6,
		PrestigeShop = 7,
		PrestigeLevel = 8,
		DlcLevel = 9,
		DlcEarlyAccess = 10
	}
}
ItemTypes = {
	Weapon = "weapon",
	Costume = "costume",
	Reinforcement = "reinforcement",
	Attachment = "weaponAttachment",
	AttachKit = "attachkit",
	FurnitureKit = "furniturekit",
	Feature = "feature",
	Camo = "weaponcamo",
	Reticle = "reticle",
	Playercard = "callingcard",
	Emblem = "emblem",
	SupplyDrop = "supplydrop",
	CharacterCamo = "charactercamo"
}
for f0_local3, f0_local4 in pairs( Cac.Weapons ) do
	f0_local4.Selected = {}
	f0_local4.Selected.weaponType = f0_local4[1][1]
	f0_local4.Indices = {}
	f0_local4.Keys = {}
	f0_local4.DisplayNames = {}
	f0_local4.LockedIcons = {}
	f0_local4.DisplayNamesSingle = {}
	for f0_local8, f0_local9 in ipairs( f0_local4 ) do
		if f0_local9[2][1] ~= nil then
			f0_local4.Selected[f0_local9[1]] = f0_local9[2][1][1]
		end
		for f0_local13, f0_local14 in ipairs( f0_local9[2] ) do
			f0_local4.Selected[f0_local14[1]] = f0_local14[1]
		end
		f0_local4[f0_local9[1]] = f0_local9[2]
		f0_local4.Indices[f0_local9[1]] = f0_local8
		f0_local4.Keys[f0_local8] = f0_local9[1]
		f0_local4.DisplayNames[f0_local9[1]] = f0_local9[3]
		f0_local4.LockedIcons[f0_local9[1]] = f0_local9[4]
		f0_local4.DisplayNamesSingle[f0_local9[1]] = f0_local9[5]
		f0_local4[f0_local8] = f0_local9[2]
	end
end
for f0_local3, f0_local4 in pairs( Cac.LootWeapons ) do
	f0_local4.Selected = {}
	f0_local4.Selected.weaponType = f0_local4[1][1]
	f0_local4.Indices = {}
	f0_local4.Keys = {}
	f0_local4.DisplayNames = {}
	f0_local4.LockedIcons = {}
	f0_local4.DisplayNamesSingle = {}
	for f0_local8, f0_local9 in ipairs( f0_local4 ) do
		if f0_local9[2][1] ~= nil then
			f0_local4.Selected[f0_local9[1]] = f0_local9[2][1][1]
		end
		for f0_local13, f0_local14 in ipairs( f0_local9[2] ) do
			f0_local4.Selected[f0_local14[1]] = f0_local14[1]
		end
		f0_local4[f0_local9[1]] = f0_local9[2]
		f0_local4.Indices[f0_local9[1]] = f0_local8
		f0_local4.Keys[f0_local8] = f0_local9[1]
		f0_local4.DisplayNames[f0_local9[1]] = f0_local9[3]
		f0_local4.LockedIcons[f0_local9[1]] = f0_local9[4]
		f0_local4.DisplayNamesSingle[f0_local9[1]] = f0_local9[5]
		f0_local4[f0_local8] = f0_local9[2]
	end
end
StatsTable = {
	File = "mp/StatsTable.csv",
	Cols = {
		WeaponId = 0,
		Group = 2,
		WeaponRef = 4,
		Ref = 4,
		WeaponClass = 2,
		WeaponName = 3,
		Name = 3,
		WeaponCount = 5,
		WeaponImage = 6,
		Image = 6,
		WeaponDesc = 7,
		FirstWeaponAttachment = 11,
		FirstRequiredWeaponAttachment = 40,
		WeaponAcc = 41,
		WeaponDam = 42,
		WeaponRng = 43,
		WeaponRof = 44,
		WeaponMob = 45,
		WeaponHan = 46,
		WeaponAmm = 47,
		WeaponMag = 48,
		GUID = 49,
		Ignore = 51,
		ItemType = 52,
		ShowInArmory = 53,
		Rarity = 60,
		DisplayOrder = 62,
		ExternalRef = 63,
		Price = 64,
		ContentPromo = 65,
		ProdLevel = 66
	},
	AttachmentCount = 29
}
AttachmentComboTable = {
	File = "mp/attachmentCombos.csv",
	Cols = {
		Ref = 0
	}
}
AttachmentMapTable = {
	File = "mp/attachmentmap.csv",
	Cols = {
		WeaponOrType = 0,
		BaseAttachesStart = 1
	}
}
AttachBaseTable = {
	File = "mp/attachmentbase.csv",
	Cols = {
		Id = 0,
		Ref = 1,
		Group = 2,
		Name = 3,
		Hidden = 4,
		Image = 5,
		Reticle = 6
	}
}
AttachKitTable = {
	File = "mp/attachkits.csv",
	Cols = {
		Id = 0,
		Ref = 1,
		Attach1 = 2,
		Attach2 = 3,
		Attach3 = 4,
		Attach4 = 5,
		Valid = 6,
		GlobalID = 7,
		Name = 8,
		Desc = 9,
		Image = 10,
		Lootdrop = 23
	}
}
FurnitureKitTable = {
	File = "mp/furniturekits.csv",
	Cols = {
		Id = 0,
		Ref = 1,
		GlobalID = 2,
		Name = 3,
		Desc = 4,
		Image = 5,
		Valid = 6,
		ASTItem = 7,
		SMGItem = 8,
		LMGItem = 9,
		SHTItem = 10,
		SNPItem = 11,
		PSTItem = 12,
		Lootdrop = 13
	}
}
PerkTable = {
	File = "mp/perkTable.csv",
	Cols = {
		Index = 0,
		Ref = 1,
		Name = 2,
		Image = 3,
		Desc = 4,
		Slot = 5,
		Count = 6,
		Type = 7,
		Upgrade = 8,
		UpgradeName = 9,
		FrontendImage = 10
	}
}
CamoTable = {
	File = "mp/camoTable.csv",
	Cols = {
		Index = 0,
		Ref = 1,
		Name = 2,
		Desc = 3,
		Image = 4,
		ARGuid = 12,
		SMGGuid = 13,
		LMGGuid = 14,
		SGGuid = 15,
		SRGuid = 16,
		PGuid = 17
	}
}
ReticleTable = {
	File = "mp/reticleTable.csv",
	Cols = {
		Index = 0,
		Ref = 1,
		Name = 2,
		Desc = 3,
		Image = 4,
		ARGuid = 9,
		SMGGuid = 10,
		LMGGuid = 11,
		SGGuid = 12,
		SRGuid = 13,
		PGuid = 14
	}
}
KillstreakTable = {
	File = "mp/killstreakTable.csv",
	Cols = {
		Index = 0,
		Ref = 1,
		Name = 2,
		Desc = 3,
		Adrenaline = 4,
		Sound = 6,
		Weapon = 11,
		Image = 13,
		CrateIcon = 14,
		CrateIconPlus1 = 15,
		CrateIconPlus2 = 16,
		CrateIconPlus3 = 17,
		DPadIcon = 18,
		UnearnedIcon = 19,
		EarnedIcon = 20,
		Type = 21,
		AlternateName = 22
	}
}
KillstreakModulesTable = {
	File = "mp/killstreakModules.csv",
	Cols = {
		Index = 0,
		Ref = 1,
		Name = 2,
		Desc = 3,
		BaseStreakRef = 4,
		AddedPoints = 5,
		Slot = 6,
		IsSupport = 7,
		Icon = 8
	}
}
ClassTable = {
	File = "mp/classTable.csv",
	Cols = {
		Lookup = 0,
		Slot1 = 1
	}
}
SplashTable = {
	File = "mp/splashTable.csv",
	Cols = {
		Ref = 0,
		Name = 1,
		Desc = 2,
		Image = 3,
		Duration = 4,
		Red = 5,
		Green = 6,
		Blue = 7,
		Alpha = 8,
		Sound = 9,
		DontKnow = 10,
		SplashType = 11
	}
}
GameTypesTable = {
	File = "mp/gametypesTable.csv",
	Cols = {
		Ref = 0,
		Name = 1,
		Desc = 2,
		Image = 3,
		TeamChoice = 4,
		ClassChoice = 5,
		TeamBased = 6,
		RoundBased = 7,
		GenericMenu = 8
	}
}
OverridePlayerDataFaction = nil
OverrideClearReticle = nil
RaritySortTable = {
	[Cac.InventoryItemRarity.Reward] = 6,
	[Cac.InventoryItemRarity.Epic] = 5,
	[Cac.InventoryItemRarity.Legendary] = 4,
	[Cac.InventoryItemRarity.Rare] = 3,
	[Cac.InventoryItemRarity.Common] = 2,
	[Cac.InventoryItemRarity.Entitlement] = 1,
	[Cac.InventoryItemRarity.None] = 0
}
Cac.SortLootByRarity = function ( f1_arg0 )
	table.sort( f1_arg0, function ( f2_arg0, f2_arg1 )
		return (f2_arg0.lootRarity and RaritySortTable[f2_arg0.lootRarity.rarity] or -1) < (f2_arg1.lootRarity and RaritySortTable[f2_arg1.lootRarity.rarity] or -1)
	end )
	return f1_arg0
end

Cac.Perk1Disabled = function ()
	local f3_local0 = Cac.HasEquippedWeapon( "Primary_AttachKit", "gl", LUI.CacStaticLayout.ClassLoc )
	if not f3_local0 then
		f3_local0 = Cac.HasEquippedWeapon( "Primary_AttachKit", "grip", LUI.CacStaticLayout.ClassLoc )
		if not f3_local0 then
			f3_local0 = Cac.HasEquippedWeapon( "Secondary_AttachKit", "gl", LUI.CacStaticLayout.ClassLoc )
			if not f3_local0 then
				f3_local0 = Cac.HasEquippedWeapon( "Secondary_AttachKit", "grip", LUI.CacStaticLayout.ClassLoc )
			end
		end
	end
	return f3_local0
end

Cac.GetPerk1Names = function ()
	if Cac.Perk1Disabled() then
		return "@LUA_MENU_CAC_ATTACHMENT_BLANK", "@MENU_WEAPON_ATTACHMENT"
	else
		return nil, nil
	end
end

Cac.EnableMenuCache = function ()
	if Engine.InFrontend() then
		Cac.MenuCache.IsCustomClassRestrictedCache = {}
		Cac.MenuCache.InventoryUtils_GetLootData = {}
		return 
	else
		Cac.MenuCache.CacheResults = true
	end
end

Cac.DisableMenuCache = function ()
	Cac.MenuCache.CacheResults = false
	if Engine.InFrontend() then
		Cac.MenuCache.IsCustomClassRestrictedCache = {}
		Cac.MenuCache.InventoryUtils_GetLootData = {}
	end
end

f0_local0 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = f7_arg0
	for f7_local5, f7_local6 in ipairs( f7_arg1 ) do
		local f7_local4 = f7_local0[f7_local6]
		if f7_local4 == nil then
			f7_local4 = {}
			f7_local0[f7_local6] = f7_local4
		end
		f7_local0 = f7_local4
	end
	return f7_local0
end

Cac.GetCachedData_InventoryUtils_GetLootData = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
	if not Cac.MenuCache.CacheResults then
		return 
	end
	local f8_local0 = nil
	if f8_arg3 ~= nil then
		f8_local0 = f0_local0( Cac.MenuCache.InventoryUtils_GetLootData, {
			f8_arg0,
			f8_arg1 or "nil",
			f8_arg2 or "nil",
			f8_arg3.Type,
			f8_arg3.ItemId
		} )
	else
		f8_local0 = f0_local0( Cac.MenuCache.InventoryUtils_GetLootData, {
			f8_arg0,
			f8_arg1 or "nil",
			f8_arg2 or "nil"
		} )
	end
	if #f8_local0 == 0 then
		return false, false
	end
	return true, f8_local0[1]
end

Cac.SetCachedData_InventoryUtils_GetLootData = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
	if not Cac.MenuCache.CacheResults then
		return 
	end
	local f9_local0 = nil
	if f9_arg3 ~= nil then
		f9_local0 = f0_local0( Cac.MenuCache.InventoryUtils_GetLootData, {
			f9_arg0,
			f9_arg1 or "nil",
			f9_arg2 or "nil",
			f9_arg3.Type,
			f9_arg3.ItemId
		} )
	else
		f9_local0 = f0_local0( Cac.MenuCache.InventoryUtils_GetLootData, {
			f9_arg0,
			f9_arg1 or "nil",
			f9_arg2 or "nil"
		} )
	end
	f9_local0[1] = f9_arg4
end

MatchRules.AllowCustomClasses = function ()
	if not MatchRules.IsUsingMatchRulesData() then
		return true
	else
		return MatchRules.GetData( "commonOption", "allowCustomClasses" )
	end
end

Cac.IsCarrierClassSlot = function ( f11_arg0, f11_arg1 )
	local f11_local0
	if f11_arg0 ~= 5 or f11_arg1 ~= "defaultClassesTeam1" and f11_arg1 ~= "defaultClassesTeam2" then
		f11_local0 = false
	else
		f11_local0 = true
	end
	return f11_local0
end

Cac.GetCarrierClassName = function ( f12_arg0 )
	local f12_local0 = GameX.GetGameMode()
	if f12_local0 == "sd" or f12_local0 == "sab" then
		if Cac.IsClassInUse( f12_arg0, 5 ) then
			return Engine.Localize( "@MPUI_BOMB_CARRIER_ENABLED", 6 )
		else
			return Engine.Localize( "@MPUI_BOMB_CARRIER_DISABLED", 6 )
		end
	elseif f12_local0 == "ctf" then
		if Cac.IsClassInUse( f12_arg0, 5 ) then
			return Engine.Localize( "@MPUI_FLAG_CARRIER_ENABLED", 6 )
		else
			return Engine.Localize( "@MPUI_FLAG_CARRIER_DISABLED", 6 )
		end
	else
		
	end
end

Cac.GetUnrestrictedState = function ( f13_arg0, f13_arg1 )
	if GameX.IsRankedMatch() == true then
		return true
	end
	local f13_local0 = CoD.GetStatsGroupForGameMode()
	local f13_local1 = Cac.GetSelectedClassIndex( Cac.GetCustomClassLoc() )
	local f13_local2 = Cac.GetSelectedControllerIndex()
	local f13_local3 = true
	if f13_arg0 == "Primary" or f13_arg0 == "Secondary" or f13_arg0 == "Melee" then
		f13_local3 = not MatchRules.WeaponIsRestricted( f13_arg1 )
	elseif f13_arg0 == "Perk_Slot1" or f13_arg0 == "Perk_Slot2" or f13_arg0 == "Perk_Slot3" or f13_arg0 == "Tactical" or f13_arg0 == "Lethal" then
		f13_local3 = not MatchRules.PerkIsRestricted( f13_arg1 )
	elseif f13_arg0 == "Primary_AttachKit" or f13_arg0 == "Secondary_AttachKit" then
		f13_local3 = not MatchRules.AttachmentIsRestricted( f13_arg1 .. "mwr" )
	end
	return f13_local3
end

Cac.GetCacConfig = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4, f14_arg5, f14_arg6 )
	assert( f14_arg1 ~= nil, "Class location is a required parameter." )
	if f14_arg2 == nil then
		f14_arg2 = Cac.GetSelectedClassIndex( f14_arg1 )
	end
	if Cac.IsMatchPresetClass( f14_arg1 ) then
		local f14_local0 = Cac.Settings.DataLoc[f14_arg1].teamName
		if Cac.IsCarrierClassSlot( f14_arg2, f14_arg1 ) and f14_arg3 == "name" then
			return Cac.GetDefaultClassConfig( f14_arg1, f14_arg2, f14_arg3, f14_arg4, f14_arg5, f14_arg6 )
		elseif not Cac.IsClassInUse( f14_arg1, f14_arg2 ) then
			return Cac.GetDefaultClassConfig( f14_arg1, f14_arg2, f14_arg3, f14_arg4, f14_arg5, f14_arg6 )
		elseif f14_arg6 ~= nil then
			return MatchRules.GetData( "defaultClasses", f14_local0, "defaultClass", f14_arg2, "class", f14_arg3, f14_arg4, f14_arg5, f14_arg6 )
		elseif f14_arg5 ~= nil then
			return MatchRules.GetData( "defaultClasses", f14_local0, "defaultClass", f14_arg2, "class", f14_arg3, f14_arg4, f14_arg5 )
		elseif f14_arg4 ~= nil then
			return MatchRules.GetData( "defaultClasses", f14_local0, "defaultClass", f14_arg2, "class", f14_arg3, f14_arg4 )
		elseif f14_arg3 ~= nil then
			return MatchRules.GetData( "defaultClasses", f14_local0, "defaultClass", f14_arg2, "class", f14_arg3 )
		end
	elseif (f14_arg1 == "customClasses" or f14_arg1 == "privateMatchCustomClasses") and Cac.Settings.DataLoc[f14_arg1].baseClassSlots <= f14_arg2 then
		f14_arg2 = f14_arg2 - Cac.Settings.DataLoc[f14_arg1].baseClassSlots
		if f14_arg6 ~= nil then
			return Engine.GetPlayerDataExtendedEx( f14_arg0, CoD.GetStatsGroupForGameMode(), f14_arg1, f14_arg2, f14_arg3, f14_arg4, f14_arg5, f14_arg6 )
		elseif f14_arg5 ~= nil then
			return Engine.GetPlayerDataExtendedEx( f14_arg0, CoD.GetStatsGroupForGameMode(), f14_arg1, f14_arg2, f14_arg3, f14_arg4, f14_arg5 )
		elseif f14_arg4 ~= nil then
			return Engine.GetPlayerDataExtendedEx( f14_arg0, CoD.GetStatsGroupForGameMode(), f14_arg1, f14_arg2, f14_arg3, f14_arg4 )
		elseif f14_arg3 ~= nil then
			return Engine.GetPlayerDataExtendedEx( f14_arg0, CoD.GetStatsGroupForGameMode(), f14_arg1, f14_arg2, f14_arg3 )
		end
	elseif f14_arg6 ~= nil then
		return Engine.GetPlayerData( f14_arg0, CoD.GetStatsGroupForGameMode(), f14_arg1, f14_arg2, f14_arg3, f14_arg4, f14_arg5, f14_arg6 )
	elseif f14_arg5 ~= nil then
		return Engine.GetPlayerData( f14_arg0, CoD.GetStatsGroupForGameMode(), f14_arg1, f14_arg2, f14_arg3, f14_arg4, f14_arg5 )
	elseif f14_arg4 ~= nil then
		return Engine.GetPlayerData( f14_arg0, CoD.GetStatsGroupForGameMode(), f14_arg1, f14_arg2, f14_arg3, f14_arg4 )
	elseif f14_arg3 ~= nil then
		return Engine.GetPlayerData( f14_arg0, CoD.GetStatsGroupForGameMode(), f14_arg1, f14_arg2, f14_arg3 )
	end
	assert( false )
end

Cac.SetCacConfig = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4, f15_arg5, f15_arg6, f15_arg7 )
	assert( f15_arg1 ~= nil, "Class location is a required parameter." )
	if f15_arg2 == nil then
		f15_arg2 = Cac.GetSelectedClassIndex( f15_arg1 )
	end
	DebugPrint( "Cac.SetCacConfig() controller: " .. f15_arg0 .. " location: " .. f15_arg1 .. " slot: " .. f15_arg2 )
	if Cac.IsMatchPresetClass( f15_arg1 ) then
		local f15_local0 = Cac.Settings.DataLoc[f15_arg1].teamName
		if f15_arg3 ~= "inUse" and not Cac.IsClassInUse( f15_arg1, f15_arg2 ) then
			local f15_local1 = {}
			Cac.CopyClassToObj( f15_arg1, f15_arg2, f15_local1 )
			Cac.SetClassInUse( f15_arg1, f15_arg2 )
			Cac.PasteClassFromObj( f15_arg1, f15_arg2, f15_local1 )
			if Cac.IsCarrierClassSlot( f15_arg2, f15_arg1 ) then
				Cac.SetCustomClassName( Cac.GetCarrierClassName( f15_arg1 ), f15_arg1, f15_arg2 )
			end
		end
		if f15_arg7 ~= nil then
			return MatchRules.SetData( "defaultClasses", f15_local0, "defaultClass", f15_arg2, "class", f15_arg3, f15_arg4, f15_arg5, f15_arg6, f15_arg7 )
		elseif f15_arg6 ~= nil then
			return MatchRules.SetData( "defaultClasses", f15_local0, "defaultClass", f15_arg2, "class", f15_arg3, f15_arg4, f15_arg5, f15_arg6 )
		elseif f15_arg5 ~= nil then
			return MatchRules.SetData( "defaultClasses", f15_local0, "defaultClass", f15_arg2, "class", f15_arg3, f15_arg4, f15_arg5 )
		elseif f15_arg4 ~= nil then
			return MatchRules.SetData( "defaultClasses", f15_local0, "defaultClass", f15_arg2, "class", f15_arg3, f15_arg4 )
		elseif f15_arg3 ~= nil then
			return MatchRules.SetData( "defaultClasses", f15_local0, "defaultClass", f15_arg2, "class", f15_arg3 )
		end
	elseif (f15_arg1 == "customClasses" or f15_arg1 == "privateMatchCustomClasses") and Cac.Settings.DataLoc[f15_arg1].baseClassSlots <= f15_arg2 then
		f15_arg2 = f15_arg2 - Cac.Settings.DataLoc[f15_arg1].baseClassSlots
		if f15_arg7 ~= nil then
			return Engine.SetPlayerDataExtendedEx( f15_arg0, CoD.GetStatsGroupForGameMode(), f15_arg1, f15_arg2, f15_arg3, f15_arg4, f15_arg5, f15_arg6, f15_arg7 )
		elseif f15_arg6 ~= nil then
			return Engine.SetPlayerDataExtendedEx( f15_arg0, CoD.GetStatsGroupForGameMode(), f15_arg1, f15_arg2, f15_arg3, f15_arg4, f15_arg5, f15_arg6 )
		elseif f15_arg5 ~= nil then
			return Engine.SetPlayerDataExtendedEx( f15_arg0, CoD.GetStatsGroupForGameMode(), f15_arg1, f15_arg2, f15_arg3, f15_arg4, f15_arg5 )
		elseif f15_arg4 ~= nil then
			return Engine.SetPlayerDataExtendedEx( f15_arg0, CoD.GetStatsGroupForGameMode(), f15_arg1, f15_arg2, f15_arg3, f15_arg4 )
		elseif f15_arg3 ~= nil then
			return Engine.SetPlayerDataExtendedEx( f15_arg0, CoD.GetStatsGroupForGameMode(), f15_arg1, f15_arg2, f15_arg3 )
		end
	elseif f15_arg7 ~= nil then
		return Engine.SetPlayerData( f15_arg0, CoD.GetStatsGroupForGameMode(), f15_arg1, f15_arg2, f15_arg3, f15_arg4, f15_arg5, f15_arg6, f15_arg7 )
	elseif f15_arg6 ~= nil then
		return Engine.SetPlayerData( f15_arg0, CoD.GetStatsGroupForGameMode(), f15_arg1, f15_arg2, f15_arg3, f15_arg4, f15_arg5, f15_arg6 )
	elseif f15_arg5 ~= nil then
		return Engine.SetPlayerData( f15_arg0, CoD.GetStatsGroupForGameMode(), f15_arg1, f15_arg2, f15_arg3, f15_arg4, f15_arg5 )
	elseif f15_arg4 ~= nil then
		return Engine.SetPlayerData( f15_arg0, CoD.GetStatsGroupForGameMode(), f15_arg1, f15_arg2, f15_arg3, f15_arg4 )
	elseif f15_arg3 ~= nil then
		return Engine.SetPlayerData( f15_arg0, CoD.GetStatsGroupForGameMode(), f15_arg1, f15_arg2, f15_arg3 )
	end
	assert( false )
end

f0_local1 = function ()
	local f16_local0 = Engine.GetLuiRoot()
	if f16_local0 then
		if f16_local0.cacData == nil then
			f16_local0.cacData = {
				SelectedClassIndices = {}
			}
		end
		return f16_local0.cacData
	else
		return nil
	end
end

Cac.GetSelectedControllerIndex = function ()
	local f17_local0 = f0_local1()
	if f17_local0 then
		local f17_local1 = f17_local0.selectedControllerIndex
		local f17_local2 = false
		if f17_local1 ~= nil and Engine.HasActiveLocalClient( f17_local1 ) and Engine.DoWeHaveStats( f17_local1 ) then
			f17_local2 = true
		end
		if f17_local2 == false then
			Cac.SetSelectedControllerIndex( Engine.GetFirstActiveController() )
		end
		return f17_local0.selectedControllerIndex
	else
		DebugPrint( "LUI WARNING: Cac.GetSelectedControllerIndex(): function called before root is created or cacData is setup." )
		return nil
	end
end

Cac.SetSelectedControllerIndex = function ( f18_arg0 )
	if f18_arg0 == nil then
		DebugPrint( "LUI WARNING: Cac.SetSelectedControllerIndex(): setting controller index to nil, likely not intended." )
		return 
	end
	local f18_local0 = f0_local1()
	if f18_local0 then
		f18_local0.selectedControllerIndex = f18_arg0
		if f18_local0.SelectedClassIndices[f18_local0.selectedControllerIndex] == nil then
			f18_local0.SelectedClassIndices[f18_local0.selectedControllerIndex] = {
				customClasses = 0,
				privateMatchCustomClasses = 0,
				defaultClassesTeam1 = 0,
				defaultClassesTeam2 = 0
			}
		end
	else
		DebugPrint( "LUI WARNING: Cac.SetSelectedControllerIndex(): function called before root is created." )
	end
end

Cac.GetSelectedClassIndex = function ( f19_arg0 )
	assert( f19_arg0 ~= nil, "Class location is a required parameter." )
	local f19_local0 = f0_local1()
	if f19_local0 then
		return f19_local0.SelectedClassIndices[f19_local0.selectedControllerIndex][f19_arg0]
	else
		DebugPrint( "LUI WARNING: Cac.GetSelectedClassIndex(): function called before root is created or cacData is setup." )
		return 0
	end
end

Cac.SetSelectedClassIndex = function ( f20_arg0, f20_arg1 )
	assert( f20_arg1 ~= nil, "Class location is a required parameter." )
	local f20_local0 = f0_local1()
	if f20_local0 then
		f20_local0.SelectedClassIndices[f20_local0.selectedControllerIndex][f20_arg1] = f20_arg0
	else
		DebugPrint( "LUI WARNING: Cac.SetSelectedClassIndex(): function called before root is created or cacData is setup." )
	end
end

Cac.GetExtendedSlotLootData = function ( f21_arg0 )
	if not Engine.HasExtendedLoadouts( f21_arg0 ) and Engine.GetDvarInt( "extendedLoadoutsKillswitch" ) == 0 then
		local f21_local0 = LUI.InventoryUtils.GetLootData( nil, nil, {
			Type = LUI.InventoryUtils.UnlockTypes.FEATURE,
			ItemId = Cac.ExtendedLoadoutUnlockRef
		} )
		if Engine.InFrontend() and f21_local0 and f21_local0.lockStatus == Cac.ItemLockStatus.DlcRequired and f21_local0.dlcRequirement then
			return f21_local0
		end
	end
	return nil
end

Cac.GetCustomClassCount = function ( f22_arg0 )
	assert( f22_arg0 ~= nil, "Class location is a required parameter." )
	local f22_local0 = Cac.Settings.DataLoc[f22_arg0]
	local f22_local1 = f22_local0.maxClassSlots
	local f22_local2 = Cac.GetSelectedControllerIndex()
	if f22_arg0 == "customClasses" or f22_arg0 == "privateMatchCustomClasses" then
		local f22_local3 = false
		if Engine.GetOnlineGame() and Engine.GetDvarInt( "extendedLoadoutsKillswitch" ) == 0 then
			local f22_local4 = LUI.InventoryUtils.GetLootData( nil, nil, {
				Type = LUI.InventoryUtils.UnlockTypes.FEATURE,
				ItemId = Cac.ExtendedLoadoutUnlockRef
			} )
			if f22_local4 then
				if Engine.InFrontend() and f22_local4.lockStatus == Cac.ItemLockStatus.DlcRequired and f22_local4.dlcRequirement then
					f22_local3 = true
				elseif Engine.HasExtendedLoadouts( f22_local2 ) and f22_local4.lockStatus == Cac.ItemLockStatus.Unlocked then
					f22_local3 = true
				end
			end
		end
		if not f22_local3 then
			f22_local1 = f22_local0.baseClassSlots
		end
	end
	if f22_local0.hasGameModeSlot then
		local f22_local3 = GameX.GetGameMode()
		if f22_local3 ~= "sd" and f22_local3 ~= "sab" and f22_local3 ~= "ctf" then
			f22_local1 = f22_local1 - 1
		end
	end
	return f22_local1
end

Cac.InPermanentLockingContext = function ()
	return LUI.FlowManager.IsInStackRoot( "menu_unlock_gear" )
end

Cac.SelectingWeaponForAttachmentPermanentUnlock = function ()
	return LUI.FlowManager.IsMenuTopmost( Engine.GetLuiRoot(), "CacDetailsPermanentUnlocksWeaponForAttachments" )
end

Cac.SelectingAttachmentPermanentUnlock = function ()
	return LUI.FlowManager.IsMenuTopmost( Engine.GetLuiRoot(), "CacDetailsPermanentUnlocksAttachments" )
end

Cac.GetPrestigeShopChallenge = function ( f26_arg0 )
	return Engine.TableLookup( UnlockTable.File, UnlockTable.Cols.ItemId, f26_arg0, UnlockTable.Cols.PrestigeShop )
end

Cac.GetItemPermanentLockState = function ( f27_arg0, f27_arg1 )
	local f27_local0 = "Locked"
	local f27_local1 = -1
	local f27_local2 = ""
	if not f27_arg1 or Engine.Inventory_GetItemTypeByReference( f27_arg1 ) ~= Cac.InventoryItemType.Default then
		f27_local0 = "Hidden"
	end
	local f27_local3 = Cac.GetPrestigeShopChallenge( f27_arg1 )
	if f27_local3 ~= nil and f27_local3 ~= "" and Engine.CheckPlayerData( f27_arg0, CoD.StatsGroup.Ranked, "challengeProgress", f27_local3 ) then
		if Engine.GetPlayerData( f27_arg0, CoD.StatsGroup.Ranked, "challengeProgress", f27_local3 ) >= 2 or itemShouldAlwaysBeUnlocked then
			f27_local0 = "Unlocked"
		else
			f27_local0 = "Locked"
			local f27_local4 = 0
			if existsUnlockRank then
				f27_local4 = tonumber( itemUnlockRank ) + 1
			end
			f27_local2 = Engine.Localize( "LUA_MP_FRONTEND_PRESTIGE_UNLOCK", f27_local4 )
		end
	end
	return f27_local0, f27_local1, f27_local2
end

Cac.IsItemPermanentlyUnlocked = function ( f28_arg0, f28_arg1 )
	local f28_local0, f28_local1, f28_local2 = Cac.GetItemPermanentLockState( f28_arg0, f28_arg1 )
	return f28_local0 == "Unlocked"
end

Cac.AllDefaultItemsUnlocked = function ()
	if Engine.GetDvarBool( "xblive_privatematch" ) or not Engine.GetDvarBool( "onlinegame" ) then
		return true
	else
		return false
	end
end

Cac.IsLockedInPrivateMatch = function ( f30_arg0 )
	if f30_arg0 == nil then
		return false
	end
	local f30_local0 = f30_arg0
	local f30_local1 = string.find( f30_arg0, " " )
	if f30_local1 ~= nil then
		f30_local0 = string.sub( f30_arg0, f30_local1 + 1, string.len( f30_arg0 ) )
	end
	return Engine.TableLookupGetRowNum( "mp/privateMatchLockTable.csv", 0, f30_local0 ) >= 0
end

Cac.IsItemUnlocked = function ( f31_arg0, f31_arg1, f31_arg2 )
	return Cac.GetItemLockState( f31_arg0, nil, f31_arg1, f31_arg2 ) == "Unlocked"
end

Cac.GetUnlockItemRef = function ( f32_arg0, f32_arg1 )
	if f32_arg1 then
		return f32_arg1 .. " " .. f32_arg0
	else
		return f32_arg0
	end
end

Cac.GetPermanentUnlockItemRef = function ( f33_arg0, f33_arg1 )
	if f33_arg1 then
		return f33_arg1 .. " " .. f33_arg0
	else
		return f33_arg0
	end
end

Cac.IsClassItemUnlocked = function ( f34_arg0, f34_arg1, f34_arg2 )
	return Cac.IsItemUnlocked( f34_arg0, Cac.GetUnlockItemRef( f34_arg1, f34_arg2 ) )
end

Cac.IsClassItemLockedForOverkill = function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
	local f35_local0 = Cac.GetSelectedClassIndex( LUI.CacStaticLayout.ClassLoc )
	local f35_local1, f35_local2 = false
	if Cac.HasOverkill() then
		if f35_arg2 == "Primary" then
			if f35_arg3 == Cac.GetEquippedWeapon( "Secondary", 0, f35_arg1 ) then
				f35_local1 = true
				f35_local2 = Engine.Localize( "@LUA_MENU_ALREADY_EQUIPPED" )
			end
		elseif f35_arg2 == "Secondary" and f35_arg3 == Cac.GetEquippedWeapon( "Primary", 0, f35_arg1 ) then
			f35_local1 = true
			f35_local2 = Engine.Localize( "@LUA_MENU_ALREADY_EQUIPPED" )
		end
	end
	return {
		locked = f35_local1,
		reasonText = f35_local2
	}
end

Cac.IsClassItemLockedForSmoke = function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
	local f36_local0, f36_local1 = false
	if f36_arg2 == "Perk_Slot1" and f36_arg3 == "specialty_specialgrenade" then
		if Cac.GetEquippedWeapon( "Tactical", 0, f36_arg1 ) == "h1_smokegrenade_mp" then
			f36_local0 = true
			f36_local1 = Engine.Localize( "@LUA_MENU_SMOKE_EQUIPPED" )
		end
	elseif f36_arg2 == "Tactical" and f36_arg3 == "h1_smokegrenade_mp" and Cac.GetEquippedWeapon( "Perk_Slot1", 0, f36_arg1 ) == "specialty_specialgrenade" then
		f36_local0 = true
		f36_local1 = Engine.Localize( "@LUA_MENU_GRENADES_3_EQUIPPED" )
	end
	return {
		locked = f36_local0,
		reasonText = f36_local1
	}
end

Cac.GetItemLockState = function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3, f37_arg4 )
	if Cac.AllDefaultItemsUnlocked() and not Cac.IsLockedInPrivateMatch( f37_arg2 ) and not f37_arg3 and (not (not f37_arg1 or Engine.Inventory_GetItemTypeByGuid( f37_arg1 ) ~= Cac.InventoryItemType.Default) or f37_arg2 and Engine.Inventory_GetItemTypeByReference( f37_arg2 ) == Cac.InventoryItemType.Default) then
		return "Unlocked", 0, ""
	elseif f37_arg1 then
		local f37_local0, f37_local1, f37_local2 = Engine.GetItemLockState( f37_arg0, f37_arg1 )
		if not f37_arg2 then
			f37_arg2 = Engine.LookupStatsTableColumnForGUID( f37_arg1, StatsTable.Cols.Ref )
		end
		if Cac.GetItemType( f37_arg1 ) == ItemTypes.Weapon and f37_local1 == Cac.ItemLockStatus.DlcRequired then
			local f37_local3 = Engine.Inventory_GetItemTypeByGuid( f37_arg1 )
			if f37_local3 == Cac.InventoryItemType.Loot then
				if not Engine.Inventory_IsItemUsableForPlayer( f37_arg0, f37_arg2 ) then
					f37_local0 = "Hidden"
					f37_local1 = Cac.ItemLockStatus.NotInInventory
					f37_local2 = ""
				end
			elseif f37_local3 == Cac.InventoryItemType.Challenge and not Engine.Inventory_IsItemUsableForPlayer( f37_arg0, f37_arg2 ) then
				local f37_local4 = Engine.TableLookup( UnlockTable.File, UnlockTable.Cols.ItemId, f37_arg2, UnlockTable.Cols.DlcEarlyAccess )
				if not f37_local4 or f37_local4 == "" then
					f37_local0 = "Hidden"
					f37_local1 = Cac.ItemLockStatus.NotInInventory
					f37_local2 = ""
				end
			end
		end
		return f37_local0, f37_local1, f37_local2
	end
	local f37_local0, f37_local1, f37_local2 = Engine.GetItemLockStateByItemRef( f37_arg0, f37_arg2 )
	if f37_arg2 == "darkmatter" and f37_arg4 ~= nil and not Cac.IsClassItemUnlocked( f37_arg0, f37_arg2, f37_arg4 ) then
		f37_local0 = "Hidden"
		f37_local1 = Cac.ItemLockStatus.NotInInventory
		f37_local2 = ""
	end
	if (f37_arg2 == "gold" or f37_arg2 == "diamond") and f37_arg4 ~= nil and Cac.AllDefaultItemsUnlocked() and not Cac.IsClassItemUnlocked( f37_arg0, f37_arg2, f37_arg4 ) then
		f37_local0 = "Hidden"
		f37_local1 = Cac.ItemLockStatus.NotInInventory
		f37_local2 = ""
	end
	if f37_arg2 == "h1_deserteagle55" and f37_local0 == "Locked" and (not Cac.InPermanentLockingContext() or Cac.GetPrestigeTokens( f37_arg0 ) == 0) then
		f37_local0 = "Hidden"
		f37_local1 = Cac.ItemLockStatus.NotInInventory
		f37_local2 = ""
	end
	return f37_local0, f37_local1, f37_local2
end

Cac.GetClassItemLockState = function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3, f38_arg4 )
	local f38_local0 = Cac.GetUnlockItemRef( f38_arg4 )
	if Cac.InPermanentLockingContext() and not Cac.SelectingWeaponForAttachmentPermanentUnlock() then
		return Cac.GetItemPermanentLockState( f38_arg0, f38_local0 )
	elseif f38_arg3 == "Primary_Camo" or f38_arg3 == "Secondary_Camo" then
		if Cac.IsItemUnlocked( f38_arg0, f38_local0, true ) == true then
			f38_local0 = f38_arg4
		end
		return Cac.GetItemLockState( f38_arg0, f38_arg1, f38_local0, true )
	elseif f38_arg3 == "Primary_Reticle" or f38_arg3 == "Secondary_Reticle" then
		if Cac.IsItemUnlocked( f38_arg0, f38_local0 ) == true then
			f38_local0 = f38_arg4
		end
		return Cac.GetItemLockState( f38_arg0, f38_arg1, f38_local0 )
	else
		return Cac.GetItemLockState( f38_arg0, f38_arg1, f38_local0 )
	end
end

Cac.IsCustomClassWeaponLootRestricted = function ( f39_arg0, f39_arg1 )
	local f39_local0 = false
	if Cac.IsWeaponLootRestricted( Cac.GetEquippedWeapon( "Primary", 0, f39_arg0, f39_arg1 ) ) or Cac.IsWeaponLootRestricted( Cac.GetEquippedWeapon( "Secondary", 0, f39_arg0, f39_arg1 ) ) then
		f39_local0 = true
	end
	return f39_local0
end

Cac.IsCustomClassRestricted_Internal = function ( f40_arg0, f40_arg1 )
	if not Cac.IsMatchPresetClass( f40_arg0 ) then
		if not MatchRules.AllowCustomClasses() then
			return true
		elseif Cac.IsCustomClassWeaponLootRestricted( f40_arg0, f40_arg1 ) then
			return true
		elseif f40_arg1 == nil then
			f40_arg1 = Cac.GetSelectedClassIndex( f40_arg0 )
		end
		if Cac.GetMaxEquippedWeaponCount( f40_arg0 ) < Cac.GetEquippedWeaponCount( f40_arg0, f40_arg1 ) then
			return true
		else
			return MatchRules.CustomClassIsRestricted( Cac.GetSelectedControllerIndex(), CoD.GetStatsGroupForGameMode(), f40_arg0, f40_arg1 )
		end
	else
		return false
	end
end

Cac.IsCustomClassRestricted = function ( f41_arg0, f41_arg1 )
	if Cac.MenuCache.CacheResults or not Engine.InFrontend() then
		local f41_local0 = f0_local0( Cac.MenuCache.IsCustomClassRestrictedCache, {
			Cac.GetSelectedControllerIndex(),
			f41_arg0,
			f41_arg1
		} )
		local f41_local1 = nil
		if #f41_local0 == 0 then
			f41_local1 = Cac.IsCustomClassRestricted_Internal( f41_arg0, f41_arg1 )
			f41_local0[1] = f41_local1
		else
			f41_local1 = f41_local0[1]
		end
		return f41_local1
	else
		return Cac.IsCustomClassRestricted_Internal( f41_arg0, f41_arg1 )
	end
end

function IsAnyCustomClassRestricted_Internal( f42_arg0, f42_arg1, f42_arg2, f42_arg3, f42_arg4 )
	if Cac.IsCustomClassWeaponLootRestricted( f42_arg2, f42_arg3 ) then
		return true
	elseif f42_arg4 < Cac.GetEquippedWeaponCount( f42_arg2, f42_arg3 ) then
		return true
	elseif MatchRules.CustomClassIsRestricted( f42_arg0, f42_arg1, f42_arg2, f42_arg3 ) then
		return true
	else
		return false
	end
end

Cac.IsAnyCustomClassRestricted = function ( f43_arg0 )
	local f43_local0 = Cac.GetCustomClassLoc()
	if not Cac.IsMatchPresetClass( f43_local0 ) then
		if not MatchRules.AllowCustomClasses() then
			return true
		end
		local f43_local1 = Cac.GetCustomClassCount( f43_local0 )
		local f43_local2 = Cac.GetMaxEquippedWeaponCount( f43_local0 )
		local f43_local3 = CoD.GetStatsGroupForGameMode()
		local f43_local4 = Cac.GetSelectedControllerIndex()
		if f43_arg0 then
			if IsAnyCustomClassRestricted_Internal( f43_local4, f43_local3, f43_local0, Cac.CustomClassIndexForRestrictCheck, f43_local2 ) then
				Cac.IsAnyCustomClassRestrictedCache = true
				Cac.CustomClassIndexForRestrictCheck = 0
				return true
			end
			Cac.CustomClassIndexForRestrictCheck = Cac.CustomClassIndexForRestrictCheck + 1
			if Cac.CustomClassIndexForRestrictCheck == f43_local1 then
				Cac.CustomClassIndexForRestrictCheck = 0
				Cac.IsAnyCustomClassRestrictedCache = false
			end
			return Cac.IsAnyCustomClassRestrictedCache
		end
		for f43_local5 = 0, f43_local1 - 1, 1 do
			if IsAnyCustomClassRestricted_Internal( f43_local4, f43_local3, f43_local0, f43_local5, f43_local2 ) then
				return true
			end
		end
	end
	return false
end

Cac.NumScorestreakModuleUnlocked = function ( f44_arg0 )
	local f44_local0 = 0
	for f44_local1 = 1, 3, 1 do
		if Cac.IsItemUnlocked( f44_arg0, "scorestreak_module_" .. f44_local1 ) then
			f44_local0 = f44_local0 + 1
		end
	end
	return f44_local0
end

Cac.IsDefaultClassLocked = function ( f45_arg0, f45_arg1 )
	if f45_arg1 == 3 then
		return not Cac.IsItemUnlocked( f45_arg0, "feature_demolitions" )
	elseif f45_arg1 == 4 then
		return not Cac.IsItemUnlocked( f45_arg0, "feature_sniper" )
	else
		return false
	end
end

Cac.IsCustomClassDlcLocked = function ( f46_arg0, f46_arg1, f46_arg2 )
	if not Cac.IsMatchPresetClass( f46_arg1 ) and (f46_arg1 == "customClasses" or f46_arg1 == "privateMatchCustomClasses") and f46_arg2 >= 30 and (not Engine.HasExtendedLoadouts( f46_arg0 ) or not Cac.IsItemUnlocked( f46_arg0, Cac.ExtendedLoadoutUnlockRef )) then
		return true
	else
		return false
	end
end

Cac.IsCustomClassLocked = function ( f47_arg0, f47_arg1, f47_arg2 )
	if not Cac.IsMatchPresetClass( f47_arg1 ) then
		if f47_arg1 ~= "privateMatchCustomClasses" then
			if not Cac.IsItemUnlocked( f47_arg0, "feature_cac" ) then
				return true
			end
			local f47_local0 = Lobby.GetPlayerPrestigeLevel( f47_arg0 )
			assert( f47_local0 ~= -1, "Invalid Prestige Level" )
			if f47_arg2 > 4 and f47_arg2 < 30 and f47_local0 < f47_arg2 - 4 then
				return true
			end
		end
		if Cac.IsCustomClassDlcLocked( f47_arg0, f47_arg1, f47_arg2 ) then
			return true
		end
	end
	return false
end

f0_local2 = {
	Primary = function ( f48_arg0, f48_arg1 )
		return Cac.GetWeaponRestricted( f48_arg0, f48_arg1 )
	end,
	Primary_AttachKit = function ( f49_arg0, f49_arg1 )
		return Cac.GetAttachKitRestricted( f49_arg0 )
	end,
	Primary_FurnitureKit = function ( f50_arg0, f50_arg1 )
		return nil
	end,
	Primary_Camo = function ( f51_arg0, f51_arg1 )
		return nil
	end,
	Primary_Reticle = function ( f52_arg0, f52_arg1 )
		return nil
	end,
	Secondary = function ( f53_arg0, f53_arg1 )
		return Cac.GetWeaponRestricted( f53_arg0, f53_arg1 )
	end,
	Secondary_AttachKit = function ( f54_arg0, f54_arg1 )
		return Cac.GetAttachKitRestricted( f54_arg0 )
	end,
	Secondary_FurnitureKit = function ( f55_arg0, f55_arg1 )
		return nil
	end,
	Secondary_Camo = function ( f56_arg0, f56_arg1 )
		return nil
	end,
	Secondary_Reticle = function ( f57_arg0, f57_arg1 )
		return nil
	end,
	Lethal = function ( f58_arg0, f58_arg1 )
		return Cac.GetPerkRestricted( f58_arg0 )
	end,
	Tactical = function ( f59_arg0, f59_arg1 )
		return Cac.GetPerkRestricted( f59_arg0 )
	end,
	Perk_Slot1 = function ( f60_arg0, f60_arg1 )
		return Cac.GetPerkRestricted( f60_arg0 )
	end,
	Perk_Slot2 = function ( f61_arg0, f61_arg1 )
		return Cac.GetPerkRestricted( f61_arg0 )
	end,
	Perk_Slot3 = function ( f62_arg0, f62_arg1 )
		return Cac.GetPerkRestricted( f62_arg0 )
	end,
	Primary_AttachmentBase = function ( f63_arg0, f63_arg1 )
		return Cac.GetAttachBaseRestricted( f63_arg0 )
	end,
	Melee = function ( f64_arg0, f64_arg1 )
		return Cac.GetWeaponRestricted( f64_arg0, f64_arg1 )
	end
}
Cac.GetItemRestricted = function ( f65_arg0, f65_arg1, f65_arg2 )
	return f0_local2[f65_arg0]( f65_arg1, f65_arg2 )
end

f0_local3 = {
	Primary = function ( f66_arg0, f66_arg1 )
		return Cac.SetWeaponRestricted( f66_arg0, f66_arg1 )
	end,
	Primary_AttachKit = function ( f67_arg0, f67_arg1 )
		return nil
	end,
	Primary_FurnitureKit = function ( f68_arg0, f68_arg1 )
		return nil
	end,
	Primary_Camo = function ( f69_arg0, f69_arg1 )
		return nil
	end,
	Primary_Reticle = function ( f70_arg0, f70_arg1 )
		return nil
	end,
	Secondary = function ( f71_arg0, f71_arg1 )
		return Cac.SetWeaponRestricted( f71_arg0, f71_arg1 )
	end,
	Secondary_AttachKit = function ( f72_arg0, f72_arg1 )
		return nil
	end,
	Secondary_FurnitureKit = function ( f73_arg0, f73_arg1 )
		return nil
	end,
	Secondary_Camo = function ( f74_arg0, f74_arg1 )
		return nil
	end,
	Secondary_Reticle = function ( f75_arg0, f75_arg1 )
		return nil
	end,
	Lethal = function ( f76_arg0, f76_arg1 )
		return Cac.SetPerkRestricted( f76_arg0, f76_arg1 )
	end,
	Tactical = function ( f77_arg0, f77_arg1 )
		return Cac.SetPerkRestricted( f77_arg0, f77_arg1 )
	end,
	Perk_Slot1 = function ( f78_arg0, f78_arg1 )
		return Cac.SetPerkRestricted( f78_arg0, f78_arg1 )
	end,
	Perk_Slot2 = function ( f79_arg0, f79_arg1 )
		return Cac.SetPerkRestricted( f79_arg0, f79_arg1 )
	end,
	Perk_Slot3 = function ( f80_arg0, f80_arg1 )
		return Cac.SetPerkRestricted( f80_arg0, f80_arg1 )
	end,
	Primary_AttachmentBase = function ( f81_arg0, f81_arg1 )
		return Cac.SetAttachBaseRestricted( f81_arg0, f81_arg1 )
	end,
	Melee = function ( f82_arg0, f82_arg1 )
		return Cac.SetWeaponRestricted( f82_arg0, f82_arg1 )
	end
}
Cac.SetItemRestricted = function ( f83_arg0, f83_arg1, f83_arg2 )
	return f0_local3[f83_arg0]( f83_arg1, f83_arg2 )
end

f0_local4 = {
	Primary = function ( f84_arg0, f84_arg1 )
		return Cac.GetWeaponClassRestricted( f84_arg1 )
	end,
	Primary_AttachKit = function ( f85_arg0, f85_arg1 )
		return nil
	end,
	Primary_FurnitureKit = function ( f86_arg0, f86_arg1 )
		return nil
	end,
	Primary_Camo = function ( f87_arg0, f87_arg1 )
		return nil
	end,
	Primary_Reticle = function ( f88_arg0, f88_arg1 )
		return nil
	end,
	Secondary = function ( f89_arg0, f89_arg1 )
		return Cac.GetWeaponClassRestricted( f89_arg1 )
	end,
	Secondary_AttachKit = function ( f90_arg0, f90_arg1 )
		return nil
	end,
	Secondary_FurnitureKit = function ( f91_arg0, f91_arg1 )
		return nil
	end,
	Secondary_Camo = function ( f92_arg0, f92_arg1 )
		return nil
	end,
	Secondary_Reticle = function ( f93_arg0, f93_arg1 )
		return nil
	end,
	Lethal = function ( f94_arg0, f94_arg1 )
		return Cac.GetPerkClassRestricted( f94_arg0 )
	end,
	Tactical = function ( f95_arg0, f95_arg1 )
		return Cac.GetPerkClassRestricted( f95_arg0 )
	end,
	Perk_Slot1 = function ( f96_arg0, f96_arg1 )
		return Cac.GetPerkClassRestricted( f96_arg0 )
	end,
	Perk_Slot2 = function ( f97_arg0, f97_arg1 )
		return Cac.GetPerkClassRestricted( f97_arg0 )
	end,
	Perk_Slot3 = function ( f98_arg0, f98_arg1 )
		return Cac.GetPerkClassRestricted( f98_arg0 )
	end,
	Primary_AttachmentBase = function ( f99_arg0, f99_arg1 )
		return Cac.GetAttachClassRestricted( f99_arg1 )
	end,
	Melee = function ( f100_arg0, f100_arg1 )
		return Cac.GetWeaponClassRestricted( f100_arg1 )
	end
}
Cac.GetItemClassRestricted = function ( f101_arg0, f101_arg1 )
	return f0_local4[f101_arg0]( f101_arg0, f101_arg1 )
end

f0_local5 = {
	Primary = function ( f102_arg0, f102_arg1, f102_arg2 )
		return Cac.SetWeaponClassRestricted( f102_arg1, f102_arg2 )
	end,
	Primary_AttachKit = function ( f103_arg0, f103_arg1, f103_arg2 )
		return nil
	end,
	Primary_FurnitureKit = function ( f104_arg0, f104_arg1, f104_arg2 )
		return nil
	end,
	Primary_Camo = function ( f105_arg0, f105_arg1, f105_arg2 )
		return nil
	end,
	Primary_Reticle = function ( f106_arg0, f106_arg1, f106_arg2 )
		return nil
	end,
	Secondary = function ( f107_arg0, f107_arg1, f107_arg2 )
		return Cac.SetWeaponClassRestricted( f107_arg1, f107_arg2 )
	end,
	Secondary_AttachKit = function ( f108_arg0, f108_arg1, f108_arg2 )
		return nil
	end,
	Secondary_FurnitureKit = function ( f109_arg0, f109_arg1, f109_arg2 )
		return nil
	end,
	Secondary_Camo = function ( f110_arg0, f110_arg1, f110_arg2 )
		return nil
	end,
	Secondary_Reticle = function ( f111_arg0, f111_arg1, f111_arg2 )
		return nil
	end,
	Lethal = function ( f112_arg0, f112_arg1, f112_arg2 )
		return Cac.SetPerkClassRestricted( f112_arg0, f112_arg2 )
	end,
	Tactical = function ( f113_arg0, f113_arg1, f113_arg2 )
		return Cac.SetPerkClassRestricted( f113_arg0, f113_arg2 )
	end,
	Perk_Slot1 = function ( f114_arg0, f114_arg1, f114_arg2 )
		return Cac.SetPerkClassRestricted( f114_arg0, f114_arg2 )
	end,
	Perk_Slot2 = function ( f115_arg0, f115_arg1, f115_arg2 )
		return Cac.SetPerkClassRestricted( f115_arg0, f115_arg2 )
	end,
	Perk_Slot3 = function ( f116_arg0, f116_arg1, f116_arg2 )
		return Cac.SetPerkClassRestricted( f116_arg0, f116_arg2 )
	end,
	Primary_AttachmentBase = function ( f117_arg0, f117_arg1, f117_arg2 )
		return Cac.SetAttachClassRestricted( f117_arg1, f117_arg2 )
	end,
	Melee = function ( f118_arg0, f118_arg1, f118_arg2 )
		return Cac.SetWeaponClassRestricted( f118_arg1, f118_arg2 )
	end
}
Cac.SetItemClassRestricted = function ( f119_arg0, f119_arg1, f119_arg2 )
	return f0_local5[f119_arg0]( f119_arg0, f119_arg1, f119_arg2 )
end

Cac.GetWeaponClassRestricted = function ( f120_arg0 )
	return MatchRules.GetData( "commonOption", "weaponClassRestricted", f120_arg0 )
end

Cac.SetWeaponClassRestricted = function ( f121_arg0, f121_arg1 )
	MatchRules.SetData( "commonOption", "weaponClassRestricted", f121_arg0, f121_arg1 )
end

Cac.GetWeaponRestricted = function ( f122_arg0, f122_arg1 )
	if Cac.IsWeaponLootRestricted( f122_arg1 ) then
		return true
	else
		return MatchRules.GetData( "commonOption", "weaponRestricted", f122_arg0 )
	end
end

Cac.SetWeaponRestricted = function ( f123_arg0, f123_arg1 )
	MatchRules.SetData( "commonOption", "weaponRestricted", f123_arg0, f123_arg1 )
end

Cac.GetAttachKitRestricted = function ( f124_arg0 )
	return false
end

Cac.GetAttachBaseRestricted = function ( f125_arg0 )
	return MatchRules.GetData( "commonOption", "attachmentBaseRestricted", f125_arg0 )
end

Cac.SetAttachBaseRestricted = function ( f126_arg0, f126_arg1 )
	MatchRules.SetData( "commonOption", "attachmentBaseRestricted", f126_arg0, f126_arg1 )
end

Cac.GetAttachClassRestricted = function ( f127_arg0 )
	return MatchRules.GetData( "commonOption", "attachmentClassRestricted", f127_arg0 )
end

Cac.SetAttachClassRestricted = function ( f128_arg0, f128_arg1 )
	MatchRules.SetData( "commonOption", "attachmentClassRestricted", f128_arg0, f128_arg1 )
end

Cac.GetPerkClassRestricted = function ( f129_arg0 )
	return MatchRules.GetData( "commonOption", "perkClassRestricted", f129_arg0 )
end

Cac.SetPerkClassRestricted = function ( f130_arg0, f130_arg1 )
	return MatchRules.SetData( "commonOption", "perkClassRestricted", f130_arg0, f130_arg1 )
end

Cac.GetPerkRestricted = function ( f131_arg0 )
	return MatchRules.GetData( "commonOption", "perkRestricted", f131_arg0 )
end

Cac.SetPerkRestricted = function ( f132_arg0, f132_arg1 )
	MatchRules.SetData( "commonOption", "perkRestricted", f132_arg0, f132_arg1 )
end

Cac.GetAllStreaksRestricted = function ()
	return MatchRules.GetData( "commonOption", "allStreaksRestricted" )
end

Cac.SetAllStreaksRestricted = function ( f134_arg0 )
	return MatchRules.SetData( "commonOption", "allStreaksRestricted", f134_arg0 )
end

Cac.GetStreakRestricted = function ( f135_arg0 )
	return MatchRules.GetData( "commonOption", "killstreakRestricted", f135_arg0 )
end

Cac.SetStreakRestricted = function ( f136_arg0, f136_arg1 )
	MatchRules.SetData( "commonOption", "killstreakRestricted", f136_arg0, f136_arg1 )
end

Cac.GetModuleClassRestricted = function ( f137_arg0 )
	return MatchRules.GetData( "commonOption", "moduleClassRestricted", f137_arg0 )
end

Cac.SetModuleClassRestricted = function ( f138_arg0, f138_arg1 )
	return MatchRules.SetData( "commonOption", "moduleClassRestricted", f138_arg0, f138_arg1 )
end

Cac.GetModuleRestricted = function ( f139_arg0 )
	return MatchRules.GetData( "commonOption", "moduleRestricted", f139_arg0 )
end

Cac.SetModuleRestricted = function ( f140_arg0, f140_arg1 )
	MatchRules.SetData( "commonOption", "moduleRestricted", f140_arg0, f140_arg1 )
end

Cac.GetCustomClassLoc = function ()
	local f141_local0 = "customClasses"
	if (not GameX.IsRankedMatch() or Engine.GetSystemLink()) and not Engine.GetDvarBool( "force_ranking" ) then
		f141_local0 = "privateMatchCustomClasses"
	end
	return f141_local0
end

Cac.DefaultClassLocations = {
	defaultClassesTeam0 = true,
	defaultClassesTeam1 = true,
	defaultClassesTeam2 = true,
	defaultClassesTeam3 = true
}
Cac.IsMatchPresetClass = function ( f142_arg0 )
	assert( f142_arg0 ~= nil, "Class location is a required parameter." )
	return Cac.DefaultClassLocations[f142_arg0]
end

Cac.IsClassInUse = function ( f143_arg0, f143_arg1 )
	if not Cac.IsMatchPresetClass( f143_arg0 ) then
		return true
	else
		local f143_local0 = Cac.Settings.DataLoc[f143_arg0].teamName
		if MatchRules.IsUsingMatchRulesData() then
			return MatchRules.GetData( "defaultClasses", f143_local0, "defaultClass", f143_arg1, "class", "inUse" )
		else
			return false
		end
	end
end

Cac.SetClassInUse = function ( f144_arg0, f144_arg1, f144_arg2 )
	if f144_arg2 == nil then
		f144_arg2 = true
	end
	return Cac.SetCacConfig( Cac.GetSelectedControllerIndex(), f144_arg0, f144_arg1, "inUse", f144_arg2 )
end

Cac.HasCustomClasses = function ( f145_arg0 )
	local f145_local0 = false
	for f145_local1 = 0, Cac.GetCustomClassCount( f145_arg0 ) - 1, 1 do
		if Cac.IsClassInUse( f145_arg0, f145_local1 ) then
			f145_local0 = true
			break
		end
	end
	return f145_local0
end

Cac.GetCustomClassName = function ( f146_arg0, f146_arg1 )
	local f146_local0 = Cac.GetSelectedControllerIndex()
	if f146_arg1 == nil then
		f146_arg1 = Cac.GetSelectedClassIndex( f146_arg0 )
	end
	local f146_local1 = Cac.GetCacConfig( f146_local0, f146_arg0, f146_arg1, "name" )
	if f146_local1 == "" then
		f146_local1 = Engine.Localize( "@LUA_MENU_LOADOUT_DEFAULT_NAME", f146_arg1 + 1 )
	end
	return f146_local1
end

Cac.SetCustomClassName = function ( f147_arg0, f147_arg1, f147_arg2 )
	assert( f147_arg0 )
	Cac.SetCacConfig( Cac.GetSelectedControllerIndex(), f147_arg1, f147_arg2, "name", f147_arg0 )
end

Cac.GenerateCustomClassIndex = function ( f148_arg0, f148_arg1, f148_arg2 )
	return f148_arg0
end

Cac.GenerateDefaultClassIndex = function ( f149_arg0, f149_arg1, f149_arg2 )
	if Cac.IsClassInUse( f149_arg1, f149_arg0 ) then
		local f149_local0 = 1
		if f149_arg1 == "defaultClassesTeam1" then
			f149_local0 = 0
		end
		return f149_arg0 + 200 + 6 * f149_local0
	else
		return f149_arg0 + 100
	end
end

Cac.GetDefaultClassCount = function ()
	return 5
end

Cac.GetDefaultClassName = function ( f151_arg0 )
	local f151_local0 = nil
	return Engine.Localize( "@" .. Engine.TableLookup( ClassTable.File, ClassTable.Cols.Lookup, "loadoutName", ClassTable.Cols.Slot1 + f151_arg0 ) )
end

Cac.GetDefaultClassLoadoutItem = function ( f152_arg0, f152_arg1 )
	return Engine.TableLookup( ClassTable.File, ClassTable.Cols.Lookup, f152_arg0, ClassTable.Cols.Slot1 + f152_arg1 )
end

Cac.GetDefaultClassConfig = function ( f153_arg0, f153_arg1, f153_arg2, f153_arg3, f153_arg4, f153_arg5 )
	if f153_arg2 == "name" then
		if Cac.IsCarrierClassSlot( f153_arg1, f153_arg0 ) then
			return Cac.GetCarrierClassName( f153_arg0 )
		else
			return Cac.GetDefaultClassName( f153_arg1 )
		end
	end
	local f153_local0 = Cac.GetDefaultClassLoadoutItem
	if f153_arg2 == "weaponSetups" then
		if f153_arg3 == 0 then
			if f153_arg4 == "weapon" then
				return f153_local0( "loadoutPrimary", f153_arg1 )
			elseif f153_arg4 == "kit" then
				if f153_arg5 == "attachKit" then
					return f153_local0( "loadoutPrimaryAttachKit", f153_arg1 )
				elseif f153_arg5 == "furnitureKit" then
					return f153_local0( "loadoutPrimaryFurnitureKit", f153_arg1 )
				end
			elseif f153_arg4 == "camo" then
				return f153_local0( "loadoutPrimaryCamo", f153_arg1 )
			elseif f153_arg4 == "reticle" then
				return f153_local0( "loadoutPrimaryReticle", f153_arg1 )
			end
		elseif f153_arg3 == 1 then
			if f153_arg4 == "weapon" then
				return f153_local0( "loadoutSecondary", f153_arg1 )
			elseif f153_arg4 == "kit" then
				if f153_arg5 == "attachKit" then
					return f153_local0( "loadoutSecondaryAttachKit", f153_arg1 )
				elseif f153_arg5 == "furnitureKit" then
					return f153_local0( "loadoutSecondaryFurnitureKit", f153_arg1 )
				end
			elseif f153_arg4 == "camo" then
				return f153_local0( "loadoutSecondaryCamo", f153_arg1 )
			elseif f153_arg4 == "reticle" then
				return f153_local0( "loadoutSecondaryReticle", f153_arg1 )
			end
		end
	elseif f153_arg2 == "equipment" then
		if f153_arg3 == 0 then
			return f153_local0( "loadoutEquipment", f153_arg1 )
		elseif f153_arg3 == 1 then
			return f153_local0( "loadoutOffHand", f153_arg1 )
		end
	elseif f153_arg2 == "perkSlots" then
		if f153_arg3 == 0 then
			return f153_local0( "loadoutPerk1", f153_arg1 )
		elseif f153_arg3 == 1 then
			return f153_local0( "loadoutPerk2", f153_arg1 )
		elseif f153_arg3 == 2 then
			return f153_local0( "loadoutPerk3", f153_arg1 )
		end
	elseif f153_arg2 == "meleeWeapon" then
		return f153_local0( "meleeWeapon", f153_arg1 )
	end
	return nil
end

Cac.StripMPSuffix = function ( f154_arg0 )
	local f154_local0 = f154_arg0
	local f154_local1 = string.len( f154_arg0 )
	if string.sub( f154_arg0, f154_local1 - 2 ) == "_mp" then
		f154_local0 = string.sub( f154_arg0, 0, f154_local1 - 3 )
	end
	return f154_local0
end

Cac.Addh1Prefix = function ( f155_arg0 )
	local f155_local0 = f155_arg0
	if string.sub( f155_arg0, 1, 3 ) ~= "h1_" then
		f155_local0 = "h1_" .. f155_arg0
	end
	return f155_local0
end

Cac.GetGameModeList = function ( f156_arg0 )
	assert( Cac.GameModes.Data[f156_arg0].List )
	return Cac.GameModes.Data[f156_arg0].List
end

Cac.GetWeaponIterator = function ( f157_arg0, f157_arg1, f157_arg2, f157_arg3 )
	local f157_local0 = {}
	local f157_local1 = false
	f157_local0.weaponNameArray = {}
	if f157_arg0 and #f157_arg0 > 0 then
		for f157_local19, f157_local20 in pairs( f157_arg0 ) do
			for f157_local14, f157_local15 in ipairs( f157_local20 ) do
				for f157_local8, f157_local9 in pairs( f157_local15 ) do
					local f157_local11 = f157_local9[1]
					local f157_local12 = f157_local9[2]
					local f157_local13 = f157_local9[3]
					if not f157_arg3 or f157_arg3 == f157_local11 then
						f157_local0.weaponNameArray[#f157_local0.weaponNameArray + 1] = f157_local11
						if f157_local12 and f157_local12 > 0 and not f157_arg1 then
							for f157_local5 = 0, f157_local12 - 1, 1 do
								f157_local0.weaponNameArray[#f157_local0.weaponNameArray + 1] = f157_local11 .. "loot" .. f157_local5
							end
						end
						if f157_arg2 and f157_local13 ~= nil then
							f157_local0.weaponNameArray[#f157_local0.weaponNameArray + 1] = f157_local13
						end
						if f157_arg3 then
							f157_local1 = true
						end
					end
				end
				if f157_local1 then
					
				end
			end
			if f157_local1 then
				
			end
		end
	end
	f157_local0.index = 0
	f157_local0.weaponName = nil
	if #f157_local0.weaponNameArray > 0 then
		f157_local0.index = 1
		f157_local0.weaponName = f157_local0.weaponNameArray[f157_local0.index]
	end
	f157_local0.GetWeaponName = function ( f158_arg0 )
		return f158_arg0.weaponName
	end
	
	f157_local0.Advance = function ( f159_arg0 )
		if f159_arg0.index > 0 then
			f159_arg0.index = f159_arg0.index + 1
			if #f159_arg0.weaponNameArray < f159_arg0.index then
				f159_arg0.done = true
				f159_arg0.weaponName = nil
			else
				f159_arg0.weaponName = f159_arg0.weaponNameArray[f159_arg0.index]
			end
		end
	end
	
	return f157_local0
end

Cac.IsWeaponLootRestricted = function ( f160_arg0 )
	local f160_local0 = nil
	local f160_local1 = false
	if f160_arg0 and false then
		f160_local1 = f160_arg0 ~= Cac.GetWeaponNameFromLootName( f160_arg0 )
	end
	return f160_local1
end

Cac.GetWeaponNameFromLootName = function ( f161_arg0 )
	return Engine.GetLootWeaponBaseName( f161_arg0 )
end

Cac.GetWeaponTypeFromWeapon = function ( f162_arg0, f162_arg1 )
	for f162_local6, f162_local7 in ipairs( Cac.Weapons[f162_arg0] ) do
		for f162_local3, f162_local4 in pairs( f162_local7 ) do
			if f162_arg1 == f162_local4[1] then
				return Cac.Weapons[f162_arg0].Keys[f162_local6]
			end
		end
	end
	f162_local0, f162_local1, f162_local2 = ipairs( Cac.Weapons[f162_arg0] )
	f162_local6, f162_local7 = f162_local0( f162_local1, f162_local2 )
	if f162_local6 ~= nil then
		f162_local2 = f162_local6
		return Cac.Weapons[f162_arg0].Keys[f162_local6]
	else
		
	end
end

Cac.GetWeaponTypeFromWeaponWithoutCategory = function ( f163_arg0 )
	for f163_local6, f163_local7 in ipairs( Cac.Weapons.Primary ) do
		for f163_local3, f163_local4 in pairs( f163_local7 ) do
			if f163_arg0 == f163_local4[1] then
				return Cac.Weapons.Primary.Keys[f163_local6]
			end
		end
	end
	for f163_local6, f163_local7 in ipairs( Cac.Weapons.Secondary ) do
		for f163_local3, f163_local4 in pairs( f163_local7 ) do
			if f163_arg0 == f163_local4[1] then
				return Cac.Weapons.Secondary.Keys[f163_local6]
			end
		end
	end
end

Cac.GetWeaponTypeDisplayName = function ( f164_arg0, f164_arg1, f164_arg2 )
	if f164_arg2 == "iw5_combatknife" then
		return ""
	elseif Cac.Weapons[f164_arg0] and Cac.Weapons[f164_arg0].DisplayNamesSingle and Cac.Weapons[f164_arg0].DisplayNamesSingle[f164_arg1] then
		return Engine.Localize( Cac.Weapons[f164_arg0].DisplayNamesSingle[f164_arg1] )
	else
		return ""
	end
end

Cac.GetWeaponCategoryFromWeapon = function ( f165_arg0, f165_arg1 )
	for f165_local11, f165_local12 in pairs( Cac.Weapons ) do
		for f165_local6, f165_local7 in ipairs( f165_local12 ) do
			for f165_local3, f165_local4 in pairs( f165_local7 ) do
				if string.find( f165_arg0, f165_local4[1] ) == 1 then
					return f165_local11
				end
			end
		end
	end
	if f165_arg1 then
		return nil
	else
		return "Primary"
	end
end

Cac.NotPreorderWeapon = function ( f166_arg0 )
	for f166_local3, f166_local4 in pairs( Cac.PreorderWeaponSuffices ) do
		if string.find( f166_arg0[1], f166_local4 ) ~= nil then
			return false
		end
	end
	return true
end

Cac.ItemsForProdLevel = function ( f167_arg0, f167_arg1 )
	if LUI.MPLootDropsBase.IsLootDropInList( LUI.MPLootDropsBase.GetLootDropListFromString( f167_arg1 ), Engine.TableLookup( StatsTable.File, StatsTable.Cols.GUID, f167_arg0, StatsTable.Cols.ProdLevel ), Engine.TableLookup( StatsTable.File, StatsTable.Cols.GUID, f167_arg0, StatsTable.Cols.ContentPromo ) ) then
		return true
	else
		return false
	end
end

Cac.IsValidLootdrop = function ( f168_arg0 )
	local f168_local0
	if f168_arg0 ~= "" and f168_arg0 ~= "Gold" and f168_arg0 ~= "LootDrop1" and f168_arg0 ~= "LootDrop2" and f168_arg0 ~= "LootDrop3" and f168_arg0 ~= "LootDrop4" and f168_arg0 ~= "LootDrop5" and f168_arg0 ~= "LootDrop6" then
		f168_local0 = false
	else
		f168_local0 = true
	end
	return f168_local0
end

Cac.GetAllDefinedAndValidWeapons = function ( f169_arg0, f169_arg1, f169_arg2, f169_arg3, f169_arg4, f169_arg5, f169_arg6 )
	local f169_local0 = {}
	if f169_arg0 == "Primary_AttachKit" or f169_arg0 == "Secondary_AttachKit" then
		local f169_local1 = nil
		local f169_local2 = ""
		if f169_arg0 == "Primary_AttachKit" then
			f169_local2 = "Primary"
		else
			f169_local2 = "Secondary"
		end
		if f169_arg6 then
			f169_local1 = f169_arg6
		else
			f169_local1 = Cac.GetEquippedWeapon( f169_local2, 0, f169_arg2, f169_arg3 )
		end
		f169_local0 = Cac.GetValidAttachKits( f169_arg5, f169_local1, f169_local2 )
	elseif f169_arg0 == "Primary_FurnitureKit" or f169_arg0 == "Secondary_FurnitureKit" then
		local f169_local1 = nil
		local f169_local2 = ""
		if f169_arg0 == "Primary_FurnitureKit" then
			f169_local2 = "Primary"
		else
			f169_local2 = "Secondary"
		end
		if f169_arg6 then
			f169_local1 = f169_arg6
		else
			f169_local1 = Cac.GetEquippedWeapon( f169_local2, 0, f169_arg2, f169_arg3 )
		end
		f169_local0 = Cac.GetValidFurnitureKits( f169_arg5, f169_local1, f169_local2 )
	else
		assert( Cac.Weapons[f169_arg0][f169_arg1] )
		local f169_local1 = function ( f170_arg0 )
			if Engine.Inventory_GetItemTypeByReference( f170_arg0[1] ) == Cac.InventoryItemType.Entitlement then
				local f170_local0, f170_local1, f170_local2 = Cac.GetItemLockState( f169_arg5, nil, f170_arg0[1] )
				if f170_local0 == "Hidden" then
					return false
				elseif not Engine.Inventory_IsItemUsableForPlayer( f169_arg5, f170_arg0[1] ) and f170_local1 ~= Cac.ItemLockStatus.DlcRequired then
					return false
				end
			else
				local f170_local0, f170_local1, f170_local2 = Cac.GetItemLockState( f169_arg5, nil, f170_arg0[1], nil, f169_arg6 )
				if f170_local0 == "Hidden" then
					return false
				end
			end
			return true
		end
		
		local f169_local2 = Cac.Weapons[f169_arg0][f169_arg1]
		for f169_local3 = 1, #f169_local2, 1 do
			if f169_arg4 then
				if f169_arg4( f169_local2[f169_local3] ) and f169_local1( f169_local2[f169_local3] ) then
					table.insert( f169_local0, f169_local2[f169_local3] )
				end
			end
			if f169_local1( f169_local2[f169_local3] ) then
				table.insert( f169_local0, f169_local2[f169_local3] )
			end
		end
	end
	if not Engine.IsDepotEnabled() then
		for f169_local1 = #f169_local0, 1, -1 do
			if Engine.Inventory_GetItemTypeByReference( f169_local0[f169_local1][1] ) ~= Cac.InventoryItemType.Default then
				table.remove( f169_local0, f169_local1 )
			end
		end
	end
	local f169_local1 = nil
	if f169_arg0 == "Primary_Camo" or f169_arg0 == "Secondary_Camo" then
		f169_local1 = CamoTable
	elseif f169_arg0 == "Primary_Reticle" or f169_arg0 == "Secondary_Reticle" then
		f169_local1 = ReticleTable
	end
	if f169_local1 ~= nil then
		local f169_local2 = Cac.GetWeaponTypeFromWeaponWithoutCategory( f169_arg6 )
		local f169_local3 = {
			weapon_assault = 0,
			weapon_smg = 1,
			weapon_heavy = 2,
			weapon_shotgun = 3,
			weapon_sniper = 4,
			weapon_pistol = 5
		}
		local f169_local4 = f169_local3[f169_local2]
		for f169_local5 = #f169_local0, 1, -1 do
			local f169_local8 = false
			local f169_local9 = f169_local0[f169_local5][1]
			local f169_local10 = false
			for f169_local11 = 0, 5, 1 do
				local f169_local14 = Engine.TableLookup( f169_local1.File, f169_local1.Cols.Ref, f169_local9, f169_local1.Cols.ARGuid + f169_local11 )
				if f169_local14 ~= nil and f169_local14 ~= "" then
					f169_local8 = true
					if f169_local4 == f169_local11 then
						f169_local10 = true
					end
				end
			end
			if f169_local8 == true and f169_local10 == false then
				table.remove( f169_local0, f169_local5 )
			end
		end
	end
	return f169_local0
end

Cac.WeaponHasAttachKitsAvailable = function ( f171_arg0, f171_arg1, f171_arg2 )
	local f171_local0 = nil
	f171_local0 = Cac.GetValidAttachKits( f171_arg0, f171_arg1, f171_arg2 )
	if #f171_local0 > 1 or f171_local0[1][1] ~= "none" then
		return true
	else
		return false
	end
end

Cac.DoesWeaponSupportAttachKit = function ( f172_arg0, f172_arg1 )
	local f172_local0 = f172_arg0 .. "_mp"
	local f172_local1 = AttachKitTable.Cols.Attach1
	local f172_local2 = AttachKitTable.Cols.Attach4
	for f172_local3 = f172_local1, f172_local2, 1 do
		local f172_local6 = Engine.TableLookupByRow( AttachKitTable.File, f172_arg1, f172_local3 )
		if f172_local6 == nil or f172_local6 == "" then
			return true
		elseif not Engine.DoesWeaponSupportAttachment( f172_local0, f172_local6 ) then
			return false
		end
	end
	return true
end

Cac.GetValidAttachKits = function ( f173_arg0, f173_arg1, f173_arg2 )
	local f173_local0, f173_local1, f173_local2 = nil
	local f173_local3 = {
		[#f173_local3 + 1] = {
			"none",
			0
		}
	}
	if (f173_arg1 == "h1_mp44" or f173_arg1 == "h1_deserteagle" or f173_arg1 == "h1_deserteagle55") and not Engine.GetDvarBool( "unlockDevAttachments" ) then
		f173_local2 = true
	end
	f173_local1 = Cac.KitWeaponTypes[Cac.GetWeaponTypeFromWeapon( f173_arg2, f173_arg1 )]
	if f173_local1 ~= nil then
		local f173_local4 = Engine.TableGetRowCount( AttachKitTable.File )
		for f173_local5 = 1, f173_local4 - 1, 1 do
			if Cac.IsValidLootdrop( Engine.TableLookupByRow( AttachKitTable.File, f173_local5, AttachKitTable.Cols.Lootdrop ) ) then
				local f173_local8 = nil
				local f173_local9 = Engine.TableLookupByRow( AttachKitTable.File, f173_local5, AttachKitTable.Cols.Valid )
				if f173_local9 == "" then
					f173_local8 = true
				else
					for f173_local13 in string.gmatch( f173_local9, "%a+" ) do
						if f173_local13 == f173_local1 then
							f173_local8 = true
							break
						end
					end
				end
				if f173_local8 ~= nil then
					local f173_local10 = nil
					local f173_local11 = Engine.TableLookupByRow( AttachKitTable.File, f173_local5, AttachKitTable.Cols.GlobalID )
					if f173_local2 ~= nil and Engine.Inventory_GetItemTypeByGuid( f173_local11 ) == Cac.InventoryItemType.Default then
						f173_local10 = true
					end
					if f173_local10 == nil then
						local f173_local13 = string.sub( Engine.TableLookupByRow( AttachKitTable.File, f173_local5, AttachKitTable.Cols.Ref ), 1, 3 ) == "dev"
						local f173_local14 = nil
						if f173_local13 and not Engine.GetDvarBool( "unlockDevAttachments" ) then
							f173_local14 = true
						end
						if f173_local14 == nil and Cac.DoesWeaponSupportAttachKit( f173_arg1, f173_local5 ) then
							local f173_local15, f173_local16, f173_local17 = Cac.GetItemLockState( f173_arg0, f173_local11, nil, false )
							if f173_local15 ~= "Hidden" then
								local f173_local18 = Engine.TableLookupByRow( AttachKitTable.File, f173_local5, AttachKitTable.Cols.Ref )
								local f173_local19, f173_local20, f173_local21 = Cac.GetItemLockState( f173_arg0, nil, Cac.GetUnlockItemRef( f173_local18, f173_arg1 ), false )
								f173_local17 = f173_local21
								f173_local16 = f173_local20
								if f173_local19 ~= "Hidden" and f173_local18 ~= nil and f173_local18 ~= "" and f173_local18 ~= "none" then
									f173_local3[#f173_local3 + 1] = {
										f173_local18,
										0
									}
								end
							end
						end
					end
				end
			end
		end
	end
	return f173_local3
end

Cac.WeaponHasFurnitureKitsAvailable = function ( f174_arg0, f174_arg1, f174_arg2 )
	local f174_local0 = nil
	f174_local0 = Cac.GetValidFurnitureKits( f174_arg0, f174_arg1, f174_arg2 )
	if #f174_local0 > 1 or f174_local0[1][1] ~= "none" then
		return true
	else
		return false
	end
end

Cac.GetValidFurnitureKits = function ( f175_arg0, f175_arg1, f175_arg2 )
	local f175_local0, f175_local1 = nil
	local f175_local2 = {}
	f175_local1 = Cac.KitWeaponTypes[Cac.GetWeaponTypeFromWeapon( f175_arg2, f175_arg1 )]
	if f175_local1 ~= nil then
		local f175_local3 = Engine.TableGetRowCount( FurnitureKitTable.File )
		for f175_local4 = 1, f175_local3 - 1, 1 do
			if Engine.TableLookupByRow( FurnitureKitTable.File, f175_local4, FurnitureKitTable.Cols.Id ) ~= "*" and Cac.IsValidLootdrop( Engine.TableLookupByRow( FurnitureKitTable.File, f175_local4, FurnitureKitTable.Cols.Lootdrop ) ) then
				local f175_local7 = nil
				local f175_local8 = Engine.TableLookupByRow( FurnitureKitTable.File, f175_local4, FurnitureKitTable.Cols.Valid )
				if f175_local8 ~= "" then
					for f175_local12 in string.gmatch( f175_local8, "%a+" ) do
						if f175_local12 == f175_local1 then
							f175_local7 = true
							break
						end
					end
				end
				if f175_local7 ~= nil then
					local f175_local9 = nil
					local f175_local11, f175_local12, f175_local13 = Cac.GetItemLockState( f175_arg0, Engine.TableLookupByRow( FurnitureKitTable.File, f175_local4, FurnitureKitTable.Cols.GlobalID ), nil, false )
					if f175_local11 ~= "Hidden" then
						local f175_local14 = Engine.TableLookupByRow( FurnitureKitTable.File, f175_local4, FurnitureKitTable.Cols.Ref )
						if f175_local14 ~= "none" then
							local f175_local15, f175_local16, f175_local17 = Cac.GetItemLockState( f175_arg0, nil, Cac.GetUnlockItemRef( f175_local14, f175_arg1 ), false )
							f175_local13 = f175_local17
							f175_local12 = f175_local16
							if f175_local15 ~= "Hidden" and f175_local14 ~= nil and f175_local14 ~= "" and f175_local14 ~= "none" then
								f175_local2[#f175_local2 + 1] = {
									f175_local14,
									0
								}
							end
						end
					end
				end
			end
		end
	end
	return f175_local2
end

f0_local6 = {
	firerate = true,
	xmags = true,
	dualmag = true,
	heatsink = true,
	tactical = true,
	akimbo = true,
	stock = true,
	longrange = true,
	silencersniper = true,
	silencerpistol = true,
	silencer01 = true,
	quickdraw = true
}
Cac.WeaponHasModAttachmentsAvailable = function ( f176_arg0 )
	for f176_local0 = 1, StatsTable.AttachmentCount, 1 do
		if f0_local6[Engine.TableLookup( StatsTable.File, StatsTable.Cols.Ref, f176_arg0, StatsTable.Cols.FirstWeaponAttachment + f176_local0 - 1 )] then
			return true
		end
	end
	return false
end

f0_local7 = {
	Primary = function ( f177_arg0, f177_arg1 )
		return 1
	end,
	Primary_AttachKit = function ( f178_arg0, f178_arg1 )
		return 1
	end,
	Primary_FurnitureKit = function ( f179_arg0, f179_arg1 )
		return 1
	end,
	Primary_Camo = function ( f180_arg0, f180_arg1 )
		return 1
	end,
	Primary_Reticle = function ( f181_arg0, f181_arg1 )
		return 1
	end,
	Secondary = function ( f182_arg0, f182_arg1 )
		return 1
	end,
	Secondary_AttachKit = function ( f183_arg0, f183_arg1 )
		return 1
	end,
	Secondary_FurnitureKit = function ( f184_arg0, f184_arg1 )
		return 1
	end,
	Secondary_Camo = function ( f185_arg0, f185_arg1 )
		return 1
	end,
	Secondary_Reticle = function ( f186_arg0, f186_arg1 )
		return 1
	end,
	Lethal = function ( f187_arg0, f187_arg1 )
		return 1
	end,
	Tactical = function ( f188_arg0, f188_arg1 )
		return 1
	end,
	Perk_Slot1 = function ( f189_arg0, f189_arg1 )
		return 1
	end,
	Perk_Slot2 = function ( f190_arg0, f190_arg1 )
		return 1
	end,
	Perk_Slot3 = function ( f191_arg0, f191_arg1 )
		return 1
	end
}
Cac.GetWeaponSlotCount = function ( f192_arg0, f192_arg1, f192_arg2 )
	return f0_local7[f192_arg0]( f192_arg1, f192_arg2 )
end

Cac.GetEquippedWeaponCount = function ( f193_arg0, f193_arg1 )
	local f193_local0 = 0
	for f193_local6, f193_local7 in pairs( Cac.LimitedWeaponCategories ) do
		local f193_local8 = Cac.GetWeaponSlotCount( f193_local7, f193_arg0, f193_arg1 )
		for f193_local5 = 0, f193_local8 - 1, 1 do
			local f193_local4 = Cac.GetEquippedWeapon( f193_local7, f193_local5, f193_arg0, f193_arg1 )
			if f193_local4 ~= Cac.NullWeaponNames[f193_local7] and not Cac.IsWeaponRequired( f193_local7, f193_local4, f193_arg0, f193_arg1 ) then
				f193_local0 = f193_local0 + 1
			end
		end
	end
	return f193_local0
end

Cac.GetMaxEquippedWeaponCount = function ( f194_arg0 )
	if Cac.IsMatchPresetClass( f194_arg0 ) then
		return 20
	elseif MatchRules.IsUsingMatchRulesData() then
		return MatchRules.GetData( "commonOption", "classPickCount" )
	else
		return 13
	end
end

Cac.GetAllEquippedWeapons = function ( f195_arg0, f195_arg1, f195_arg2 )
	local f195_local0 = {}
	local f195_local1 = Cac.GetWeaponSlotCount( f195_arg0, f195_arg1, f195_arg2 )
	if f195_arg0 == "StreakModules" then
		local f195_local2 = Cac.GetWeaponSlotCount( "Streak", f195_arg1, f195_arg2 )
		for f195_local3 = 0, f195_local2 - 1, 1 do
			for f195_local6 = 0, f195_local1 - 1, 1 do
				f195_local0[#f195_local0 + 1] = Cac.GetEquippedWeapon( f195_arg0, f195_local3, f195_arg1, f195_arg2, false, f195_local6 )
			end
		end
	else
		for f195_local2 = 0, f195_local1 - 1, 1 do
			f195_local0[#f195_local0 + 1] = Cac.GetEquippedWeapon( f195_arg0, f195_local2, f195_arg1, f195_arg2 )
		end
	end
	return f195_local0
end

f0_local8 = function ( f196_arg0, f196_arg1, f196_arg2, f196_arg3, f196_arg4, f196_arg5 )
	assert( f196_arg3 == 0 )
	local f196_local0 = Cac.GetCacConfig( f196_arg0, f196_arg1, f196_arg2, "weaponSetups", f196_arg5, "kit", "attachKit" )
	local f196_local1 = nil
	if type( f196_local0 ) == "number" then
		f196_local1 = Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.Id, tostring( f196_local0 ), AttachKitTable.Cols.Ref )
	else
		f196_local1 = f196_local0
	end
	return f196_local1
end

f0_local9 = function ( f197_arg0, f197_arg1, f197_arg2, f197_arg3, f197_arg4, f197_arg5 )
	assert( f197_arg3 == 0 )
	local f197_local0 = Cac.GetCacConfig( f197_arg0, f197_arg1, f197_arg2, "weaponSetups", f197_arg5, "kit", "furnitureKit" )
	local f197_local1 = nil
	if type( f197_local0 ) == "number" then
		f197_local1 = Engine.TableLookup( FurnitureKitTable.File, FurnitureKitTable.Cols.Id, tostring( f197_local0 ), FurnitureKitTable.Cols.Ref )
	else
		f197_local1 = f197_local0
	end
	return f197_local1
end

f0_local10 = {
	Primary = function ( f198_arg0, f198_arg1, f198_arg2, f198_arg3, f198_arg4 )
		return Cac.GetDefaultClassConfig( f198_arg1, f198_arg2, "weaponSetups", 0, "weapon" )
	end,
	Primary_AttachKit = function ( f199_arg0, f199_arg1, f199_arg2, f199_arg3, f199_arg4 )
		return Cac.GetDefaultClassConfig( f199_arg1, f199_arg2, "weaponSetups", 0, "kit", "attachKit" )
	end,
	Primary_FurnitureKit = function ( f200_arg0, f200_arg1, f200_arg2, f200_arg3, f200_arg4 )
		return Cac.GetDefaultClassConfig( f200_arg1, f200_arg2, "weaponSetups", 0, "kit", "furnitureKit" )
	end,
	Primary_Camo = function ( f201_arg0, f201_arg1, f201_arg2, f201_arg3, f201_arg4 )
		assert( f201_arg3 == 0 )
		return Cac.GetDefaultClassConfig( f201_arg1, f201_arg2, "weaponSetups", 0, "camo" )
	end,
	Primary_Reticle = function ( f202_arg0, f202_arg1, f202_arg2, f202_arg3, f202_arg4 )
		assert( f202_arg3 == 0 )
		return Cac.GetDefaultClassConfig( f202_arg1, f202_arg2, "weaponSetups", 0, "reticle" )
	end,
	Secondary = function ( f203_arg0, f203_arg1, f203_arg2, f203_arg3, f203_arg4 )
		return Cac.GetDefaultClassConfig( f203_arg1, f203_arg2, "weaponSetups", 1, "weapon" )
	end,
	Secondary_AttachKit = function ( f204_arg0, f204_arg1, f204_arg2, f204_arg3, f204_arg4 )
		return Cac.GetDefaultClassConfig( f204_arg1, f204_arg2, "weaponSetups", 1, "kit", "attachKit" )
	end,
	Secondary_FurnitureKit = function ( f205_arg0, f205_arg1, f205_arg2, f205_arg3, f205_arg4 )
		return Cac.GetDefaultClassConfig( f205_arg1, f205_arg2, "weaponSetups", 1, "kit", "furnitureKit" )
	end,
	Secondary_Camo = function ( f206_arg0, f206_arg1, f206_arg2, f206_arg3, f206_arg4 )
		assert( f206_arg3 == 0 )
		return Cac.GetDefaultClassConfig( f206_arg1, f206_arg2, "weaponSetups", 1, "camo" )
	end,
	Secondary_Reticle = function ( f207_arg0, f207_arg1, f207_arg2, f207_arg3, f207_arg4 )
		assert( f207_arg3 == 0 )
		return Cac.GetDefaultClassConfig( f207_arg1, f207_arg2, "weaponSetups", 1, "reticle" )
	end,
	Lethal = function ( f208_arg0, f208_arg1, f208_arg2, f208_arg3, f208_arg4 )
		assert( f208_arg3 == 0 )
		return Cac.GetDefaultClassConfig( f208_arg1, f208_arg2, "equipment", 0 )
	end,
	Tactical = function ( f209_arg0, f209_arg1, f209_arg2, f209_arg3, f209_arg4 )
		assert( f209_arg3 == 0 )
		return Cac.GetDefaultClassConfig( f209_arg1, f209_arg2, "equipment", 1 )
	end,
	Perk_Slot1 = function ( f210_arg0, f210_arg1, f210_arg2, f210_arg3, f210_arg4 )
		return Cac.GetDefaultClassConfig( f210_arg1, f210_arg2, "perkSlots", f210_arg3 )
	end,
	Perk_Slot2 = function ( f211_arg0, f211_arg1, f211_arg2, f211_arg3, f211_arg4 )
		return Cac.GetDefaultClassConfig( f211_arg1, f211_arg2, "perkSlots", f211_arg3 + 1 )
	end,
	Perk_Slot3 = function ( f212_arg0, f212_arg1, f212_arg2, f212_arg3, f212_arg4 )
		return Cac.GetDefaultClassConfig( f212_arg1, f212_arg2, "perkSlots", f212_arg3 + 2 )
	end,
	Melee = function ( f213_arg0, f213_arg1, f213_arg2, f213_arg3, f213_arg4 )
		return Cac.GetDefaultClassConfig( f213_arg1, f213_arg2, "meleeWeapon" )
	end
}
f0_local11 = {
	Primary = function ( f214_arg0, f214_arg1, f214_arg2, f214_arg3, f214_arg4 )
		return Cac.GetCacConfig( f214_arg0, f214_arg1, f214_arg2, "weaponSetups", 0, "weapon" )
	end,
	Primary_AttachKit = function ( f215_arg0, f215_arg1, f215_arg2, f215_arg3, f215_arg4 )
		return f0_local8( f215_arg0, f215_arg1, f215_arg2, f215_arg3, f215_arg4, 0 )
	end,
	Primary_FurnitureKit = function ( f216_arg0, f216_arg1, f216_arg2, f216_arg3, f216_arg4 )
		return f0_local9( f216_arg0, f216_arg1, f216_arg2, f216_arg3, f216_arg4, 0 )
	end,
	Primary_Camo = function ( f217_arg0, f217_arg1, f217_arg2, f217_arg3, f217_arg4 )
		assert( f217_arg3 == 0 )
		return Cac.GetCacConfig( f217_arg0, f217_arg1, f217_arg2, "weaponSetups", 0, "camo" )
	end,
	Primary_Reticle = function ( f218_arg0, f218_arg1, f218_arg2, f218_arg3, f218_arg4 )
		assert( f218_arg3 == 0 )
		return Cac.GetCacConfig( f218_arg0, f218_arg1, f218_arg2, "weaponSetups", 0, "reticle" )
	end,
	Secondary = function ( f219_arg0, f219_arg1, f219_arg2, f219_arg3, f219_arg4 )
		return Cac.GetCacConfig( f219_arg0, f219_arg1, f219_arg2, "weaponSetups", 1, "weapon" )
	end,
	Secondary_AttachKit = function ( f220_arg0, f220_arg1, f220_arg2, f220_arg3, f220_arg4 )
		return f0_local8( f220_arg0, f220_arg1, f220_arg2, f220_arg3, f220_arg4, 1 )
	end,
	Secondary_FurnitureKit = function ( f221_arg0, f221_arg1, f221_arg2, f221_arg3, f221_arg4 )
		return f0_local9( f221_arg0, f221_arg1, f221_arg2, f221_arg3, f221_arg4, 1 )
	end,
	Secondary_Camo = function ( f222_arg0, f222_arg1, f222_arg2, f222_arg3, f222_arg4 )
		assert( f222_arg3 == 0 )
		return Cac.GetCacConfig( f222_arg0, f222_arg1, f222_arg2, "weaponSetups", 1, "camo" )
	end,
	Secondary_Reticle = function ( f223_arg0, f223_arg1, f223_arg2, f223_arg3, f223_arg4 )
		assert( f223_arg3 == 0 )
		return Cac.GetCacConfig( f223_arg0, f223_arg1, f223_arg2, "weaponSetups", 1, "reticle" )
	end,
	Lethal = function ( f224_arg0, f224_arg1, f224_arg2, f224_arg3, f224_arg4 )
		assert( f224_arg3 == 0 )
		return Cac.GetCacConfig( f224_arg0, f224_arg1, f224_arg2, "equipment", 0 )
	end,
	Tactical = function ( f225_arg0, f225_arg1, f225_arg2, f225_arg3, f225_arg4 )
		assert( f225_arg3 == 0 )
		return Cac.GetCacConfig( f225_arg0, f225_arg1, f225_arg2, "equipment", 1 )
	end,
	Perk_Slot1 = function ( f226_arg0, f226_arg1, f226_arg2, f226_arg3, f226_arg4 )
		return Cac.GetCacConfig( f226_arg0, f226_arg1, f226_arg2, "perkSlots", f226_arg3 )
	end,
	Perk_Slot2 = function ( f227_arg0, f227_arg1, f227_arg2, f227_arg3, f227_arg4 )
		return Cac.GetCacConfig( f227_arg0, f227_arg1, f227_arg2, "perkSlots", f227_arg3 + 1 )
	end,
	Perk_Slot3 = function ( f228_arg0, f228_arg1, f228_arg2, f228_arg3, f228_arg4 )
		return Cac.GetCacConfig( f228_arg0, f228_arg1, f228_arg2, "perkSlots", f228_arg3 + 2 )
	end,
	Melee = function ( f229_arg0, f229_arg1, f229_arg2, f229_arg3, f229_arg4 )
		return Cac.GetCacConfig( f229_arg0, f229_arg1, f229_arg2, "meleeWeapon" )
	end
}
Cac.GetDefaultWeapon = function ( f230_arg0, f230_arg1, f230_arg2, f230_arg3, f230_arg4, f230_arg5 )
	assert( f230_arg1 ~= nil )
	return f0_local10[f230_arg0]( Cac.GetSelectedControllerIndex(), f230_arg2, f230_arg3, f230_arg1, f230_arg5 )
end

Cac.GetEquippedWeapon = function ( f231_arg0, f231_arg1, f231_arg2, f231_arg3, f231_arg4, f231_arg5 )
	assert( f231_arg1 ~= nil )
	if f231_arg0 == Cac.EditRemove_SelectedCategory and (f231_arg4 == nil or f231_arg4 == true) and f231_arg1 == Cac.EditRemove_SelectedIndex then
		return Cac.EditRemove_SelectedWeapon
	else
		return f0_local11[f231_arg0]( Cac.GetSelectedControllerIndex(), f231_arg2, f231_arg3, f231_arg1, f231_arg5 )
	end
end

Cac.HasEquippedWeapon = function ( f232_arg0, f232_arg1, f232_arg2, f232_arg3 )
	if f232_arg1 then
		local f232_local0 = Cac.GetWeaponSlotCount( f232_arg0, f232_arg2, f232_arg3 )
		for f232_local1 = 0, f232_local0 - 1, 1 do
			if Cac.GetEquippedWeapon( f232_arg0, f232_local1, f232_arg2, f232_arg3 ) == f232_arg1 then
				return true
			end
		end
	end
	return false
end

f0_local12 = nil
f0_local13 = function ( f233_arg0, f233_arg1, f233_arg2, f233_arg3, f233_arg4, f233_arg5, f233_arg6 )
	Cac.SetCacConfig( f233_arg0, f233_arg3, f233_arg4, "weaponSetups", f233_arg6, "kit", "attachKit", tonumber( Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.Ref, f233_arg2, AttachKitTable.Cols.Id ) ) )
	if Cac.Perk1Disabled() then
		f0_local12( "Perk_Slot1", 0, f233_arg3, f233_arg4 )
	end
end

f0_local14 = function ( f234_arg0, f234_arg1, f234_arg2, f234_arg3, f234_arg4, f234_arg5, f234_arg6 )
	Cac.SetCacConfig( f234_arg0, f234_arg3, f234_arg4, "weaponSetups", f234_arg6, "kit", "furnitureKit", tonumber( Engine.TableLookupFromStart( FurnitureKitTable.File, FurnitureKitTable.Cols.Ref, f234_arg2, FurnitureKitTable.Cols.Id ) ) )
end

f0_local15 = {
	Primary = function ( f235_arg0, f235_arg1, f235_arg2, f235_arg3, f235_arg4, f235_arg5 )
		Cac.SetCacConfig( f235_arg0, f235_arg3, f235_arg4, "weaponSetups", 0, "weapon", f235_arg2 )
	end,
	Primary_AttachKit = function ( f236_arg0, f236_arg1, f236_arg2, f236_arg3, f236_arg4, f236_arg5 )
		f0_local13( f236_arg0, f236_arg1, f236_arg2, f236_arg3, f236_arg4, f236_arg5, 0 )
	end,
	Primary_FurnitureKit = function ( f237_arg0, f237_arg1, f237_arg2, f237_arg3, f237_arg4, f237_arg5 )
		f0_local14( f237_arg0, f237_arg1, f237_arg2, f237_arg3, f237_arg4, f237_arg5, 0 )
	end,
	Primary_Camo = function ( f238_arg0, f238_arg1, f238_arg2, f238_arg3, f238_arg4, f238_arg5 )
		Cac.SetCacConfig( f238_arg0, f238_arg3, f238_arg4, "weaponSetups", 0, "camo", f238_arg2 )
	end,
	Primary_Reticle = function ( f239_arg0, f239_arg1, f239_arg2, f239_arg3, f239_arg4, f239_arg5 )
		Cac.SetCacConfig( f239_arg0, f239_arg3, f239_arg4, "weaponSetups", 0, "reticle", f239_arg2 )
	end,
	Secondary = function ( f240_arg0, f240_arg1, f240_arg2, f240_arg3, f240_arg4, f240_arg5 )
		Cac.SetCacConfig( f240_arg0, f240_arg3, f240_arg4, "weaponSetups", 1, "weapon", f240_arg2 )
	end,
	Secondary_AttachKit = function ( f241_arg0, f241_arg1, f241_arg2, f241_arg3, f241_arg4, f241_arg5 )
		f0_local13( f241_arg0, f241_arg1, f241_arg2, f241_arg3, f241_arg4, f241_arg5, 1 )
	end,
	Secondary_FurnitureKit = function ( f242_arg0, f242_arg1, f242_arg2, f242_arg3, f242_arg4, f242_arg5 )
		f0_local14( f242_arg0, f242_arg1, f242_arg2, f242_arg3, f242_arg4, f242_arg5, 1 )
	end,
	Secondary_Camo = function ( f243_arg0, f243_arg1, f243_arg2, f243_arg3, f243_arg4, f243_arg5 )
		Cac.SetCacConfig( f243_arg0, f243_arg3, f243_arg4, "weaponSetups", 1, "camo", f243_arg2 )
	end,
	Secondary_Reticle = function ( f244_arg0, f244_arg1, f244_arg2, f244_arg3, f244_arg4, f244_arg5 )
		Cac.SetCacConfig( f244_arg0, f244_arg3, f244_arg4, "weaponSetups", 1, "reticle", f244_arg2 )
	end,
	Lethal = function ( f245_arg0, f245_arg1, f245_arg2, f245_arg3, f245_arg4, f245_arg5 )
		Cac.SetCacConfig( f245_arg0, f245_arg3, f245_arg4, "equipment", 0, f245_arg2 )
	end,
	Tactical = function ( f246_arg0, f246_arg1, f246_arg2, f246_arg3, f246_arg4, f246_arg5 )
		Cac.SetCacConfig( f246_arg0, f246_arg3, f246_arg4, "equipment", 1, f246_arg2 )
	end,
	Perk_Slot1 = function ( f247_arg0, f247_arg1, f247_arg2, f247_arg3, f247_arg4, f247_arg5 )
		Cac.SetCacConfig( f247_arg0, f247_arg3, f247_arg4, "perkSlots", f247_arg1, f247_arg2 )
	end,
	Perk_Slot2 = function ( f248_arg0, f248_arg1, f248_arg2, f248_arg3, f248_arg4, f248_arg5 )
		Cac.SetCacConfig( f248_arg0, f248_arg3, f248_arg4, "perkSlots", f248_arg1 + 1, f248_arg2 )
	end,
	Perk_Slot3 = function ( f249_arg0, f249_arg1, f249_arg2, f249_arg3, f249_arg4, f249_arg5 )
		Cac.SetCacConfig( f249_arg0, f249_arg3, f249_arg4, "perkSlots", f249_arg1 + 2, f249_arg2 )
	end,
	Melee = function ( f250_arg0, f250_arg1, f250_arg2, f250_arg3, f250_arg4, f250_arg5 )
		Cac.SetCacConfig( f250_arg0, f250_arg3, f250_arg4, "meleeWeapon", f250_arg2 )
	end
}
f0_local16 = function ( f251_arg0, f251_arg1, f251_arg2, f251_arg3, f251_arg4, f251_arg5 )
	f0_local15[f251_arg0]( Cac.GetSelectedControllerIndex(), f251_arg1, f251_arg2, f251_arg3, f251_arg4, f251_arg5 )
end

f0_local17 = function ( f252_arg0, f252_arg1, f252_arg2 )
	local f252_local0 = Cac.NullWeaponNames[f252_arg0]
	for f252_local1 = 0, Cac.GetWeaponSlotCount( f252_arg0, f252_arg1, f252_arg2 ) - 1, 1 do
		f0_local16( f252_arg0, f252_local1, f252_local0, f252_arg1, f252_arg2 )
	end
end

f0_local18 = function ( f253_arg0, f253_arg1, f253_arg2, f253_arg3 )
	if Cac.GetEquippedWeapon( f253_arg0, 0, f253_arg2, f253_arg3 ) ~= f253_arg1 then
		f0_local16( f253_arg0, 0, f253_arg1, f253_arg2, f253_arg3 )
		local f253_local0 = f253_arg0 .. "_AttachKit"
		f0_local16( f253_local0, 0, Cac.NullWeaponNames[f253_local0], f253_arg2, f253_arg3 )
		local f253_local1 = f253_arg0 .. "_FurnitureKit"
		f0_local16( f253_local1, 0, Cac.NullWeaponNames[f253_local1], f253_arg2, f253_arg3 )
		local f253_local2 = f253_arg0 .. "_Camo"
		local f253_local3 = Cac.NullWeaponNames[f253_local2]
		for f253_local4 = 0, Cac.GetWeaponSlotCount( f253_local2, f253_arg2, f253_arg3 ) - 1, 1 do
			f0_local16( f253_local2, f253_local4, f253_local3, f253_arg2, f253_arg3 )
		end
		f0_local17( f253_arg0 .. "_Reticle", f253_arg2, f253_arg3 )
		if Cac.EditRemove_SelectedCategory == attachmentCategory and Cac.GetEquippedWeaponCount( f253_arg2, f253_arg3 ) <= Cac.GetMaxEquippedWeaponCount( f253_arg2 ) then
			Cac.ClearEditRemoveWeapon()
		end
		local f253_local4 = Cac.GetWeaponRequiredAttachment( f253_arg1 )
		if f253_local4 ~= nil and f253_local4 ~= "" then
			Cac.SelectEquippedWeapon( attachmentCategory, 0, f253_local4, f253_arg2, f253_arg3 )
		end
	end
end

f0_local19 = function ( f254_arg0, f254_arg1, f254_arg2, f254_arg3, f254_arg4 )
	local f254_local0 = Cac.NullWeaponNames[f254_arg0]
	local f254_local1 = "Primary_Reticle"
	if f254_arg0 == "Secondary_AttachKit" then
		f254_local1 = "Secondary_Reticle"
	end
	local f254_local2 = Cac.GetEquippedWeapon( f254_arg0, 0, f254_arg3, f254_arg4, false )
	if f254_local2 ~= f254_arg2 then
		if Cac.DoesAttachKitAllowReticles( f254_local2 ) and not Cac.DoesAttachKitAllowReticles( f254_arg2 ) and not Cac.OverrideClearReticle then
			f0_local17( f254_local1, f254_arg3, f254_arg4 )
		end
		f0_local16( f254_arg0, f254_arg1, f254_arg2, f254_arg3, f254_arg4 )
	end
end

f0_local20 = function ( f255_arg0, f255_arg1, f255_arg2, f255_arg3, f255_arg4 )
	local f255_local0 = Cac.NullWeaponNames[f255_arg0]
	if Cac.GetEquippedWeapon( f255_arg0, f255_arg1, f255_arg3, f255_arg4 ) == "specialty_twoprimaries" or f255_arg2 == "specialty_twoprimaries" then
		f0_local12( "Secondary", 0, f255_arg3, f255_arg4 )
		if f255_arg2 == "specialty_twoprimaries" then
			if Cac.GetEquippedWeapon( "Primary", 0, f255_arg3, f255_arg4 ) ~= "h1_m16" then
				f0_local16( "Secondary", 0, "h1_m16", f255_arg3, f255_arg4 )
			else
				f0_local16( "Secondary", 0, "h1_ak47", f255_arg3, f255_arg4 )
			end
		else
			f0_local16( "Secondary", 0, "h1_beretta", f255_arg3, f255_arg4 )
		end
	end
	f0_local16( f255_arg0, f255_arg1, f255_arg2, f255_arg3, f255_arg4 )
end

f0_local21 = function ( f256_arg0, f256_arg1, f256_arg2, f256_arg3 )
	assert( f256_arg0 == 0 )
	f0_local16( "Lethal", f256_arg0, f256_arg1, f256_arg2, f256_arg3 )
end

f0_local22 = function ( f257_arg0, f257_arg1, f257_arg2, f257_arg3 )
	assert( f257_arg0 == 0 )
	f0_local16( "Tactical", f257_arg0, f257_arg1, f257_arg2, f257_arg3 )
end

f0_local23 = function ( f258_arg0, f258_arg1, f258_arg2, f258_arg3 )
	local f258_local0 = Cac.GetWeaponSlotCount( "StreakModules", f258_arg2, f258_arg3 )
	for f258_local1 = 0, f258_local0 - 1, 1 do
		f0_local16( "StreakModules", f258_arg1, Cac.GetEquippedWeapon( "StreakModules", f258_arg0, f258_arg2, f258_arg3, false, f258_local1 ), f258_arg2, f258_arg3, f258_local1 )
		f0_local16( "StreakModules", f258_arg0, Cac.NullWeaponName_StreakModules, f258_arg2, f258_arg3, f258_local1 )
	end
end

f0_local24 = function ( f259_arg0, f259_arg1, f259_arg2 )
	local f259_local0 = Cac.GetWeaponSlotCount( "StreakModules", f259_arg1, f259_arg2 )
	for f259_local1 = 0, f259_local0 - 1, 1 do
		f0_local16( "StreakModules", f259_arg0, Cac.NullWeaponName_StreakModules, f259_arg1, f259_arg2, f259_local1 )
	end
end

f0_local25 = function ( f260_arg0 )
	return Engine.TableLookup( KillstreakModulesTable.File, KillstreakModulesTable.Cols.Ref, f260_arg0, KillstreakModulesTable.Cols.BaseStreakRef )
end

f0_local26 = function ( f261_arg0, f261_arg1, f261_arg2 )
	local f261_local0 = Cac.GetWeaponSlotCount( "Streak", f261_arg1, f261_arg2 )
	for f261_local1 = 0, f261_local0 - 1, 1 do
		if Cac.GetEquippedWeapon( "Streak", f261_local1, f261_arg1, f261_arg2, false ) == f261_arg0 then
			return f261_local1
		end
	end
	assert( nil, "GetKillstreakIndexFromName: Killstreak " .. killstreakname( " not equipped!" ) )
end

f0_local27 = function ( f262_arg0, f262_arg1, f262_arg2, f262_arg3 )
	local f262_local0 = Cac.GetWeaponSlotCount( "Streak", f262_arg2, f262_arg3 )
	local f262_local1 = Cac.NullWeaponName_Streak
	for f262_local2 = 0, f262_local0 - 1, 1 do
		if Cac.GetEquippedWeapon( "Streak", f262_local2, f262_arg2, f262_arg3, false ) == f262_arg1 then
			if f262_local2 == f262_arg0 then
				return false
			end
			f0_local16( "Streak", f262_local2, f262_local1, f262_arg2, f262_arg3 )
			f0_local24( f262_local2, f262_arg2, f262_arg3 )
		end
	end
	f0_local16( "Streak", f262_arg0, f262_arg1, f262_arg2, f262_arg3 )
	f0_local24( f262_arg0, f262_arg2, f262_arg3 )
	return true
end

f0_local28 = function ( f263_arg0, f263_arg1, f263_arg2, f263_arg3 )
	local f263_local0 = Cac.NumScorestreakModuleUnlocked( Cac.GetSelectedControllerIndex() )
	local f263_local1 = f0_local26( f0_local25( f263_arg1 ), f263_arg2, f263_arg3 )
	local f263_local2 = Cac.NullWeaponName_StreakModules
	for f263_local3 = 0, f263_local0 - 1, 1 do
		if Cac.GetEquippedWeapon( "StreakModules", f263_local1, f263_arg2, f263_arg3, false, f263_local3 ) == f263_arg1 then
			for f263_local6 = f263_local3 + 1, f263_local0 - 1, 1 do
				f0_local16( "StreakModules", f263_local1, Cac.GetEquippedWeapon( "StreakModules", f263_local1, f263_arg2, f263_arg3, false, f263_local6 ), f263_arg2, f263_arg3, f263_local6 - 1 )
			end
			f0_local16( "StreakModules", f263_local1, f263_local2, f263_arg2, f263_arg3, f263_local0 - 1 )
			return false
		end
	end
	local f263_local3 = f263_local0 - 1
	for f263_local4 = 0, f263_local3, 1 do
		local f263_local6 = Cac.GetEquippedWeapon( "StreakModules", f263_local1, f263_arg2, f263_arg3, false, f263_local4 )
		if f263_local6 == f263_arg1 or f263_local6 == f263_local2 then
			f0_local16( "StreakModules", f263_local1, f263_arg1, f263_arg2, f263_arg3, f263_local4 )
			return true
		end
	end
	f0_local16( "StreakModules", f263_local1, f263_arg1, f263_arg2, f263_arg3, f263_local0 - 1 )
	return true
end

f0_local29 = {
	Primary = function ( f264_arg0, f264_arg1, f264_arg2, f264_arg3, f264_arg4 )
		f0_local18( f264_arg0, f264_arg2, f264_arg3, f264_arg4 )
		return true
	end,
	Primary_AttachKit = function ( f265_arg0, f265_arg1, f265_arg2, f265_arg3, f265_arg4 )
		f0_local19( f265_arg0, f265_arg1, f265_arg2, f265_arg3, f265_arg4 )
		return true
	end,
	Primary_FurnitureKit = function ( f266_arg0, f266_arg1, f266_arg2, f266_arg3, f266_arg4 )
		f0_local16( f266_arg0, f266_arg1, f266_arg2, f266_arg3, f266_arg4 )
		return true
	end,
	Primary_Camo = function ( f267_arg0, f267_arg1, f267_arg2, f267_arg3, f267_arg4 )
		f0_local16( f267_arg0, f267_arg1, f267_arg2, f267_arg3, f267_arg4 )
		return true
	end,
	Primary_Reticle = function ( f268_arg0, f268_arg1, f268_arg2, f268_arg3, f268_arg4 )
		f0_local16( f268_arg0, f268_arg1, f268_arg2, f268_arg3, f268_arg4 )
		return true
	end,
	Secondary = function ( f269_arg0, f269_arg1, f269_arg2, f269_arg3, f269_arg4 )
		f0_local18( f269_arg0, f269_arg2, f269_arg3, f269_arg4 )
		return true
	end,
	Secondary_AttachKit = function ( f270_arg0, f270_arg1, f270_arg2, f270_arg3, f270_arg4 )
		f0_local19( f270_arg0, f270_arg1, f270_arg2, f270_arg3, f270_arg4 )
		return true
	end,
	Secondary_FurnitureKit = function ( f271_arg0, f271_arg1, f271_arg2, f271_arg3, f271_arg4 )
		f0_local16( f271_arg0, f271_arg1, f271_arg2, f271_arg3, f271_arg4 )
		return true
	end,
	Secondary_Camo = function ( f272_arg0, f272_arg1, f272_arg2, f272_arg3, f272_arg4 )
		f0_local16( f272_arg0, f272_arg1, f272_arg2, f272_arg3, f272_arg4 )
		return true
	end,
	Secondary_Reticle = function ( f273_arg0, f273_arg1, f273_arg2, f273_arg3, f273_arg4 )
		f0_local16( f273_arg0, f273_arg1, f273_arg2, f273_arg3, f273_arg4 )
		return true
	end,
	Lethal = function ( f274_arg0, f274_arg1, f274_arg2, f274_arg3, f274_arg4 )
		f0_local21( f274_arg1, f274_arg2, f274_arg3, f274_arg4 )
		return true
	end,
	Tactical = function ( f275_arg0, f275_arg1, f275_arg2, f275_arg3, f275_arg4 )
		f0_local22( f275_arg1, f275_arg2, f275_arg3, f275_arg4 )
		return true
	end,
	Perk_Slot1 = function ( f276_arg0, f276_arg1, f276_arg2, f276_arg3, f276_arg4 )
		f0_local20( f276_arg0, f276_arg1, f276_arg2, f276_arg3, f276_arg4 )
		return true
	end,
	Perk_Slot2 = function ( f277_arg0, f277_arg1, f277_arg2, f277_arg3, f277_arg4 )
		f0_local20( f277_arg0, f277_arg1, f277_arg2, f277_arg3, f277_arg4 )
		return true
	end,
	Perk_Slot3 = function ( f278_arg0, f278_arg1, f278_arg2, f278_arg3, f278_arg4 )
		f0_local20( f278_arg0, f278_arg1, f278_arg2, f278_arg3, f278_arg4 )
		return true
	end,
	Melee = function ( f279_arg0, f279_arg1, f279_arg2, f279_arg3, f279_arg4 )
		f0_local16( f279_arg0, f279_arg1, f279_arg2, f279_arg3, f279_arg4 )
		return true
	end
}
f0_local30 = function ( f280_arg0, f280_arg1, f280_arg2, f280_arg3, f280_arg4 )
	return f0_local29[f280_arg0]( f280_arg0, f280_arg1, f280_arg2, f280_arg3, f280_arg4 )
end

Cac.SelectEquippedWeapon = function ( f281_arg0, f281_arg1, f281_arg2, f281_arg3, f281_arg4 )
	local f281_local0 = f0_local30( f281_arg0, f281_arg1, f281_arg2, f281_arg3, f281_arg4 )
	if f281_local0 == true then
		local f281_local1 = CoD.SFX.CaC[f281_arg2]
		if f281_local1 == nil then
			local f281_local2 = Cac.GetWeaponTypeFromWeapon( f281_arg0, f281_arg2 )
			if f281_local2 ~= nil then
				f281_local1 = CoD.SFX.CaC[f281_local2]
			end
		end
		if f281_local1 ~= nil then
			Engine.PlaySound( f281_local1 )
		end
	end
	if Engine.GetDvarBool( "virtualLobbyActive" ) then
		Cac.SetVirtualLobbyLoadout( Cac.GetSelectedControllerIndex() )
	end
	return f281_local0
end

f0_local31 = function ( f282_arg0, f282_arg1, f282_arg2, f282_arg3 )
	local f282_local0 = Cac.NullWeaponNames[f282_arg0]
	local f282_local1 = false
	if f282_arg1 == nil then
		for f282_local2 = 0, Cac.GetWeaponSlotCount( f282_arg0, f282_arg2, f282_arg3 ) - 1, 1 do
			if Cac.GetEquippedWeapon( f282_arg0, f282_local2, f282_arg2, f282_arg3 ) ~= f282_local0 then
				f0_local30( f282_arg0, f282_local2, f282_local0, f282_arg2, f282_arg3 )
				f282_local1 = true
			end
		end
	elseif Cac.GetEquippedWeapon( f282_arg0, f282_arg1, f282_arg2, f282_arg3 ) ~= f282_local0 then
		f0_local30( f282_arg0, f282_arg1, f282_local0, f282_arg2, f282_arg3 )
		f282_local1 = true
	end
	return f282_local1
end

f0_local32 = function ( f283_arg0, f283_arg1, f283_arg2, f283_arg3 )
	local f283_local0
	if 4 < f283_arg3 then
		f283_local0 = 11
		if not f283_local0 then
		
		else
			local f283_local1 = Cac.GetDefaultWeapon( f283_arg0, f283_arg1, f283_arg2, f283_local0 )
			local f283_local2 = Cac.NullWeaponNames[f283_arg0]
			local f283_local3 = false
			if f283_arg1 == nil then
				for f283_local4 = 0, Cac.GetWeaponSlotCount( f283_arg0, f283_arg2, f283_arg3 ) - 1, 1 do
					local f283_local7 = Cac.GetEquippedWeapon( f283_arg0, f283_local4, f283_arg2, f283_arg3 )
					if f283_local4 > 0 then
						if f283_local7 ~= f283_local2 then
							f0_local30( f283_arg0, f283_local4, f283_local2, f283_arg2, f283_arg3 )
							f283_local3 = true
						end
					end
					if f283_local7 ~= f283_local1 then
						f0_local30( f283_arg0, f283_local4, f283_local1, f283_arg2, f283_arg3 )
						f283_local3 = true
					end
				end
			elseif Cac.GetEquippedWeapon( f283_arg0, f283_arg1, f283_arg2, f283_arg3 ) ~= f283_local1 then
				f0_local30( f283_arg0, f283_arg1, f283_local1, f283_arg2, f283_arg3 )
				f283_local3 = true
			end
			return f283_local3
		end
	end
	f283_local0 = f283_arg3
end

f0_local33 = {
	Primary = function ( f284_arg0, f284_arg1, f284_arg2, f284_arg3 )
		return f0_local31( f284_arg0, f284_arg1, f284_arg2, f284_arg3 )
	end,
	Primary_AttachKit = function ( f285_arg0, f285_arg1, f285_arg2, f285_arg3 )
		return f0_local31( f285_arg0, f285_arg1, f285_arg2, f285_arg3 )
	end,
	Primary_FurnitureKit = function ( f286_arg0, f286_arg1, f286_arg2, f286_arg3 )
		return f0_local31( f286_arg0, f286_arg1, f286_arg2, f286_arg3 )
	end,
	Primary_Camo = function ( f287_arg0, f287_arg1, f287_arg2, f287_arg3 )
		return f0_local31( f287_arg0, f287_arg1, f287_arg2, f287_arg3 )
	end,
	Primary_Reticle = function ( f288_arg0, f288_arg1, f288_arg2, f288_arg3 )
		return f0_local31( f288_arg0, f288_arg1, f288_arg2, f288_arg3 )
	end,
	Secondary = function ( f289_arg0, f289_arg1, f289_arg2, f289_arg3 )
		return f0_local31( f289_arg0, f289_arg1, f289_arg2, f289_arg3 )
	end,
	Secondary_AttachKit = function ( f290_arg0, f290_arg1, f290_arg2, f290_arg3 )
		return f0_local31( f290_arg0, f290_arg1, f290_arg2, f290_arg3 )
	end,
	Secondary_FurnitureKit = function ( f291_arg0, f291_arg1, f291_arg2, f291_arg3 )
		return f0_local31( f291_arg0, f291_arg1, f291_arg2, f291_arg3 )
	end,
	Secondary_Camo = function ( f292_arg0, f292_arg1, f292_arg2, f292_arg3 )
		return f0_local31( f292_arg0, f292_arg1, f292_arg2, f292_arg3 )
	end,
	Secondary_Reticle = function ( f293_arg0, f293_arg1, f293_arg2, f293_arg3 )
		return f0_local31( f293_arg0, f293_arg1, f293_arg2, f293_arg3 )
	end,
	Lethal = function ( f294_arg0, f294_arg1, f294_arg2, f294_arg3 )
		return f0_local31( f294_arg0, f294_arg1, f294_arg2, f294_arg3 )
	end,
	Tactical = function ( f295_arg0, f295_arg1, f295_arg2, f295_arg3 )
		return f0_local31( f295_arg0, f295_arg1, f295_arg2, f295_arg3 )
	end,
	Perk_Slot1 = function ( f296_arg0, f296_arg1, f296_arg2, f296_arg3 )
		return f0_local31( f296_arg0, f296_arg1, f296_arg2, f296_arg3 )
	end,
	Perk_Slot2 = function ( f297_arg0, f297_arg1, f297_arg2, f297_arg3 )
		return f0_local31( f297_arg0, f297_arg1, f297_arg2, f297_arg3 )
	end,
	Perk_Slot3 = function ( f298_arg0, f298_arg1, f298_arg2, f298_arg3 )
		return f0_local31( f298_arg0, f298_arg1, f298_arg2, f298_arg3 )
	end,
	Melee = function ( f299_arg0, f299_arg1, f299_arg2, f299_arg3 )
		return f0_local31( f299_arg0, f299_arg1, f299_arg2, f299_arg3 )
	end
}
f0_local34 = {
	Primary = function ( f300_arg0, f300_arg1, f300_arg2, f300_arg3 )
		return f0_local32( f300_arg0, f300_arg1, f300_arg2, f300_arg3 )
	end,
	Primary_AttachKit = function ( f301_arg0, f301_arg1, f301_arg2, f301_arg3 )
		return f0_local32( f301_arg0, f301_arg1, f301_arg2, f301_arg3 )
	end,
	Primary_FurnitureKit = function ( f302_arg0, f302_arg1, f302_arg2, f302_arg3 )
		return f0_local32( f302_arg0, f302_arg1, f302_arg2, f302_arg3 )
	end,
	Primary_Camo = function ( f303_arg0, f303_arg1, f303_arg2, f303_arg3 )
		return f0_local32( f303_arg0, f303_arg1, f303_arg2, f303_arg3 )
	end,
	Primary_Reticle = function ( f304_arg0, f304_arg1, f304_arg2, f304_arg3 )
		return f0_local32( f304_arg0, f304_arg1, f304_arg2, f304_arg3 )
	end,
	Secondary = function ( f305_arg0, f305_arg1, f305_arg2, f305_arg3 )
		return f0_local32( f305_arg0, f305_arg1, f305_arg2, f305_arg3 )
	end,
	Secondary_AttachKit = function ( f306_arg0, f306_arg1, f306_arg2, f306_arg3 )
		return f0_local32( f306_arg0, f306_arg1, f306_arg2, f306_arg3 )
	end,
	Secondary_FurnitureKit = function ( f307_arg0, f307_arg1, f307_arg2, f307_arg3 )
		return f0_local32( f307_arg0, f307_arg1, f307_arg2, f307_arg3 )
	end,
	Secondary_Camo = function ( f308_arg0, f308_arg1, f308_arg2, f308_arg3 )
		return f0_local32( f308_arg0, f308_arg1, f308_arg2, f308_arg3 )
	end,
	Secondary_Reticle = function ( f309_arg0, f309_arg1, f309_arg2, f309_arg3 )
		return f0_local32( f309_arg0, f309_arg1, f309_arg2, f309_arg3 )
	end,
	Lethal = function ( f310_arg0, f310_arg1, f310_arg2, f310_arg3 )
		return f0_local32( f310_arg0, f310_arg1, f310_arg2, f310_arg3 )
	end,
	Tactical = function ( f311_arg0, f311_arg1, f311_arg2, f311_arg3 )
		return f0_local32( f311_arg0, f311_arg1, f311_arg2, f311_arg3 )
	end,
	Perk_Slot1 = function ( f312_arg0, f312_arg1, f312_arg2, f312_arg3 )
		return f0_local32( f312_arg0, f312_arg1, f312_arg2, f312_arg3 )
	end,
	Perk_Slot2 = function ( f313_arg0, f313_arg1, f313_arg2, f313_arg3 )
		return f0_local32( f313_arg0, f313_arg1, f313_arg2, f313_arg3 )
	end,
	Perk_Slot3 = function ( f314_arg0, f314_arg1, f314_arg2, f314_arg3 )
		return f0_local32( f314_arg0, f314_arg1, f314_arg2, f314_arg3 )
	end,
	Melee = function ( f315_arg0, f315_arg1, f315_arg2, f315_arg3 )
		return f0_local32( f315_arg0, f315_arg1, f315_arg2, f315_arg3 )
	end
}
f0_local12 = function ( f316_arg0, f316_arg1, f316_arg2, f316_arg3 )
	local f316_local0 = false
	if f316_arg0 == Cac.EditRemove_SelectedCategory and f316_arg1 == Cac.EditRemove_SelectedIndex then
		Cac.ClearEditRemoveWeapon()
		f316_local0 = true
	else
		f316_local0 = f0_local33[f316_arg0]( f316_arg0, f316_arg1, f316_arg2, f316_arg3 )
	end
	if Cac.EditRemove_SelectedCategory and Cac.GetEquippedWeaponCount( f316_arg2, f316_arg3 ) <= Cac.GetMaxEquippedWeaponCount( f316_arg2 ) then
		local f316_local1 = Cac.EditRemove_SelectedCategory
		local f316_local2 = Cac.EditRemove_SelectedIndex
		local f316_local3 = Cac.EditRemove_SelectedWeapon
		Cac.ClearEditRemoveWeapon()
		f0_local30( f316_local1, f316_local2, f316_local3, f316_arg2, f316_arg3 )
	end
	return f316_local0
end

function DefaultEquippedWeapon( f317_arg0, f317_arg1, f317_arg2, f317_arg3 )
	local f317_local0 = false
	return f0_local34[f317_arg0]( f317_arg0, f317_arg1, f317_arg2, f317_arg3 )
end

Cac.HasCopyData = function ()
	return Cac.CopyClassData ~= nil
end

Cac.ClearCopyData = function ()
	Cac.CopyClassData = nil
end

Cac.GetCopyDataClassName = function ()
	local f320_local0 = ""
	if Cac.CopyClassData then
		for f320_local4, f320_local5 in pairs( Cac.CopyClassData ) do
			if f320_local5.dataType == "className" then
				f320_local0 = f320_local5.srcClassName
				break
			end
		end
	end
	return f320_local0
end

Cac.CopyClass = function ( f321_arg0, f321_arg1, f321_arg2 )
	Cac.CopyClassData = {}
	Cac.CopyClassToObj( f321_arg0, f321_arg1, Cac.CopyClassData, f321_arg2 )
end

Cac.CopyClassToObj = function ( f322_arg0, f322_arg1, f322_arg2, f322_arg3 )
	for f322_local3, f322_local4 in pairs( Cac.EquipmentSlots ) do
		f322_arg2[f322_local3] = {
			dataType = "cacItem",
			weaponCategory = f322_local4.weaponCategory,
			weaponIndex = f322_local4.weaponIndex,
			moduleIndex = f322_local4.moduleIndex,
			newWeapon = Cac.GetEquippedWeapon( f322_local4.weaponCategory, f322_local4.weaponIndex, f322_arg0, f322_arg1, false, f322_local4.moduleIndex )
		}
	end
	f322_arg2[#f322_arg2 + 1] = {
		dataType = "className",
		srcClassName = Cac.GetCustomClassName( f322_arg0, f322_arg1 ),
		disableRename = f322_arg3
	}
end

Cac.PasteClass = function ( f323_arg0, f323_arg1 )
	if Cac.HasCopyData() then
		Cac.PasteClassFromObj( f323_arg0, f323_arg1, Cac.CopyClassData )
	else
		DebugPrint( "Cac.PasteClass() : no paste data" )
	end
end

Cac.PasteClassFromObj = function ( f324_arg0, f324_arg1, f324_arg2 )
	local f324_local0 = Cac.GetCustomClassName( f324_arg0, f324_arg1 )
	Cac.ClearClass( f324_arg0, f324_arg1 )
	for f324_local4, f324_local5 in pairs( f324_arg2 ) do
		if f324_local5.dataType == "cacItem" then
			f0_local16( f324_local5.weaponCategory, f324_local5.weaponIndex, f324_local5.newWeapon, f324_arg0, f324_arg1, f324_local5.moduleIndex )
		end
		if f324_local5.dataType == "className" then
			if f324_local5.disableRename == true then
				Cac.SetCustomClassName( f324_local0, f324_arg0, f324_arg1 )
			end
			if f324_arg1 ~= 5 then
				Cac.SetCustomClassName( f324_local5.srcClassName, f324_arg0, f324_arg1 )
			else
				Cac.SetCustomClassName( f324_local0, f324_arg0, f324_arg1 )
			end
		end
	end
end

Cac.ClearClass = function ( f325_arg0, f325_arg1 )
	for f325_local3, f325_local4 in pairs( Cac.EquipmentSlots ) do
		Cac.ClearEquippedWeapon( f325_local4.weaponCategory, f325_local4.weaponIndex, f325_arg0, f325_arg1 )
	end
end

Cac.ClearEquippedWeapon = function ( f326_arg0, f326_arg1, f326_arg2, f326_arg3 )
	local f326_local0 = f0_local12( f326_arg0, f326_arg1, f326_arg2, f326_arg3 )
	if Engine.GetDvarBool( "virtualLobbyActive" ) then
		Cac.SetVirtualLobbyLoadout( Cac.GetSelectedControllerIndex() )
	end
	return f326_local0
end

Cac.DefaultClass = function ( f327_arg0, f327_arg1 )
	for f327_local3, f327_local4 in pairs( Cac.EquipmentSlots ) do
		Cac.DefaultEquippedWeapon( f327_local4.weaponCategory, f327_local4.weaponIndex, f327_arg0, f327_arg1 )
	end
end

Cac.DefaultEquippedWeapon = function ( f328_arg0, f328_arg1, f328_arg2, f328_arg3 )
	local f328_local0 = DefaultEquippedWeapon( f328_arg0, f328_arg1, f328_arg2, f328_arg3 )
	if Engine.GetDvarBool( "virtualLobbyActive" ) then
		Cac.SetVirtualLobbyLoadout( Cac.GetSelectedControllerIndex() )
	end
	return f328_local0
end

Cac.ClearEditRemoveWeapon = function ()
	Cac.EditRemove_SelectedCategory = nil
	Cac.EditRemove_SelectedIndex = nil
	Cac.EditRemove_SelectedWeapon = nil
end

Cac.GetNameFromStatsTable = function ( f330_arg0 )
	return Engine.Localize( "@" .. Engine.TableLookup( StatsTable.File, StatsTable.Cols.WeaponRef, f330_arg0, StatsTable.Cols.WeaponName ) )
end

Cac.GetNameFromStatsTableGUID = function ( f331_arg0 )
	return Engine.Localize( "@" .. Engine.LookupStatsTableColumnForGUID( f331_arg0, StatsTable.Cols.WeaponName ) )
end

f0_local35 = {
	Primary = function ( f332_arg0, f332_arg1 )
		if f332_arg1 == Cac.NullWeaponNames[f332_arg0] then
			return ""
		else
			return Cac.GetNameFromStatsTable( f332_arg1 )
		end
	end,
	Primary_AttachKit = function ( f333_arg0, f333_arg1 )
		return Engine.Localize( "@" .. Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.Ref, f333_arg1, AttachKitTable.Cols.Name ) )
	end,
	Primary_FurnitureKit = function ( f334_arg0, f334_arg1 )
		return Engine.Localize( "@" .. Engine.TableLookupFromStart( FurnitureKitTable.File, FurnitureKitTable.Cols.Ref, f334_arg1, FurnitureKitTable.Cols.Name ) )
	end,
	Primary_Camo = function ( f335_arg0, f335_arg1 )
		return Engine.Localize( "@" .. Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, f335_arg1, CamoTable.Cols.Name ) )
	end,
	Primary_Reticle = function ( f336_arg0, f336_arg1 )
		return Engine.Localize( "@" .. Engine.TableLookup( ReticleTable.File, ReticleTable.Cols.Ref, f336_arg1, ReticleTable.Cols.Name ) )
	end,
	Secondary = function ( f337_arg0, f337_arg1 )
		if f337_arg1 == Cac.NullWeaponNames[f337_arg0] then
			return ""
		else
			return Cac.GetNameFromStatsTable( f337_arg1 )
		end
	end,
	Secondary_AttachKit = function ( f338_arg0, f338_arg1 )
		return Engine.Localize( "@" .. Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.Ref, f338_arg1, AttachKitTable.Cols.Name ) )
	end,
	Secondary_FurnitureKit = function ( f339_arg0, f339_arg1 )
		return Engine.Localize( "@" .. Engine.TableLookupFromStart( FurnitureKitTable.File, FurnitureKitTable.Cols.Ref, f339_arg1, FurnitureKitTable.Cols.Name ) )
	end,
	Secondary_Camo = function ( f340_arg0, f340_arg1 )
		return Engine.Localize( "@" .. Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, f340_arg1, CamoTable.Cols.Name ) )
	end,
	Secondary_Reticle = function ( f341_arg0, f341_arg1 )
		return Engine.Localize( "@" .. Engine.TableLookup( ReticleTable.File, ReticleTable.Cols.Ref, f341_arg1, ReticleTable.Cols.Name ) )
	end,
	Lethal = function ( f342_arg0, f342_arg1 )
		return Engine.Localize( "@" .. Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f342_arg1, PerkTable.Cols.Name ) )
	end,
	Tactical = function ( f343_arg0, f343_arg1 )
		return Engine.Localize( "@" .. Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f343_arg1, PerkTable.Cols.Name ) )
	end,
	Perk_Slot1 = function ( f344_arg0, f344_arg1 )
		return Engine.Localize( "@" .. Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f344_arg1, PerkTable.Cols.Name ) )
	end,
	Perk_Slot2 = function ( f345_arg0, f345_arg1 )
		return Engine.Localize( "@" .. Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f345_arg1, PerkTable.Cols.Name ) )
	end,
	Perk_Slot3 = function ( f346_arg0, f346_arg1 )
		return Engine.Localize( "@" .. Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f346_arg1, PerkTable.Cols.Name ) )
	end,
	Primary_AttachmentBase = function ( f347_arg0, f347_arg1 )
		return Engine.Localize( "@" .. Engine.TableLookup( AttachBaseTable.File, AttachBaseTable.Cols.Ref, f347_arg1, AttachBaseTable.Cols.Name ) )
	end,
	Melee = function ( f348_arg0, f348_arg1 )
		return Cac.GetNameFromStatsTable( f348_arg1 )
	end
}
Cac.GetWeaponName = function ( f349_arg0, f349_arg1 )
	return f0_local35[f349_arg0]( f349_arg0, f349_arg1 )
end

Cac.GetImageNameFromStatsTable = function ( f350_arg0 )
	return Engine.TableLookup( StatsTable.File, StatsTable.Cols.WeaponRef, f350_arg0, StatsTable.Cols.WeaponImage )
end

Cac.GetImageNameFromStatsTableGUID = function ( f351_arg0 )
	return Engine.LookupStatsTableColumnForGUID( f351_arg0, StatsTable.Cols.WeaponImage )
end

f0_local36 = {
	Primary = function ( f352_arg0, f352_arg1 )
		if f352_arg1 == Cac.NullWeaponNames[f352_arg0] then
			return "ui_transparent"
		else
			return Cac.GetImageNameFromStatsTable( f352_arg1 )
		end
	end,
	Primary_AttachKit = function ( f353_arg0, f353_arg1 )
		return Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.Ref, f353_arg1, AttachKitTable.Cols.Image )
	end,
	Primary_FurnitureKit = function ( f354_arg0, f354_arg1 )
		return Engine.TableLookupFromStart( FurnitureKitTable.File, FurnitureKitTable.Cols.Ref, f354_arg1, FurnitureKitTable.Cols.Image )
	end,
	Primary_Camo = function ( f355_arg0, f355_arg1 )
		return Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, f355_arg1, CamoTable.Cols.Image )
	end,
	Primary_Reticle = function ( f356_arg0, f356_arg1 )
		return Engine.TableLookup( ReticleTable.File, ReticleTable.Cols.Ref, f356_arg1, ReticleTable.Cols.Image )
	end,
	Secondary = function ( f357_arg0, f357_arg1 )
		if f357_arg1 == Cac.NullWeaponNames[f357_arg0] then
			return "ui_transparent"
		else
			return Cac.GetImageNameFromStatsTable( f357_arg1 )
		end
	end,
	Secondary_AttachKit = function ( f358_arg0, f358_arg1 )
		return Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.Ref, f358_arg1, AttachKitTable.Cols.Image )
	end,
	Secondary_FurnitureKit = function ( f359_arg0, f359_arg1 )
		return Engine.TableLookupFromStart( FurnitureKitTable.File, FurnitureKitTable.Cols.Ref, f359_arg1, FurnitureKitTable.Cols.Image )
	end,
	Secondary_Camo = function ( f360_arg0, f360_arg1 )
		return Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, f360_arg1, CamoTable.Cols.Image )
	end,
	Secondary_Reticle = function ( f361_arg0, f361_arg1 )
		return Engine.TableLookup( ReticleTable.File, ReticleTable.Cols.Ref, f361_arg1, ReticleTable.Cols.Image )
	end,
	Lethal = function ( f362_arg0, f362_arg1 )
		return Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f362_arg1, PerkTable.Cols.Image )
	end,
	Tactical = function ( f363_arg0, f363_arg1 )
		return Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f363_arg1, PerkTable.Cols.Image )
	end,
	Perk_Slot1 = function ( f364_arg0, f364_arg1 )
		return Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f364_arg1, PerkTable.Cols.Image )
	end,
	Perk_Slot2 = function ( f365_arg0, f365_arg1 )
		return Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f365_arg1, PerkTable.Cols.Image )
	end,
	Perk_Slot3 = function ( f366_arg0, f366_arg1 )
		return Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f366_arg1, PerkTable.Cols.Image )
	end,
	Melee = function ( f367_arg0, f367_arg1 )
		if f367_arg1 == Cac.NullWeaponNames[f367_arg0] then
			return "ui_transparent"
		else
			return Cac.GetImageNameFromStatsTable( f367_arg1 )
		end
	end
}
Cac.GetWeaponImageName = function ( f368_arg0, f368_arg1 )
	return f0_local36[f368_arg0]( f368_arg0, f368_arg1 )
end

Cac.GetWeaponImage = function ( f369_arg0, f369_arg1 )
	return RegisterMaterial( Cac.GetWeaponImageName( f369_arg0, f369_arg1 ) )
end

Cac.GetWeaponLockedIcon = function ( f370_arg0, f370_arg1 )
	local f370_local0 = "s1_icon_locked_full"
	if f370_arg0 and f370_arg1 and Cac.Weapons[f370_arg0] and Cac.Weapons[f370_arg0].LockedIcons[f370_arg1] then
		f370_local0 = Cac.Weapons[f370_arg0].LockedIcons[f370_arg1]
	end
	return RegisterMaterial( f370_local0 )
end

Cac.GetStreakModuleCost = function ( f371_arg0 )
	local f371_local0 = Engine.TableLookup( KillstreakModulesTable.File, KillstreakModulesTable.Cols.Ref, f371_arg0, KillstreakModulesTable.Cols.AddedPoints )
	if tonumber( f371_local0 ) == nil then
		assert( false, "Cac.GetStreakModuleCost(): cost for streak module [" .. f371_arg0 .. "] not found or not a number." )
		f371_local0 = 0
	end
	return f371_local0
end

Cac.GetStreakCost = function ( f372_arg0 )
	local f372_local0 = Engine.TableLookup( KillstreakTable.File, KillstreakTable.Cols.Ref, f372_arg0, KillstreakTable.Cols.Adrenaline )
	if tonumber( f372_local0 ) == nil then
		assert( false, "Cac.GetStreakCost(): cost for streak [" .. f372_arg0 .. "] not found or not a number." )
		f372_local0 = 0
	end
	return f372_local0
end

Cac.GetEquippedStreakAndModuleCost = function ( f373_arg0, f373_arg1, f373_arg2 )
	return Cac.GetStreakCost( Cac.GetEquippedWeapon( "Streak", f373_arg0, f373_arg1, f373_arg2 ) ) + Cac.GetStreakModuleCost( Cac.GetEquippedWeapon( "StreakModules", f373_arg0, f373_arg1, f373_arg2, false, 0 ) ) + Cac.GetStreakModuleCost( Cac.GetEquippedWeapon( "StreakModules", f373_arg0, f373_arg1, f373_arg2, false, 1 ) ) + Cac.GetStreakModuleCost( Cac.GetEquippedWeapon( "StreakModules", f373_arg0, f373_arg1, f373_arg2, false, 2 ) )
end

f0_local37 = function ( f374_arg0 )
	return Engine.Localize( "@" .. Engine.TableLookup( KillstreakModulesTable.File, KillstreakModulesTable.Cols.Ref, f374_arg0, KillstreakModulesTable.Cols.Desc ) ) .. "\n\n" .. Engine.Localize( "@LUA_MENU_SCORESTREAK_MODULE_COST" ) .. ": " .. Cac.GetStreakModuleCost( f374_arg0 )
end

f0_local38 = function ( f375_arg0 )
	return Engine.Localize( "@" .. Engine.TableLookup( KillstreakTable.File, KillstreakTable.Cols.Ref, f375_arg0, KillstreakTable.Cols.Desc ) ) .. "\n\n" .. Engine.Localize( "@LUA_MENU_SCORESTREAK_COST" ) .. ": " .. Cac.GetStreakCost( f375_arg0 )
end

Cac.GetDescFromStatsTable = function ( f376_arg0, f376_arg1 )
	local f376_local0, f376_local1, f376_local2 = nil
	if Engine.IsPC() and not Engine.IsGamepadEnabled() and f376_arg1 and f376_arg1 == "Melee" then
		f376_local1 = Engine.GetKeyBindingLocalizedString( 0, "weapmelee" )
		f376_local2 = "@PLATFORM_UI_MELEE_RANGE_GAMEPAD"
	else
		f376_local1 = Engine.GetKeyBindingLocalizedString( 0, "weapnext" )
		f376_local2 = "@" .. Engine.TableLookup( StatsTable.File, StatsTable.Cols.WeaponRef, f376_arg0, StatsTable.Cols.WeaponDesc )
	end
	return Engine.Localize( f376_local2, f376_local1 )
end

Cac.GetDescFromStatsTableGUID = function ( f377_arg0 )
	return Engine.Localize( "@" .. Engine.LookupStatsTableColumnForGUID( f377_arg0, StatsTable.Cols.WeaponDesc ) )
end

f0_local39 = {
	Primary = function ( f378_arg0 )
		return Cac.GetDescFromStatsTable( f378_arg0 )
	end,
	Primary_AttachKit = function ( f379_arg0 )
		return Engine.Localize( "@" .. Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.Ref, f379_arg0, AttachKitTable.Cols.Desc ) )
	end,
	Primary_FurnitureKit = function ( f380_arg0 )
		return Engine.Localize( "@" .. Engine.TableLookupFromStart( FurnitureKitTable.File, FurnitureKitTable.Cols.Ref, f380_arg0, FurnitureKitTable.Cols.Desc ) )
	end,
	Primary_Camo = function ( f381_arg0 )
		return Engine.Localize( "@" .. Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, f381_arg0, CamoTable.Cols.Desc ) )
	end,
	Primary_Reticle = function ( f382_arg0 )
		return Engine.Localize( "@" .. Engine.TableLookup( ReticleTable.File, ReticleTable.Cols.Ref, f382_arg0, ReticleTable.Cols.Desc ) )
	end,
	Secondary = function ( f383_arg0 )
		return Cac.GetDescFromStatsTable( f383_arg0 )
	end,
	Secondary_AttachKit = function ( f384_arg0 )
		return Engine.Localize( "@" .. Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.Ref, f384_arg0, AttachKitTable.Cols.Desc ) )
	end,
	Secondary_FurnitureKit = function ( f385_arg0 )
		return Engine.Localize( "@" .. Engine.TableLookupFromStart( FurnitureKitTable.File, FurnitureKitTable.Cols.Ref, f385_arg0, FurnitureKitTable.Cols.Desc ) )
	end,
	Secondary_Camo = function ( f386_arg0 )
		return Engine.Localize( "@" .. Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, f386_arg0, CamoTable.Cols.Desc ) )
	end,
	Secondary_Reticle = function ( f387_arg0 )
		return Engine.Localize( "@" .. Engine.TableLookup( ReticleTable.File, ReticleTable.Cols.Ref, f387_arg0, ReticleTable.Cols.Desc ) )
	end,
	Lethal = function ( f388_arg0 )
		return Engine.Localize( "@" .. Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f388_arg0, PerkTable.Cols.Desc ) )
	end,
	Tactical = function ( f389_arg0 )
		return Engine.Localize( "@" .. Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f389_arg0, PerkTable.Cols.Desc ) )
	end,
	Perk_Slot1 = function ( f390_arg0 )
		return Engine.Localize( "@" .. Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f390_arg0, PerkTable.Cols.Desc ) )
	end,
	Perk_Slot2 = function ( f391_arg0 )
		return Engine.Localize( "@" .. Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f391_arg0, PerkTable.Cols.Desc ) )
	end,
	Perk_Slot3 = function ( f392_arg0 )
		return Engine.Localize( "@" .. Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f392_arg0, PerkTable.Cols.Desc ) )
	end,
	Melee = function ( f393_arg0, f393_arg1 )
		return Cac.GetDescFromStatsTable( f393_arg0, f393_arg1 )
	end
}
Cac.GetWeaponDescription = function ( f394_arg0, f394_arg1 )
	return f0_local39[f394_arg0]( f394_arg1, f394_arg0 )
end

Cac.GetWeaponIgnored = function ( f395_arg0 )
	if weaponCategory == "Primary" or weaponCategory == "Secondary" then
		if Engine.TableLookup( StatsTable.File, StatsTable.Cols.WeaponRef, f395_arg0, StatsTable.Cols.Ignore ) == "" then
			return nil
		else
			return true
		end
	else
		return nil
	end
end

Cac.LookupWeaponRefByID = function ( f396_arg0 )
	return Engine.TableLookup( StatsTable.File, StatsTable.Cols.WeaponId, f396_arg0, StatsTable.Cols.WeaponRef )
end

Cac.IsWeaponEquippedInOtherSlot = function ( f397_arg0, f397_arg1, f397_arg2, f397_arg3 )
	local f397_local0 = nil
	if f397_arg0 == "Primary" then
		f397_local0 = "Secondary"
	elseif f397_arg0 == "Secondary" then
		f397_local0 = "Primary"
	else
		return false
	end
	return Cac.GetWeaponNameFromLootName( f397_arg1 ) == Cac.GetWeaponNameFromLootName( Cac.GetEquippedWeapon( f397_local0, 0, f397_arg2, f397_arg3 ) )
end

Cac.StreakHasModule = function ( f398_arg0 )
	if f398_arg0 == "none" then
		return false
	end
	local f398_local0 = 0
	local f398_local1 = nil
	while Engine.TableLookupByRow( KillstreakModulesTable.File, f398_local0, KillstreakModulesTable.Cols.Ref ) ~= "" do
		if Engine.TableLookupByRow( KillstreakModulesTable.File, f398_local0, KillstreakModulesTable.Cols.BaseStreakRef ) == f398_arg0 then
			return true
		end
		f398_local0 = f398_local0 + 1
	end
	return false
end

Cac.IsWeaponRequired = function ( f399_arg0, f399_arg1, f399_arg2, f399_arg3 )
	return false
end

Cac.GetWeaponRequiredAttachment = function ( f400_arg0 )
	return Engine.TableLookup( StatsTable.File, StatsTable.Cols.Ref, f400_arg0, StatsTable.Cols.FirstRequiredWeaponAttachment )
end

Cac.GetWeaponAccuracy = function ( f401_arg0 )
	return tonumber( Engine.TableLookup( StatsTable.File, StatsTable.Cols.WeaponRef, f401_arg0, StatsTable.Cols.WeaponAcc ) ) or 0
end

Cac.GetWeaponDamage = function ( f402_arg0 )
	return tonumber( Engine.TableLookup( StatsTable.File, StatsTable.Cols.WeaponRef, f402_arg0, StatsTable.Cols.WeaponDam ) ) or 0
end

Cac.GetWeaponRange = function ( f403_arg0 )
	return tonumber( Engine.TableLookup( StatsTable.File, StatsTable.Cols.WeaponRef, f403_arg0, StatsTable.Cols.WeaponRng ) ) or 0
end

Cac.GetWeaponFireRate = function ( f404_arg0 )
	return tonumber( Engine.TableLookup( StatsTable.File, StatsTable.Cols.WeaponRef, f404_arg0, StatsTable.Cols.WeaponRof ) ) or 0
end

Cac.GetWeaponMobility = function ( f405_arg0 )
	return tonumber( Engine.TableLookup( StatsTable.File, StatsTable.Cols.WeaponRef, f405_arg0, StatsTable.Cols.WeaponMob ) ) or 0
end

Cac.GetWeaponHandling = function ( f406_arg0 )
	return tonumber( Engine.TableLookup( StatsTable.File, StatsTable.Cols.WeaponRef, f406_arg0, StatsTable.Cols.WeaponHan ) ) or 0
end

Cac.GetWeaponAmmoCount = function ( f407_arg0, f407_arg1 )
	return tonumber( Engine.TableLookup( StatsTable.File, StatsTable.Cols.WeaponRef, f407_arg0, StatsTable.Cols.WeaponAmm ) ) or 0
end

Cac.GetWeaponMagazineSize = function ( f408_arg0, f408_arg1 )
	return tonumber( Engine.TableLookup( StatsTable.File, StatsTable.Cols.WeaponRef, f408_arg0, StatsTable.Cols.WeaponMag ) ) or 0
end

Cac.InitAttachmentMap = function ()
	if Cac.AttachmentMap ~= nil then
		return 
	end
	Cac.AttachmentMap = {}
	local f409_local0 = {}
	local f409_local1 = 1
	while true do
		local f409_local2 = Engine.TableLookupByRow( AttachmentMapTable.File, f409_local1, AttachmentMapTable.Cols.WeaponOrType )
		if f409_local2 == "" then
			f409_local2 = AttachmentMapTable.Cols.BaseAttachesStart
			while true do
				local f409_local3 = Engine.TableLookupByRow( AttachmentMapTable.File, 0, f409_local2 )
				if f409_local3 == "" then
					return 
				end
				local f409_local4 = {}
				Cac.AttachmentMap[f409_local3] = f409_local4
				for f409_local5 = 1, #f409_local0, 1 do
					local f409_local8 = Engine.TableLookupByRow( AttachmentMapTable.File, f409_local5, f409_local2 )
					if f409_local8 ~= "" then
						f409_local4[f409_local0[f409_local5]] = f409_local8
					end
				end
				f409_local2 = f409_local2 + 1
			end
		end
		f409_local0[f409_local1] = f409_local2
		f409_local1 = f409_local1 + 1
	end
end

Cac.GetAttachmentBaseRef = function ( f410_arg0, f410_arg1, f410_arg2 )
	Cac.InitAttachmentMap()
	for f410_local3, f410_local4 in pairs( Cac.AttachmentMap ) do
		if Cac.AttachmentMap[f410_local4] ~= nil then
			if Cac.AttachmentMap[f410_local4][f410_arg1] == f410_arg0 then
				return f410_local4
			elseif Cac.AttachmentMap[f410_local4][f410_arg2] == f410_arg0 then
				return f410_local4
			end
		end
	end
	return f410_arg0
end

Cac.GetPrimaryCategoryIfOverkill = function ( f411_arg0, f411_arg1, f411_arg2 )
	if f411_arg1 ~= nil then
		f411_arg1.subCategories = nil
	end
	if Cac.HasOverkill() then
		if f411_arg0 == "Secondary" then
			if f411_arg1 ~= nil then
				f411_arg1.subCategories = f411_arg2
			end
			return "Primary"
		elseif f411_arg0 == "Secondary_AttachKit" then
			return "Primary_AttachKit"
		elseif f411_arg0 == "Secondary_Camo" then
			return "Primary_Camo"
		elseif f411_arg0 == "Secondary_FurnitureKit" then
			return "Primary_FurnitureKit"
		elseif f411_arg0 == "Secondary_Reticle" then
			return "Primary_Reticle"
		else
			return f411_arg0
		end
	else
		return f411_arg0
	end
end

Cac.GetAttachmentUniqueRef = function ( f412_arg0, f412_arg1, f412_arg2 )
	Cac.InitAttachmentMap()
	if Cac.AttachmentMap[f412_arg0] ~= nil then
		local f412_local0 = Cac.AttachmentMap[f412_arg0][f412_arg1]
		if f412_local0 ~= nil then
			return f412_local0
		end
		local f412_local1 = Cac.AttachmentMap[f412_arg0][f412_arg2]
		if f412_local1 ~= nil then
			return f412_local1
		end
	end
	return f412_arg0
end

Cac.GetAttachmentBaseByGroup = function ( f413_arg0 )
	local f413_local0 = 0
	local f413_local1 = {}
	local f413_local2 = {}
	while true do
		local f413_local3 = Engine.TableLookupByRow( AttachBaseTable.File, f413_local0, AttachBaseTable.Cols.Group )
		if f413_local3 == "" then
			return f413_local1
		elseif f413_local3 == f413_arg0 and Engine.TableLookupByRow( AttachBaseTable.File, f413_local0, AttachBaseTable.Cols.Hidden ) == "0" then
			local f413_local4 = Engine.TableLookupByRow( AttachBaseTable.File, f413_local0, AttachBaseTable.Cols.Ref )
			if not f413_local2[f413_local4] then
				f413_local1[#f413_local1 + 1] = f413_local4
				f413_local2[f413_local4] = true
			end
		end
		f413_local0 = f413_local0 + 1
	end
end

Cac.GetPerkSlot = function ( f414_arg0 )
	return Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f414_arg0, PerkTable.Cols.Slot )
end

f0_local40 = {
	[16777652] = true,
	[16777652] = true,
	[16777654] = true,
	[16777656] = true,
	[16777656] = true,
	[16777656] = true,
	[16777664] = true,
	[16777664] = true,
	[16777658] = true,
	[16777660] = true,
	[16777660] = true,
	[16777660] = true,
	[16777662] = true,
	[16777664] = true,
	[16777484] = true,
	[16777486] = true,
	[16777488] = true
}
Cac.GetLootRarity = function ( f415_arg0 )
	local f415_local0 = 0
	if not f415_arg0 then
		return f415_local0
	end
	local f415_local1 = false
	local f415_local2 = Engine.Inventory_GetItemTypeByGuid( f415_arg0 )
	if f415_local2 == Cac.InventoryItemType.Reward then
		return Cac.InventoryItemRarity.Reward
	elseif f415_local2 == Cac.InventoryItemType.Entitlement then
		return Cac.InventoryItemRarity.Entitlement
	elseif f415_local2 == Cac.InventoryItemType.Loot then
		f415_local1 = true
	else
		local f415_local3 = tonumber( f415_arg0 )
		if f415_local3 and f0_local40[f415_local3] then
			f415_local1 = true
		elseif Cac.IsReinforcement( {
			lootName = Cac.GetItemRefName( f415_arg0 )
		} ) then
			f415_local1 = true
		end
	end
	if f415_local1 then
		f415_local0 = Engine.Inventory_GetItemRarity( f415_arg0 )
		if f415_local0 == nil then
			f415_local0 = Cac.InventoryItemRarity.None
		else
			f415_local0 = f415_local0 + Cac.InventoryItemRarity.Common
		end
	end
	return f415_local0
end

Cac.GetItemRefName = function ( f416_arg0 )
	return Engine.LookupStatsTableColumnForGUID( f416_arg0, StatsTable.Cols.Ref )
end

Cac.GetItemType = function ( f417_arg0 )
	local f417_local0 = Engine.LookupStatsTableColumnForGUID( f417_arg0, StatsTable.Cols.Group )
	if f417_local0 == ItemTypes.Costume then
		return ItemTypes.Costume
	end
	for f417_local4, f417_local5 in pairs( ItemTypes ) do
		if f417_local0 == f417_local5 then
			return f417_local5
		end
	end
	f417_local1 = ItemTypes.Weapon
	if string.sub( f417_local0, 1, string.len( f417_local1 ) ) == f417_local1 then
		return ItemTypes.Weapon
	end
	f417_local2 = ItemTypes.AttachKit
	if string.sub( f417_local0, 1, string.len( f417_local2 ) ) == f417_local2 then
		return ItemTypes.AttachKit
	end
	return nil
end

function CollectionRewardsEnabled()
	return Engine.GetDvarInt( "ui_enable_set_rewards" ) ~= 0
end

Cac.IsRewardType = function ( f419_arg0 )
	local f419_local0 = CollectionRewardsEnabled()
	if f419_local0 then
		f419_local0 = f419_arg0 == Cac.InventoryItemType.Reward
	end
	return f419_local0
end

Cac.IsCraftableType = function ( f420_arg0 )
	if CollectionRewardsEnabled() then
		return f420_arg0 == Cac.InventoryItemType.Loot
	else
		local f420_local0
		if f420_arg0 ~= Cac.InventoryItemType.Loot and f420_arg0 ~= Cac.InventoryItemType.Reward then
			f420_local0 = false
		else
			f420_local0 = true
		end
	end
	return f420_local0
end

function ItemIsCollectionReward( f421_arg0 )
	return Engine.TableLookup( LootTable.File, LootTable.Cols.GUID, f421_arg0, LootTable.Cols.Type ) == "reward"
end

Cac.IsReinforcement = function ( f422_arg0 )
	local f422_local0 = false
	local f422_local1 = "reinforcement"
	if f422_arg0 then
		if f422_arg0.loot_type == ItemTypes.Reinforcement then
			f422_local0 = true
		elseif f422_arg0.lootName and string.sub( f422_arg0.lootName, 1, string.len( f422_local1 ) ) == f422_local1 then
			f422_local0 = true
		end
	end
	return f422_local0
end

Cac.AreAttachmentsCompatible = function ( f423_arg0, f423_arg1 )
	local f423_local0 = Engine.TableLookupGetRowNum( AttachmentComboTable.File, AttachmentComboTable.Cols.Ref, f423_arg1 )
	local f423_local1 = true
	if f423_arg1 ~= "none" and f423_arg0 ~= "none" and Engine.TableLookup( AttachmentComboTable.File, AttachmentComboTable.Cols.Ref, f423_arg0, f423_local0 ) == "no" then
		f423_local1 = false
	end
	return f423_local1
end

Cac.AreGrenadesCompatible = function ( f424_arg0, f424_arg1 )
	if f424_arg0 == f424_arg1 then
		return false
	else
		return true
	end
end

Cac.AreKillstreakModulesCompatible = function ( f425_arg0, f425_arg1 )
	if f425_arg0 == "none" or f425_arg1 == "none" then
		return true
	elseif f0_local25( f425_arg0 ) ~= f0_local25( f425_arg1 ) then
		return true
	else
		local f425_local0 = Engine.TableLookup( KillstreakModulesTable.File, KillstreakModulesTable.Cols.Ref, f425_arg0, KillstreakModulesTable.Cols.Slot )
		if f425_local0 == "" then
			return true
		else
			local f425_local1 = Engine.TableLookup( KillstreakModulesTable.File, KillstreakModulesTable.Cols.Ref, f425_arg1, KillstreakModulesTable.Cols.Slot )
			if f425_local1 == "" then
				return true
			elseif f425_local0 == f425_local1 then
				return false
			else
				return true
			end
		end
	end
end

Cac.ArePerksCompatible = function ( f426_arg0, f426_arg1 )
	if f426_arg0 == "specialty_null" or f426_arg1 == "specialty_null" then
		return true
	elseif f426_arg0 == f426_arg1 then
		return false
	else
		return true
	end
end

Cac.DoesAttachKitAllowReticles = function ( f427_arg0 )
	local f427_local0 = false
	local f427_local1 = Engine.TableLookupGetRowNum( AttachKitTable.File, AttachKitTable.Cols.Ref, f427_arg0 )
	if f427_local1 ~= -1 then
		local f427_local2 = AttachKitTable.Cols.Attach1
		local f427_local3 = AttachKitTable.Cols.Attach4
		for f427_local4 = f427_local2, f427_local3, 1 do
			local f427_local7 = Engine.TableLookupByRow( AttachKitTable.File, f427_local1, f427_local4 )
			if f427_local7 and f427_local7 ~= "" and Engine.TableLookup( AttachBaseTable.File, AttachBaseTable.Cols.Ref, f427_local7, AttachBaseTable.Cols.Reticle ) == "1" then
				f427_local0 = true
				break
			end
		end
	end
	return f427_local0
end

function SendEventIfChanged( f428_arg0, f428_arg1 )
	if f428_arg0.current_state ~= f428_arg1 then
		f428_arg0:processEvent( {
			name = f428_arg1
		} )
		f428_arg0.current_state = f428_arg1
	end
end

function AnimateToStateIfChanged( f429_arg0, f429_arg1, f429_arg2 )
	if f429_arg0.current_state ~= f429_arg1 then
		f429_arg0:animateToState( f429_arg1, f429_arg2 )
		f429_arg0.current_state = f429_arg1
	end
end

Cac.GetLoadout = function ( f430_arg0, f430_arg1 )
	local f430_local0 = nil
	local f430_local1 = {
		primary = Cac.GetEquippedWeapon( "Primary", 0, f430_arg0, f430_arg1 ),
		primaryAttachKit = Cac.GetEquippedWeapon( "Primary_AttachKit", 0, f430_arg0, f430_arg1 ),
		primaryFurnitureKit = Cac.GetEquippedWeapon( "Primary_FurnitureKit", 0, f430_arg0, f430_arg1 ),
		primaryCamo = Cac.GetEquippedWeapon( "Primary_Camo", 0, f430_arg0, f430_arg1 ),
		primaryReticle = Cac.GetEquippedWeapon( "Primary_Reticle", 0, f430_arg0, f430_arg1 ),
		secondary = Cac.GetEquippedWeapon( "Secondary", 0, f430_arg0, f430_arg1 ),
		secondaryAttachKit = Cac.GetEquippedWeapon( "Secondary_AttachKit", 0, f430_arg0, f430_arg1 ),
		secondaryFurnitureKit = Cac.GetEquippedWeapon( "Secondary_FurnitureKit", 0, f430_arg0, f430_arg1 ),
		secondaryCamo = Cac.GetEquippedWeapon( "Secondary_Camo", 0, f430_arg0, f430_arg1 ),
		secondaryReticle = Cac.GetEquippedWeapon( "Secondary_Reticle", 0, f430_arg0, f430_arg1 ),
		lethal = Cac.GetEquippedWeapon( "Lethal", 0, f430_arg0, f430_arg1 ),
		tactical = Cac.GetEquippedWeapon( "Tactical", 0, f430_arg0, f430_arg1 ),
		melee = Cac.GetEquippedWeapon( "Melee", 0, f430_arg0, f430_arg1 ),
		perk1 = Cac.GetEquippedWeapon( "Perk_Slot1", 0, f430_arg0, f430_arg1 ),
		perk2 = Cac.GetEquippedWeapon( "Perk_Slot2", 0, f430_arg0, f430_arg1 ),
		perk3 = Cac.GetEquippedWeapon( "Perk_Slot3", 0, f430_arg0, f430_arg1 ),
		faction = Cac.GetPlayerFaction( Cac.GetSelectedControllerIndex() )
	}
	local f430_local2 = nil
	if f430_local1.primary == "none" then
		f430_local0 = {
			primary = Cac.GetDefaultWeapon( "Primary", 0, f430_arg0, f430_arg1 ),
			primaryAttachKit = Cac.GetDefaultWeapon( "Primary_AttachKit", 0, f430_arg0, f430_arg1 ),
			primaryFurnitureKit = Cac.GetDefaultWeapon( "Primary_FurnitureKit", 0, f430_arg0, f430_arg1 ),
			primaryCamo = Cac.GetDefaultWeapon( "Primary_Camo", 0, f430_arg0, f430_arg1 ),
			primaryReticle = Cac.GetDefaultWeapon( "Primary_Reticle", 0, f430_arg0, f430_arg1 ),
			secondary = Cac.GetDefaultWeapon( "Secondary", 0, f430_arg0, f430_arg1 ),
			secondaryAttachKit = Cac.GetDefaultWeapon( "Secondary_AttachKit", 0, f430_arg0, f430_arg1 ),
			secondaryFurnitureKit = Cac.GetDefaultWeapon( "Secondary_FurnitureKit", 0, f430_arg0, f430_arg1 ),
			secondaryCamo = Cac.GetDefaultWeapon( "Secondary_Camo", 0, f430_arg0, f430_arg1 ),
			secondaryReticle = Cac.GetDefaultWeapon( "Secondary_Reticle", 0, f430_arg0, f430_arg1 ),
			lethal = Cac.GetDefaultWeapon( "Lethal", 0, f430_arg0, f430_arg1 ),
			tactical = Cac.GetDefaultWeapon( "Tactical", 0, f430_arg0, f430_arg1 ),
			melee = Cac.GetDefaultWeapon( "Melee", 0, f430_arg0, f430_arg1 ),
			perk1 = Cac.GetDefaultWeapon( "Perk_Slot1", 0, f430_arg0, f430_arg1 ),
			perk2 = Cac.GetDefaultWeapon( "Perk_Slot2", 0, f430_arg0, f430_arg1 ),
			perk3 = Cac.GetDefaultWeapon( "Perk_Slot3", 0, f430_arg0, f430_arg1 ),
			faction = Cac.GetPlayerFaction( Cac.GetSelectedControllerIndex() )
		}
		Cac.DefaultClass( f430_arg0, Cac.GetSelectedClassIndex( f430_arg0 ) )
		Cac.SetVirtualLobbyLoadout( Cac.GetSelectedControllerIndex() )
		Cac.NotifyVirtualLobby( "reset_loadout", Cac.GetSelectedControllerIndex() + 16 * (Cac.GetSelectedClassIndex( f430_arg0 ) + 1) )
	else
		f430_local0 = f430_local1
	end
	return f430_local0
end

Cac.ConvertLoadoutToIDs = function ( f431_arg0 )
	return {
		primary = Engine.TableLookup( StatsTable.File, StatsTable.Cols.Ref, f431_arg0.primary, 0 ),
		primaryAttachKit = Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.Ref, f431_arg0.primaryAttachKit, 0 ),
		primaryFurnitureKit = Engine.TableLookupFromStart( FurnitureKitTable.File, FurnitureKitTable.Cols.Ref, f431_arg0.primaryFurnitureKit, 0 ),
		primaryCamo = Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, f431_arg0.primaryCamo, 0 ),
		secondary = Engine.TableLookup( StatsTable.File, StatsTable.Cols.Ref, f431_arg0.secondary, 0 ),
		secondaryAttachKit = Engine.TableLookup( AttachKitTable.File, AttachKitTable.Cols.Ref, f431_arg0.secondaryAttachKit, 0 ),
		secondaryFurnitureKit = Engine.TableLookupFromStart( FurnitureKitTable.File, FurnitureKitTable.Cols.Ref, f431_arg0.secondaryFurnitureKit, 0 ),
		secondaryCamo = Engine.TableLookup( CamoTable.File, CamoTable.Cols.Ref, f431_arg0.secondaryCamo, 0 ),
		primaryReticle = Engine.TableLookup( ReticleTable.File, ReticleTable.Cols.Ref, f431_arg0.primaryReticle, 0 ),
		secondaryReticle = Engine.TableLookup( ReticleTable.File, ReticleTable.Cols.Ref, f431_arg0.secondaryReticle, 0 ),
		lethal = Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f431_arg0.lethal, 0 ),
		tactical = Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f431_arg0.tactical, 0 ),
		perk1 = Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f431_arg0.perk1, 0 ),
		perk2 = Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f431_arg0.perk2, 0 ),
		perk3 = Engine.TableLookup( PerkTable.File, PerkTable.Cols.Ref, f431_arg0.perk3, 0 ),
		faction = Cac.GetPlayerFaction( Cac.GetSelectedControllerIndex() )
	}
end

Cac.BroadcastCurrentClass = function ()
	return Cac.SetVirtualLobbyLoadout( -1, true )
end

Cac.PlayerJoinedEvent = function ( f433_arg0, f433_arg1 )
	if not Engine.GetDvarBool( "virtualLobbyActive" ) then
		return 
	elseif Cac.BroadcastCurrentClass() == true or Cac.playerJoined_num_retries ~= nil and Cac.playerJoined_num_retries <= 0 then
		Cac.playerJoined_num_retries = nil
		Cac.inPlayerJoinedTask = false
		if Cac.playerJoined_timer ~= nil then
			local playerJoined_timer = f433_arg0:getRootParent()
			playerJoined_timer:removeElement( Cac.playerJoined_timer )
			Cac.playerJoined_timer:close()
			Cac.playerJoined_timer = nil
		end
	else
		Cac.inPlayerJoinedTask = true
		if Cac.playerJoined_timer == nil then
			local playerJoined_timer = LUI.UITimer.new( 500, {
				name = "player_joined"
			} )
			playerJoined_timer.id = "PlayerJoinedTimer"
			local f433_local1 = f433_arg0:getRootParent()
			f433_local1:addElement( playerJoined_timer )
			Cac.playerJoined_timer = playerJoined_timer
			
			Cac.playerJoined_num_retries = 10
		else
			Cac.playerJoined_num_retries = Cac.playerJoined_num_retries - 1
		end
	end
end

Cac.RemoveDLCRestrictedCallingCard = function ( f434_arg0 )
	local f434_local0 = Cao.GetCallingCard( f434_arg0 )
	local f434_local1 = Cao.GetEmblemPatch( f434_arg0 )
	local f434_local2 = Engine.TableLookup( CallingCardTable.File, CallingCardTable.Cols.Ref, f434_local0, CallingCardTable.Cols.Image )
	local f434_local3 = Engine.TableLookup( CallingCardTable.File, CallingCardTable.Cols.Ref, f434_local0, CallingCardTable.Cols.Guid )
	if f434_local3 == "" or not f434_local3 then
		f434_local3 = nil
	end
	local f434_local4, f434_local5, f434_local6 = Cac.GetItemLockState( f434_arg0, f434_local3, f434_local2, true )
	if f434_local5 == Cac.ItemLockStatus.DlcRequired or f434_local5 == Cac.ItemLockStatus.NotInInventory then
		Cao.SetCallingCard( f434_arg0, 0 )
	end
	f434_local2 = Engine.TableLookup( EmblemIconTable.File, EmblemIconTable.Cols.ID, f434_local1, EmblemIconTable.Cols.Image )
	f434_local3 = Engine.TableLookup( EmblemIconTable.File, EmblemIconTable.Cols.ID, f434_local1, EmblemIconTable.Cols.Guid )
	if f434_local3 == "" or not f434_local3 then
		f434_local3 = nil
	end
	f434_local4, f434_local5, f434_local6 = Cac.GetItemLockState( f434_arg0, f434_local3, f434_local2, true )
	if f434_local5 == Cac.ItemLockStatus.DlcRequired or f434_local5 == Cac.ItemLockStatus.NotInInventory then
		Cao.SetEmblemPatch( f434_arg0, 0 )
	end
end

Cac.RemoveDLCRestrictedLoadoutItem = function ( f435_arg0 )
	local f435_local0 = {}
	local f435_local1 = Cac.GetCustomClassLoc()
	local f435_local2 = Cac.GetSelectedControllerIndex()
	Cac.SetSelectedControllerIndex( f435_arg0 )
	local f435_local3 = Cac.GetCustomClassCount( f435_local1 ) - 1
	for f435_local4 = 0, f435_local3, 1 do
		for f435_local14, f435_local15 in pairs( Cac.EquipmentSlots ) do
			local f435_local16 = Cac.GetEquippedWeapon( f435_local15.weaponCategory, f435_local15.weaponIndex, f435_local1, f435_local4, false, f435_local15.moduleIndex )
			local f435_local10 = Engine.TableLookup( StatsTable.File, StatsTable.Cols.ExternalRef, f435_local16, StatsTable.Cols.GUID )
			if f435_local10 == "" or not f435_local10 then
				f435_local10 = nil
			end
			local f435_local11, f435_local12, f435_local13 = Cac.GetItemLockState( f435_arg0, f435_local10, f435_local16 )
			if f435_local12 == Cac.ItemLockStatus.DlcRequired or f435_local12 == Cac.ItemLockStatus.NotInInventory then
				f435_local0[#f435_local0 + 1] = {
					weaponCategory = f435_local15.weaponCategory,
					weaponIndex = f435_local15.weaponIndex,
					moduleIndex = f435_local15.moduleIndex
				}
			end
		end
		for f435_local14, f435_local15 in ipairs( f435_local0 ) do
			f0_local16( f435_local15.weaponCategory, f435_local15.weaponIndex, Cac.NullWeaponNames[f435_local15.weaponCategory], f435_local1, f435_local4, f435_local15.moduleIndex )
		end
	end
	if f435_local2 then
		Cac.SetSelectedControllerIndex( f435_local2 )
	end
end

Cac.SetVirtualLobbyLoadout = function ( f436_arg0, f436_arg1 )
	local f436_local0, f436_local1 = nil
	local f436_local2 = Engine.GetDvarBool( "virtualLobbyActive" )
	local f436_local3 = nil
	local f436_local4 = 2
	local f436_local5 = Engine.GetSystemLink()
	if not f436_local5 then
		f436_local5 = Engine.GetSplitScreen()
		if not f436_local5 then
			f436_local5 = Engine.GetOnlineGame()
		end
	end
	if not Engine.IsCoreMode() then
		return true
	elseif not f436_local5 then
		return true
	elseif Engine.IsPC() then
		f436_local4 = 1
	end
	local f436_local6 = Cac.GetSelectedControllerIndex()
	local f436_local7 = true
	local f436_local8 = 0
	local f436_local9 = Engine.GetMaxControllerCount()
	for f436_local10 = 0, f436_local9 - 1, 1 do
		if Engine.HasActiveLocalClient( f436_local10 ) and Engine.DoWeHaveStats( f436_local10 ) then
			Cac.RemoveDLCRestrictedLoadoutItem( f436_local10 )
			Cac.RemoveDLCRestrictedCallingCard( f436_local10 )
			if f436_arg0 < 0 or f436_arg0 == f436_local10 then
				Cac.SetSelectedControllerIndex( f436_local10 )
				f436_local0 = Cac.GetLoadout( Cac.GetCustomClassLoc() )
				if f436_local0.primary then
					if f436_local0.primary == "none" then
						
					end
					f436_local1 = Cac.ConvertLoadoutToIDs( f436_local0 )
					f436_local8 = f436_local8 + 1
					if f436_arg1 then
						f436_local7 = Lobby.BroadcastLoadout( f436_local1, f436_local10 ) and f436_local7
					else
						f436_local7 = Lobby.SetVirtualLobbyLoadout( f436_local1, f436_local10 ) and f436_local7
					end
				end
			end
		end
	end
	if f436_local8 == 0 then
		f436_local7 = false
	end
	if f436_local6 then
		Cac.SetSelectedControllerIndex( f436_local6 )
	end
	return f436_local7
end

Cac.NotifyVirtualLobby = function ( f437_arg0, f437_arg1 )
	if Engine.GetDvarBool( "virtualLobbyActive" ) then
		if type( f437_arg1 ) == "string" then
			Engine.NotifyServerString( f437_arg0, f437_arg1 )
		else
			Engine.NotifyServer( f437_arg0, f437_arg1 )
		end
	end
	local f437_local0 = Engine.GetDvarString( "virtualLobbyModeChannel" )
	local f437_local1 = Engine.GetDvarString( "virtualLobbyModeData" )
	if f437_local0 ~= nil and f437_local0 ~= "" and f437_local0 ~= "weapon_highlighted_c" and f437_local0 ~= "costume_preview_c" and f437_local0 ~= "camo_preview_c" then
		Engine.SetDvarString( "virtualLobbyModeChannel2", "" .. f437_local0 )
		Engine.SetDvarString( "virtualLobbyModeData2", "" .. f437_local1 )
	end
	if f437_arg0 == "classpreview" or f437_arg0 == "weapon_highlighted" or f437_arg0 == "cao" or f437_arg0 == "costume_preview" or f437_arg0 == "camo_preview" or f437_arg0 == "weapon_highlighted_c" or f437_arg0 == "costume_preview_c" or f437_arg0 == "camo_preview_c" then
		Engine.SetDvarString( "virtualLobbyModeChannel", "" .. f437_arg0 )
		Engine.SetDvarString( "virtualLobbyModeData", "" .. f437_arg1 )
	end
end

Cac.SetLoadoutOverloaded = function ( f438_arg0 )
	Cac.loadoutOverloaded = f438_arg0
end

Cac.IsLoadoutOverloaded = function ()
	return Cac.loadoutOverloaded or false
end

Cac.SetPlayerFaction = function ( f440_arg0, f440_arg1 )
	local f440_local0 = false
	if Engine.TableLookupByRow( Cac.FactionsCSV.File, f440_arg1, Cac.FactionsCSV.Cols.Team ) == "axis" then
		f440_local0 = true
	end
	local f440_local1 = 0
	local f440_local2 = Engine.TableLookupByRow( Cac.FactionsCSV.File, f440_arg1, Cac.FactionsCSV.Cols.Environment )
	if f440_local2 == "woodland" then
		f440_local1 = 1
	elseif f440_local2 == "desert" then
		f440_local1 = 2
	end
	Engine.SetPlayerData( f440_arg0, CoD.StatsGroup.Common, "lastGame", "team", f440_local0 )
	Engine.SetPlayerData( f440_arg0, CoD.StatsGroup.Common, "lastGame", "environment", f440_local1 )
	if Engine.GetDvarBool( "virtualLobbyActive" ) then
		Cac.SetVirtualLobbyLoadout( f440_arg0, true )
	end
end

Cac.GetPlayerFaction = function ( f441_arg0 )
	local f441_local0 = Engine.GetPlayerData( f441_arg0, CoD.StatsGroup.Common, "lastGame", "team" )
	local f441_local1 = Engine.GetPlayerData( f441_arg0, CoD.StatsGroup.Common, "lastGame", "environment" )
	local f441_local2
	if f441_local0 then
		f441_local2 = "axis"
		if not f441_local2 then
		
		else
			local f441_local3 = ""
			if f441_local1 == 0 then
				f441_local3 = "urban"
			elseif f441_local1 == 1 then
				f441_local3 = "woodland"
			else
				f441_local3 = "desert"
			end
			if f441_local2 == "axis" and f441_local3 == "urban" then
				f441_local3 = "woodland"
			end
			local f441_local4 = 0
			while Engine.TableLookupByRow( Cac.FactionsCSV.File, f441_local4, Cac.FactionsCSV.Cols.Index ) ~= "" do
				if Engine.TableLookupByRow( Cac.FactionsCSV.File, f441_local4, Cac.FactionsCSV.Cols.Team ) == f441_local2 and Engine.TableLookupByRow( Cac.FactionsCSV.File, f441_local4, Cac.FactionsCSV.Cols.Environment ) == f441_local3 then
					return f441_local4
				end
				f441_local4 = f441_local4 + 1
			end
			return 0
		end
	end
	f441_local2 = "allies"
end

Cac.currentFocusedButton = nil
Cac.DepthFromViewZ = function ( f442_arg0, f442_arg1 )
	local f442_local0 = Engine.DepthFromViewZ( f442_arg0, f442_arg1 )
	if f442_local0 == 1 and f442_arg1 > 0 then
		f442_local0 = 1 / 4 * f442_arg1
	end
	return f442_local0
end

Cac.HasOverkill = function ()
	return Cac.HasEquippedWeapon( "Perk_Slot2", "specialty_twoprimaries", LUI.CacStaticLayout.ClassLoc )
end

Cac.GetVLOptionsString = function ( f444_arg0, f444_arg1 )
	local f444_local0 = ""
	local f444_local1 = {
		Primary = StatsTable,
		Secondary = StatsTable,
		Lethal = PerkTable,
		Tactical = PerkTable,
		Perk_Slot1 = PerkTable,
		Perk_Slot2 = PerkTable,
		Perk_Slot3 = PerkTable,
		Primary_FurnitureKit = FurnitureKitTable,
		Secondary_FurnitureKit = FurnitureKitTable,
		Primary_AttachKit = AttachKitTable,
		Secondary_AttachKit = AttachKitTable,
		Primary_Camo = CamoTable,
		Secondary_Camo = CamoTable,
		Primary_Reticle = ReticleTable,
		Secondary_Reticle = ReticleTable,
		Melee = StatsTable
	}
	local f444_local2 = f444_local1[f444_arg0]
	if f444_local2 ~= nil then
		local f444_local3 = Engine.TableLookup( f444_local2.File, f444_local2.Cols.Ref, f444_arg1, 0 )
		if f444_local3 ~= nil and f444_local3 ~= "" then
			local f444_local4 = {
				Primary = 1,
				Secondary = 2,
				Lethal = 3,
				Tactical = 3,
				Perk_Slot1 = 4,
				Perk_Slot2 = 4,
				Perk_Slot3 = 4,
				Primary_FurnitureKit = 5,
				Secondary_FurnitureKit = 5,
				Primary_AttachKit = 6,
				Secondary_AttachKit = 6,
				Primary_Camo = 7,
				Secondary_Camo = 7,
				Primary_Reticle = 8,
				Secondary_Reticle = 8,
				Melee = 9
			}
			f444_local0 = tostring( f444_local4[f444_arg0] ) .. "_" .. f444_local3
		end
	else
		assert( false, "Unhandled category in Cac.GetVLOptionsValue: " .. f444_arg0 )
	end
	return f444_local0
end

Cac.GetPrestigeTokens = function ( f445_arg0 )
	return Engine.GetPlayerData( f445_arg0, CoD.StatsGroup.Ranked, "prestigeShopTokens" )
end

Cac.DecrementPrestigeTokens = function ( f446_arg0 )
	local f446_local0 = Cac.GetPrestigeTokens( f446_arg0 )
	if f446_local0 >= 1 then
		Engine.SetPlayerData( f446_arg0, CoD.StatsGroup.Ranked, "prestigeShopTokens", f446_local0 - 1 )
	end
end

