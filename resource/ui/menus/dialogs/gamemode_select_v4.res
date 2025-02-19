scripts/resource/ui/menus/dialog_gamemode_select_v2.menu
{
	menu
	{
		ControlName				Frame
		xpos					0
		ypos					0
		zpos					3
		wide					f0
		tall					f0
		autoResize				0
		pinCorner				0
		visible					1
		enabled					1
		tabPosition				1
		PaintBackgroundType		0
		infocus_bgcolor_override	"0 0 0 0"
		outoffocus_bgcolor_override	"0 0 0 0"
		modal					1

		ScreenBlur
		{
			ControlName				Label
            labelText               ""
		}

        ScreenFrame
        {
            ControlName				RuiPanel
            xpos					0
            ypos					0
            wide					%100
            tall					%100
            visible					1
            enabled 				1
            scaleImage				1
            rui                     "ui/screen_blur.rpak"
            drawColor				"255 255 255 255"
        }

        "Background"
		{
            "ControlName"				"ImagePanel"
			"wide"						"f0"
			"tall"						"f0"
			"visible"					"1"
            "scaleImage"				"1"
			"zpos"						"0"
            "fillColor"					"0 0 0 100"
            "drawColor"					"0 0 0 100"

			"pin_to_sibling"			"ScreenFrame"
			"pin_corner_to_sibling"		"TOP"
			"pin_to_sibling_corner"		"TOP"
		}

        HeaderPanel
        {
            ControlName				RuiPanel
            xpos                    0
            ypos                    -25
            wide					1100
            tall					140
            visible					1
            enabled					1
            proportionalToParent    1
            visible                 1
            rui 					"ui/generic_menu_header.rpak"

            ruiArgs
            {
                menuName "SELECT A GAME MODE"
            }

            "pin_to_sibling"			"ScreenFrame"
			"pin_corner_to_sibling"		"TOP"
			"pin_to_sibling_corner"		"TOP"
        }

        FreeRoamBackground
        {
            ControlName				RuiButton
            wide					380
            tall					650
            ypos                    0
            xpos                    -50
            zpos                    10
            rui                     "ui/gamemode_select_v2_button.rpak"
            labelText               ""
            visible					1
            tabPosition             1
            cursorVelocityModifier  0.7
            sound_accept            "UI_Menu_GameMode_Select"
            "scriptID"					"0"
            polyShape               "5.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0"

            ruiArgs
            {
                lockIconEnabled 0
                modeNameText ""
                modeDescText ""
                alwaysShowDesc 0
                modeImage "rui/menu/maps/mp_rr_olympus"
            }

            pin_to_sibling			ScreenFrame
            pin_corner_to_sibling	LEFT
            pin_to_sibling_corner	LEFT
        }

        FreeRoamStartButton
        {
            ControlName				RuiButton
            wide					340
            tall					130
            ypos                    -75
            xpos                    0
            zpos                    10
            rui                     "ui/gamemode_select_v2_lobby_button.rpak"
            labelText               ""
            visible					1
            tabPosition             1
            cursorVelocityModifier  0.7
            sound_accept            "UI_Menu_GameMode_Select"
            "scriptID"					"0"

            ruiArgs
            {
                lockIconEnabled 0
                modeNameText "FREEROAM"
                modeDescText ""
                alwaysShowDesc 0
                modeImage "rui/menu/gamemode/solo_iron_crown"
            }

            pin_to_sibling			FreeRoamBackground
            pin_corner_to_sibling	CENTER
            pin_to_sibling_corner	CENTER
        }

        FreeRoamChangeMapButton
        {
            ControlName				RuiButton
            wide					340
            tall					130
            ypos                    75
            xpos                    0
            zpos                    10
            rui                     "ui/gamemode_select_v2_lobby_button.rpak"
            labelText               ""
            visible					1
            tabPosition             1
            cursorVelocityModifier  0.7
            sound_accept            "UI_Menu_GameMode_Select"
            "scriptID"					"0"

            ruiArgs
            {
                lockIconEnabled 0
                modeNameText "CHANGE MAP"
                modeDescText ""
                alwaysShowDesc 0
                modeImage "rui/menu/gamemode/worlds_edge"
            }

            pin_to_sibling			FreeRoamBackground
            pin_corner_to_sibling	CENTER
            pin_to_sibling_corner	CENTER
        }

        "FreeRoamText"
		{
			"ControlName"			"Label"
			"xpos"                  "0"
			"ypos"					"-40"
            zpos                    20
			"auto_wide_tocontents"	"1"
			"tall"					"40"
			"visible"				"1"
			"wrap"					"0"
			"fontHeight"			"40"
			"zpos"					"5"
			"textAlignment"			"north-west"
			"labelText"				"FREEROAM"
			"font"					"TitleBoldFont"
			"allcaps"				"1"
			"fgcolor_override"		"255 255 255 255"

			"pin_to_sibling"		"FreeRoamBackground"
			"pin_corner_to_sibling"	"BOTTOM"
			"pin_to_sibling_corner"	"BOTTOM"
		}

        "FreeRoamTextMapName"
		{
			"ControlName"			"Label"
			"xpos"                  "0"
			"ypos"					"-15"
            zpos                    20
			"auto_wide_tocontents"	"1"
			"tall"					"20"
			"visible"				"1"
			"wrap"					"0"
			"fontHeight"			"20"
			"zpos"					"5"
			"textAlignment"			"north-west"
			"labelText"				"Map Name"
			"font"					"Default"
			"allcaps"				"1"
			"fgcolor_override"		"229 157 11 255"

			"pin_to_sibling"		"FreeRoamBackground"
			"pin_corner_to_sibling"	"BOTTOM"
			"pin_to_sibling_corner"	"BOTTOM"
		}

        FiringRangeButton
        {
            ControlName				RuiButton
            wide					345
            tall					318
            ypos                    0
            xpos                    15
            zpos                    10
            rui                     "ui/gamemode_select_v2_button.rpak"
            labelText               ""
            visible					1
            tabPosition             1
            cursorVelocityModifier  0.7
            sound_accept            "UI_Menu_GameMode_Select"

            ruiArgs
            {
                lockIconEnabled 0
                modeNameText ""
                modeDescText ""
                alwaysShowDesc 0
                modeImage "rui/menu/maps/mp_rr_canyonlands_staging"
            }

            pin_to_sibling			FreeRoamBackground
            pin_corner_to_sibling	TOP_LEFT
            pin_to_sibling_corner	TOP_RIGHT
        }

        "FiringRangeText"
		{
			"ControlName"			"Label"
			"xpos"                  "0"
			"ypos"					"-40"
            zpos                    20
			"auto_wide_tocontents"	"1"
			"tall"					"30"
			"visible"				"1"
			"wrap"					"0"
			"fontHeight"			"30"
			"zpos"					"5"
			"textAlignment"			"north-west"
			"labelText"				"FIRING RANGE"
			"font"					"TitleBoldFont"
			"allcaps"				"1"
			"fgcolor_override"		"255 255 255 255"

			"pin_to_sibling"		"FiringRangeButton"
			"pin_corner_to_sibling"	"BOTTOM"
			"pin_to_sibling_corner"	"BOTTOM"
		}

        "FiringRangeTextMapName"
		{
			"ControlName"			"Label"
			"xpos"                  "0"
			"ypos"					"-15"
            zpos                    20
			"auto_wide_tocontents"	"1"
			"tall"					"20"
			"visible"				"1"
			"wrap"					"0"
			"fontHeight"			"20"
			"zpos"					"5"
			"textAlignment"			"north-west"
			"labelText"				"Firing Range"
			"font"					"Default"
			"allcaps"				"1"
			"fgcolor_override"		"229 157 11 255"

			"pin_to_sibling"		"FiringRangeButton"
			"pin_corner_to_sibling"	"BOTTOM"
			"pin_to_sibling_corner"	"BOTTOM"
		}

        AimtrainerButton
        {
            ControlName				RuiButton
            wide					345
            tall					318
            ypos                    0
            xpos                    15
            zpos                    10
            rui                     "ui/gamemode_select_v2_button.rpak"
            labelText               ""
            visible					1
            tabPosition             1
            cursorVelocityModifier  0.7
            sound_accept            "UI_Menu_GameMode_Select"

            ruiArgs
            {
                lockIconEnabled 0
                modeNameText ""
                modeDescText ""
                alwaysShowDesc 0
                modeImage "rui/menu/gamemode/shotguns_and_snipers"
            }

            pin_to_sibling			FreeRoamBackground
            pin_corner_to_sibling	BOTTOM_LEFT
            pin_to_sibling_corner	BOTTOM_RIGHT
        }

        "AimtrainerText"
		{
			"ControlName"			"Label"
			"xpos"                  "0"
			"ypos"					"-40"
            zpos                    20
			"auto_wide_tocontents"	"1"
			"tall"					"30"
			"visible"				"1"
			"wrap"					"0"
			"fontHeight"			"30"
			"zpos"					"5"
			"textAlignment"			"north-west"
			"labelText"				"AIM TRAINER"
			"font"					"TitleBoldFont"
			"allcaps"				"1"
			"fgcolor_override"		"255 255 255 255"

			"pin_to_sibling"		"AimtrainerButton"
			"pin_corner_to_sibling"	"BOTTOM"
			"pin_to_sibling_corner"	"BOTTOM"
		}

        "AimtrainerTextMapName"
		{
			"ControlName"			"Label"
			"xpos"                  "0"
			"ypos"					"-15"
            zpos                    20
			"auto_wide_tocontents"	"1"
			"tall"					"20"
			"visible"				"1"
			"wrap"					"0"
			"fontHeight"			"20"
			"zpos"					"5"
			"textAlignment"			"north-west"
			"labelText"				"Flowstate Aim Trainer"
			"font"					"Default"
			"allcaps"				"1"
			"fgcolor_override"		"229 157 11 255"

			"pin_to_sibling"		"AimtrainerButton"
			"pin_corner_to_sibling"	"BOTTOM"
			"pin_to_sibling_corner"	"BOTTOM"
		}

        ServerButton0
        {
            ControlName				RuiButton
            wide					345
            tall					650
            ypos                    0
            xpos                    15
            zpos                    10
            rui                     "ui/gamemode_select_v2_button.rpak"
            labelText               ""
            visible					1
            tabPosition             1
            cursorVelocityModifier  0.7
            sound_accept            "UI_Menu_GameMode_Select"
            "scriptID"					"0"

            ruiArgs
            {
                lockIconEnabled 0
                modeNameText ""
                modeDescText ""
                alwaysShowDesc 0
                modeImage "rui/menu/maps/mp_rr_canyonlands_mu2_tt"
            }

            pin_to_sibling			FiringRangeButton
            pin_corner_to_sibling	TOP_LEFT
            pin_to_sibling_corner	TOP_RIGHT
        }

        "ServerText0"
		{
			"ControlName"			"Label"
            "textAlignment"			"north-west"
            textinsetx              8
            TextInsety              8
			"xpos"                  "1"
			"ypos"					"-35"
            tall                    35
            zpos                    20
            wide                    339
			"visible"				"1"
			"fontHeight"			"24"
			"zpos"					"5"
			"labelText"				"Server 1 Name"
			"font"					"TitleFont"
			"allcaps"				"1"
			"fgcolor_override"		"255 255 255 255"
            
            paintbackground         1
			bgcolor_override 	    "0 0 0 128"

			"pin_to_sibling"		"ServerButton0"
			"pin_corner_to_sibling"	"TOP"
			"pin_to_sibling_corner"	"TOP"
		}

        "ServerMapName0"
		{
			"ControlName"			"Label"
			"xpos"                  "0"
			"ypos"					"-35"
            zpos                    20
			"auto_wide_tocontents"	"1"
			"tall"					"20"
			"visible"				"1"
			"wrap"					"0"
			"fontHeight"			"20"
			"zpos"					"5"
			"textAlignment"			"north-west"
			"labelText"				"Server 1 Map Name"
			"font"					"Default"
			"allcaps"				"1"
			"fgcolor_override"		"229 157 11 255"

			"pin_to_sibling"		"ServerButton0"
			"pin_corner_to_sibling"	"BOTTOM"
			"pin_to_sibling_corner"	"BOTTOM"
		}

        "ServerPlaylist0"
		{
			"ControlName"			"Label"
			"xpos"                  "0"
			"ypos"					"-15"
            zpos                    20
			"auto_wide_tocontents"	"1"
			"tall"					"20"
			"visible"				"1"
			"wrap"					"0"
			"fontHeight"			"20"
			"zpos"					"5"
			"textAlignment"			"north-west"
			"labelText"				"Server 1 Playlist"
			"font"					"Default"
			"allcaps"				"1"
			"fgcolor_override"		"229 157 11 255"

			"pin_to_sibling"		"ServerButton0"
			"pin_corner_to_sibling"	"BOTTOM"
			"pin_to_sibling_corner"	"BOTTOM"
		}

        ServerButton1
        {
            ControlName				RuiButton
            wide					345
            tall					650
            ypos                    0
            xpos                    15
            zpos                    10
            rui                     "ui/gamemode_select_v2_button.rpak"
            labelText               ""
            visible					1
            tabPosition             1
            cursorVelocityModifier  0.7
            sound_accept            "UI_Menu_GameMode_Select"
            "scriptID"					"1"

            ruiArgs
            {
                lockIconEnabled 0
                modeNameText ""
                modeDescText ""
                alwaysShowDesc 0
                modeImage "rui/menu/maps/mp_rr_party_crasher"
            }

            pin_to_sibling			ServerButton0
            pin_corner_to_sibling	TOP_LEFT
            pin_to_sibling_corner	TOP_RIGHT
        }

        "ServerText1"
		{
			"ControlName"			"Label"
			"xpos"                  "1"
			"ypos"					"-35"
            tall                    100
            zpos                    20
            wide                    339
			"visible"				"1"
			"fontHeight"			"20"
			"zpos"					"5"
			"labelText"				"Server 2 Name"
            "textAlignment"			"north-west"
            textinsetx              8
            TextInsety              8
			"font"					"TitleBoldFont"
			"allcaps"				"1"
			"fgcolor_override"		"255 255 255 255"
            paintbackground         1
			bgcolor_override 	    "0 0 0 128"

			"pin_to_sibling"		"ServerButton1"
			"pin_corner_to_sibling"	"TOP"
			"pin_to_sibling_corner"	"TOP"
		}

        "ServerMapName1"
		{
			"ControlName"			"Label"
			"xpos"                  "0"
			"ypos"					"-35"
            zpos                    20
			"auto_wide_tocontents"	"1"
			"tall"					"20"
			"visible"				"1"
			"wrap"					"0"
			"fontHeight"			"20"
			"zpos"					"5"
			"textAlignment"			"north-west"
			"labelText"				"Server 2 Map Name"
			"font"					"Default"
			"allcaps"				"1"
			"fgcolor_override"		"229 157 11 255"

			"pin_to_sibling"		"ServerButton1"
			"pin_corner_to_sibling"	"BOTTOM"
			"pin_to_sibling_corner"	"BOTTOM"
		}

        "ServerPlaylist1"
		{
			"ControlName"			"Label"
			"xpos"                  "0"
			"ypos"					"-15"
            zpos                    20
			"auto_wide_tocontents"	"1"
			"tall"					"20"
			"visible"				"1"
			"wrap"					"0"
			"fontHeight"			"20"
			"zpos"					"5"
			"textAlignment"			"north-west"
			"labelText"				"Server 2 Playlist"
			"font"					"Default"
			"allcaps"				"1"
			"fgcolor_override"		"229 157 11 255"

			"pin_to_sibling"		"ServerButton1"
			"pin_corner_to_sibling"	"BOTTOM"
			"pin_to_sibling_corner"	"BOTTOM"
		}

        ServerButton2
        {
            ControlName				RuiButton
            wide					345
            tall					650
            ypos                    0
            xpos                    15
            zpos                    10
            rui                     "ui/gamemode_select_v2_button.rpak"
            labelText               ""
            visible					1
            tabPosition             1
            cursorVelocityModifier  0.7
            sound_accept            "UI_Menu_GameMode_Select"
            "scriptID"					"2"

            ruiArgs
            {
                lockIconEnabled 0
                modeNameText ""
                modeDescText ""
                alwaysShowDesc 0
                modeImage "rui/menu/maps/mp_rr_desertlands_mu2"
            }

            pin_to_sibling			ServerButton1
            pin_corner_to_sibling	TOP_LEFT
            pin_to_sibling_corner	TOP_RIGHT
        }

        "ServerText2"
		{
			"ControlName"			"Label"
            "textAlignment"			"north-west"
            textinsetx              8
            TextInsety              8
			"xpos"                  "1"
			"ypos"					"-35"
            tall                    100
            zpos                    20
            wide                    339
			"visible"				"1"
			"fontHeight"			"20"
			"zpos"					"5"
			"labelText"				"Server 3 Name"
			"font"					"TitleBoldFont"
			"allcaps"				"1"
			"fgcolor_override"		"255 255 255 255"
            paintbackground         1
			bgcolor_override 	    "0 0 0 128"

			"pin_to_sibling"		"ServerButton2"
			"pin_corner_to_sibling"	"TOP"
			"pin_to_sibling_corner"	"TOP"
		}

        "ServerMapName2"
		{
			"ControlName"			"Label"
			"xpos"                  "0"
			"ypos"					"-35"
            zpos                    20
			"auto_wide_tocontents"	"1"
			"tall"					"20"
			"visible"				"1"
			"wrap"					"0"
			"fontHeight"			"20"
			"zpos"					"5"
			"textAlignment"			"north-west"
			"labelText"				"Server 3 Map Name"
			"font"					"Default"
			"allcaps"				"1"
			"fgcolor_override"		"229 157 11 255"

			"pin_to_sibling"		"ServerButton2"
			"pin_corner_to_sibling"	"BOTTOM"
			"pin_to_sibling_corner"	"BOTTOM"
		}

        "ServerPlaylist2"
		{
			"ControlName"			"Label"
			"xpos"                  "0"
			"ypos"					"-15"
            zpos                    20
			"auto_wide_tocontents"	"1"
			"tall"					"20"
			"visible"				"1"
			"wrap"					"0"
			"fontHeight"			"20"
			"zpos"					"5"
			"textAlignment"			"north-west"
			"labelText"				"Server 3 Playlist"
			"font"					"Default"
			"allcaps"				"1"
			"fgcolor_override"		"229 157 11 255"

			"pin_to_sibling"		"ServerButton2"
			"pin_corner_to_sibling"	"BOTTOM"
			"pin_to_sibling_corner"	"BOTTOM"
		}

        ServersFooter
        {
            ControlName				RuiPanel
            xpos					0
            ypos					0
            wide					500
            tall					48
            visible					1
            rui					    "ui/battle_pass_footer_bar_v2.rpak"
            //proportionalToParent    1

            ruiArgs
            {
                currentPage 0
                levelRangeText ""
                numPages 20
            }

            pin_to_sibling			ServerButton1
            pin_corner_to_sibling	BOTTOM
            pin_to_sibling_corner	TOP
        }

        ServersPrevButton
        {
            ControlName				RuiButton
            ypos                    0
            wide					64
            tall					64
            rui                     "ui/arrow_button_square.rpak"
            labelText               ""
            visible					1
            cursorVelocityModifier  0.7
            proportionalToParent    1
            sound_focus             "UI_Menu_BattlePass_Level_Focus"
            sound_accept            ""

            ruiArgs
            {
                flipHorizontal 1
            }

            pin_to_sibling			ServerButton0
            pin_corner_to_sibling	BOTTOM_LEFT
            pin_to_sibling_corner	TOP_LEFT
        }

        ServersNextButton
        {
            ControlName				RuiButton
            ypos                    0
            wide					64
            tall					64
            rui                     "ui/arrow_button_square.rpak"
            labelText               ""
            visible					1
            cursorVelocityModifier  0.7
            proportionalToParent    1
            sound_focus             "UI_Menu_BattlePass_Level_Focus"
            sound_accept            ""
            pin_to_sibling			ServerButton2
            pin_corner_to_sibling	BOTTOM_RIGHT
            pin_to_sibling_corner	TOP_RIGHT
        }

        "HeaderModes0Text"
		{
			"ControlName"			"Label"
			"xpos"                  "0"
			"ypos"					"10"
            zpos                    20
			"auto_wide_tocontents"	"1"
			"tall"					"40"
			"visible"				"1"
			"wrap"					"0"
			"fontHeight"			"30"
			"zpos"					"5"
			"textAlignment"			"north-west"
			"labelText"				"FREE ROAM MAPS"
			"font"					"TitleFont"
			"allcaps"				"1"
			"fgcolor_override"		"255 255 255 255"

			pin_to_sibling			FreeRoamBackground
            pin_corner_to_sibling	BOTTOM
            pin_to_sibling_corner	TOP
		}

        "HeaderModes1Text"
		{
			"ControlName"			"Label"
			"xpos"                  "0"
			"ypos"					"10"
            zpos                    20
			"auto_wide_tocontents"	"1"
			"tall"					"40"
			"visible"				"1"
			"wrap"					"0"
			"fontHeight"			"30"
			"zpos"					"5"
			"textAlignment"			"north-west"
			"labelText"				"PRACTICE"
			"font"					"TitleFont"
			"allcaps"				"1"
			"fgcolor_override"		"255 255 255 255"

			pin_to_sibling			FiringRangeButton
            pin_corner_to_sibling	BOTTOM
            pin_to_sibling_corner	TOP
		}

        "HeaderModes2Text"
		{
			"ControlName"			"Label"
			"xpos"                  "0"
			"ypos"					"-15"
            zpos                    20
			"auto_wide_tocontents"	"1"
			"tall"					"40"
			"visible"				"1"
			"wrap"					"0"
			"fontHeight"			"30"
			"zpos"					"5"
			"textAlignment"			"north-west"
			"labelText"				"SERVERS"
			"font"					"TitleFont"
			"allcaps"				"1"
			"fgcolor_override"		"255 255 255 255"

			pin_to_sibling			ServersFooter
            pin_corner_to_sibling	BOTTOM
            pin_to_sibling_corner	TOP
		}

        FooterButtons
		{
			ControlName				CNestedPanel
			InheritProperties       FooterButtons
		}
    }
}
