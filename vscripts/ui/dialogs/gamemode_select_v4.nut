global function InitGamemodeSelectDialogV4
global function SetFreeRoamMap

const int MAX_DISPLAYED_SERVERS = 3

//RUI Element breaks after 21 pages so im limiting it
const int MAX_SERVER_PAGES = 21

global bool FreeRoamMapSelectionOpen = false

struct {
	var menu

	int currentServerPage = 0
	int lastServerNameLineHeight = 0

	ServerListing selectedServer

	string freeRoamSelectedMap = "mp_rr_canyonlands_64k_x_64k"
} file

void function InitGamemodeSelectDialogV4( var newMenuArg )
{
	var menu = GetMenu( "GamemodeSelectV4Dialog" )
	file.menu = menu

	AddMenuEventHandler( menu, eUIEvent.MENU_OPEN, OnOpenModeSelectDialog )
	AddMenuEventHandler( menu, eUIEvent.MENU_CLOSE, OnCloseModeSelectDialog )

	AddMenuEventHandler( menu, eUIEvent.MENU_NAVIGATE_BACK, OnModeSelectMenu_NavigateBack )

	Hud_AddEventHandler( Hud_GetChild(file.menu, "ServersPrevButton"), UIE_CLICK, Servers_PageBackward )
	Hud_AddEventHandler( Hud_GetChild(file.menu, "ServersNextButton"), UIE_CLICK, Servers_PageForward )

	AddMenuFooterOption( menu, LEFT, BUTTON_B, true, "#B_BUTTON_CLOSE", "#CLOSE" )
	AddMenuFooterOption( menu, LEFT, BUTTON_A, true, "#A_BUTTON_SELECT" )

	Hud_AddEventHandler( Hud_GetChild(file.menu, "FreeRoamStartButton"), UIE_CLICK, SelectFreeRoam )
	Hud_AddEventHandler( Hud_GetChild(file.menu, "FreeRoamChangeMapButton"), UIE_CLICK, FreeRoamChangeMapButton )
	Hud_AddEventHandler( Hud_GetChild(file.menu, "FiringRangeButton"), UIE_CLICK, SelectFiringRange )
	Hud_AddEventHandler( Hud_GetChild(file.menu, "AimtrainerButton"), UIE_CLICK, SelectAimTrainer )

	for(int i = 0; i < MAX_DISPLAYED_SERVERS; i++)
	{
		Hud_SetVisible( Hud_GetChild(file.menu, "ServerText" + i), false )
		Hud_SetVisible( Hud_GetChild(file.menu, "ServerMapName" + i), false )
		Hud_SetVisible( Hud_GetChild(file.menu, "ServerPlaylist" + i), false )
		Hud_SetVisible( Hud_GetChild(file.menu, "ServerButton" + i), false )
		Hud_SetVisible( Hud_GetChild(file.menu, "ServerPlayerCount" + i), false )

		Hud_AddEventHandler( Hud_GetChild(file.menu, "ServerButton" + i), UIE_CLICK, SelectServer )
	}

	SetFreeRoamMap("mp_rr_canyonlands_64k_x_64k")
}

void function OnModeSelectMenu_NavigateBack()
{
	if(FreeRoamMapSelectionOpen)
	{
		FreeRoamMapSelectionOpen = false
		HidePanel( Hud_GetChild(file.menu, "MapSelectPanel" ) )
		return
	}

	CloseActiveMenu()
}

void function FreeRoamChangeMapButton( var button )
{
	FreeRoamMapSelectionOpen = true
	ShowPanel( Hud_GetChild(file.menu, "MapSelectPanel" ) )
}

void function Servers_PageBackward( var button )
{
	if(FreeRoamMapSelectionOpen)
	{
		FreeRoamPageBackwards(button)
		return
	}
	
	if(GetMaxPages() == 0)
		return

	int newPage = file.currentServerPage - 1

	if( newPage - 1 < -1)
		newPage = GetMaxPages() - 1

	LoadServers(newPage)
}

void function Servers_PageForward( var button )
{
	if(FreeRoamMapSelectionOpen)
	{
		FreeRoamPageForward(button)
		return
	}

	if(GetMaxPages() == 0)
		return

	int newPage = file.currentServerPage + 1

	if( newPage + 1 > GetMaxPages())
		newPage = 0

	LoadServers(newPage)
}

void function SetFreeRoamMap(string map)
{
	FreeRoamMapSelectionOpen = false
	file.freeRoamSelectedMap = map
	RuiSetImage( Hud_GetRui( Hud_GetChild(file.menu, "FreeRoamBackground") ), "modeImage", GetUIMapAsset(map ) )
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

	if(maxPages > MAX_SERVER_PAGES)
		maxPages = MAX_SERVER_PAGES

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

	SetServerHeaderVis(GetMaxPages() > 1)

	thread LoadServers(0)
}

void function SetServerHeaderVis(bool show)
{
	Hud_SetVisible( Hud_GetChild(file.menu, "ServersFooter"), show )
	Hud_SetVisible( Hud_GetChild(file.menu, "ServersPrevButton"), show )
	Hud_SetVisible( Hud_GetChild(file.menu, "ServersNextButton"), show )
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

	Hud_SetVisible( Hud_GetChild(file.menu, "NoServersText"), global_m_vServerList.len() == 0 )
	HudElem_SetRuiArg( Hud_GetChild(file.menu, "ServersFooter"), "currentPage", file.currentServerPage )
	HudElem_SetRuiArg( Hud_GetChild(file.menu, "ServersFooter"), "numPages", GetMaxPages() )

	string serversHeaderText = GetMaxPages() > 1 ? "SERVERS: " + (file.currentServerPage + 1) + "/" + GetMaxPages() : "SERVERS"

	if(global_m_vServerList.len() < 1)
		serversHeaderText = ""

	Hud_SetText( Hud_GetChild(file.menu, "HeaderModes2Text"), serversHeaderText)

	for(int i = 0; i < MAX_DISPLAYED_SERVERS; i++)
	{
		int adjustedPageIndex = i + file.currentServerPage

		bool invalidIndex = adjustedPageIndex >= global_m_vServerList.len()

		Hud_SetVisible( Hud_GetChild(file.menu, "ServerText" + i), !invalidIndex )
		Hud_SetVisible( Hud_GetChild(file.menu, "ServerMapName" + i), !invalidIndex )
		Hud_SetVisible( Hud_GetChild(file.menu, "ServerPlaylist" + i), !invalidIndex )
		Hud_SetVisible( Hud_GetChild(file.menu, "ServerButton" + i), !invalidIndex )
		Hud_SetVisible( Hud_GetChild(file.menu, "ServerPlayerCount" + i), !invalidIndex )

		if(invalidIndex)
			break

		Hud_SetText( Hud_GetChild(file.menu, "ServerText" + i), WrapText(global_m_vServerList[adjustedPageIndex].svServerName, 30) )
		Hud_SetText( Hud_GetChild(file.menu, "ServerMapName" + i), GetUIMapName(global_m_vServerList[adjustedPageIndex].svMapName) )
		Hud_SetText( Hud_GetChild(file.menu, "ServerPlaylist" + i), GetUIPlaylistName(global_m_vServerList[adjustedPageIndex].svPlaylist) )
		Hud_SetText( Hud_GetChild(file.menu, "ServerPlayerCount" + i), global_m_vServerList[adjustedPageIndex].svCurrentPlayers + "/" + global_m_vServerList[adjustedPageIndex].svMaxPlayers + " PLAYERS" )
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