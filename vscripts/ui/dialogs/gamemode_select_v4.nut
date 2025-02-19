global function InitGamemodeSelectDialogV4

const int MAX_DISPLAYED_SERVERS = 3

struct {
	var menu

	int currentServerPage = 0
	int lastServerNameLineHeight = 0

	ServerListing selectedServer

	string freeRoamSelectedMap = "mp_rr_desertlands_64k_x_64k_tt"
} file

void function InitGamemodeSelectDialogV4( var newMenuArg )
{
	var menu = GetMenu( "GamemodeSelectV4Dialog" )
	file.menu = menu

	AddMenuEventHandler( menu, eUIEvent.MENU_OPEN, OnOpenModeSelectDialog )
	AddMenuEventHandler( menu, eUIEvent.MENU_CLOSE, OnCloseModeSelectDialog )

	Hud_AddEventHandler( Hud_GetChild(file.menu, "ServersPrevButton"), UIE_CLICK, Servers_PageBackward )
	Hud_AddEventHandler( Hud_GetChild(file.menu, "ServersNextButton"), UIE_CLICK, Servers_PageForward )

	AddMenuFooterOption( menu, LEFT, BUTTON_B, true, "#B_BUTTON_CLOSE", "#CLOSE" )
	AddMenuFooterOption( menu, LEFT, BUTTON_A, true, "#A_BUTTON_SELECT" )

	Hud_AddEventHandler( Hud_GetChild(file.menu, "FreeRoamStartButton"), UIE_CLICK, SelectFreeRoam )
	//Hud_AddEventHandler( Hud_GetChild(file.menu, "FreeRoamChangeMapButton"), UIE_CLICK, FreeRoamChangeMapButton )
	Hud_AddEventHandler( Hud_GetChild(file.menu, "FiringRangeButton"), UIE_CLICK, SelectFiringRange )
	Hud_AddEventHandler( Hud_GetChild(file.menu, "AimtrainerButton"), UIE_CLICK, SelectAimTrainer )

	for(int i = 0; i < MAX_DISPLAYED_SERVERS; i++)
	{
		Hud_SetVisible( Hud_GetChild(file.menu, "ServerText" + i), false )
		Hud_SetVisible( Hud_GetChild(file.menu, "ServerMapName" + i), false )
		Hud_SetVisible( Hud_GetChild(file.menu, "ServerPlaylist" + i), false )
		Hud_SetVisible( Hud_GetChild(file.menu, "ServerButton" + i), false )

		Hud_AddEventHandler( Hud_GetChild(file.menu, "ServerButton" + i), UIE_CLICK, SelectServer )
	}
}

void function Servers_PageBackward( var button )
{
	int newPage = file.currentServerPage - 1

	if( newPage - 1 < 0)
		newPage = GetMaxPages() - 1

	LoadServers(newPage)
}

void function Servers_PageForward( var button )
{
	int newPage = file.currentServerPage + 1

	if( newPage + 1 > GetMaxPages())
		newPage = 0

	LoadServers(newPage)
}

void function SelectFreeRoam( var button )
{
	R5RPlay_SetSelectedPlaylist(file.freeRoamSelectedMap, GetUIMapAsset(file.freeRoamSelectedMap), "survival_dev", "FreeRoam")
	CloseActiveMenu()
}

void function SelectFiringRange( var button )
{
	string map = "mp_rr_canyonlands_staging"
	string playlist = "survival_firingrange"

	R5RPlay_SetSelectedPlaylist(map, GetUIMapAsset(map), playlist, "Firing Range")
	CloseActiveMenu()
}

void function SelectAimTrainer( var button )
{
	string map = "mp_rr_desertlands_64k_x_64k"
	string playlist = "fs_aimtrainer"

	R5RPlay_SetSelectedPlaylist(map, $"rui/menu/gamemode/shotguns_and_snipers", playlist, "Aim Trainer")
	CloseActiveMenu()
}

void function SelectServer( var button )
{
	int id = Hud_GetScriptID( button ).tointeger() + file.currentServerPage

	file.selectedServer.svServerID = global_m_vServerList[id].svServerID
	file.selectedServer.svServerName = global_m_vServerList[id].svServerName
	file.selectedServer.svMapName = global_m_vServerList[id].svMapName
	file.selectedServer.svPlaylist = global_m_vServerList[id].svPlaylist
	file.selectedServer.svDescription = global_m_vServerList[id].svDescription
	file.selectedServer.svMaxPlayers = global_m_vServerList[id].svMaxPlayers
	file.selectedServer.svCurrentPlayers = global_m_vServerList[id].svCurrentPlayers

	R5RPlay_SetSelectedServer(file.selectedServer)
	CloseActiveMenu()
}

int function GetMaxPages()
{
	int maxPages = (global_m_vServerList.len() + 2 / 3 )

	if(maxPages > 20)
		maxPages = 20

	return maxPages
}

void function OnOpenModeSelectDialog()
{
	RegisterButtonPressedCallback( MOUSE_WHEEL_DOWN, Servers_PageForward )
	RegisterButtonPressedCallback( MOUSE_WHEEL_UP, Servers_PageBackward )
	
	thread SetupGameSelectV4()
}

void function SetupGameSelectV4()
{
	waitthread Servers_GetCurrentServerListing()
	thread LoadServers(0)
}

void function OnCloseModeSelectDialog()
{
	DeregisterButtonPressedCallback( MOUSE_WHEEL_DOWN, Servers_PageForward )
	DeregisterButtonPressedCallback( MOUSE_WHEEL_UP, Servers_PageBackward )
	
	Lobby_OnGamemodeSelectV2Close()
}

void function LoadServers(int page)
{
	EmitUISound( "UI_Menu_BattlePass_LevelTab" )

	file.currentServerPage = page

	HudElem_SetRuiArg( Hud_GetChild(file.menu, "ServersFooter"), "currentPage", file.currentServerPage )
	HudElem_SetRuiArg( Hud_GetChild(file.menu, "ServersFooter"), "numPages", GetMaxPages() )
	Hud_SetText( Hud_GetChild(file.menu, "HeaderModes2Text"), "SERVERS: " + (file.currentServerPage + 1) + "/" + GetMaxPages())

	for(int i = 0; i < MAX_DISPLAYED_SERVERS; i++)
	{
		int adjustedPageIndex = i + file.currentServerPage

		bool invalidIndex = adjustedPageIndex >= global_m_vServerList.len()

		Hud_SetVisible( Hud_GetChild(file.menu, "ServerText" + i), !invalidIndex )
		Hud_SetVisible( Hud_GetChild(file.menu, "ServerMapName" + i), !invalidIndex )
		Hud_SetVisible( Hud_GetChild(file.menu, "ServerPlaylist" + i), !invalidIndex )
		Hud_SetVisible( Hud_GetChild(file.menu, "ServerButton" + i), !invalidIndex )

		if(invalidIndex)
			break

		Hud_SetText( Hud_GetChild(file.menu, "ServerText" + i), WrapText(global_m_vServerList[adjustedPageIndex].svServerName, 30) )
		Hud_SetText( Hud_GetChild(file.menu, "ServerMapName" + i), GetUIMapName(global_m_vServerList[adjustedPageIndex].svMapName) )
		Hud_SetText( Hud_GetChild(file.menu, "ServerPlaylist" + i), GetUIPlaylistName(global_m_vServerList[adjustedPageIndex].svPlaylist) )
		RuiSetImage( Hud_GetRui( Hud_GetChild(file.menu, "ServerButton" + i) ), "modeImage", GetUIMapAsset(global_m_vServerList[adjustedPageIndex].svMapName ) )

		Hud_SetHeight( Hud_GetChild(file.menu, "ServerText" + i), file.lastServerNameLineHeight * 25 + 8)
	}
}

string function WrapText(string text, int maxLineWidth)
{
	array<string> textArray = split(text, " ")
	array<string> lines
	string currentLine = "";
	foreach (string word in textArray)
    {
		if (currentLine.len() == 0)
            currentLine = word;
		else if (currentLine.len() + 1 + word.len() <= maxLineWidth)
			currentLine = currentLine + " " + word;
		else
		{
            lines.append(currentLine);
            currentLine = word;
        }
	}

	if (currentLine != "")
        lines.append(currentLine);

	file.lastServerNameLineHeight = lines.len()

	return lines.join("\n");
}