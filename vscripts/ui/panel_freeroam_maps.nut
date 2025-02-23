global function InitFreeRoamMapPanel
global function FreeRoamPageForward
global function FreeRoamPageBackwards

const int MAX_SHOWN_MAPS = 5

struct {
	var panel
	int currentPage = 0
	array<string> m_vMaps
} file

void function InitFreeRoamMapPanel( var panel )
{
	file.panel = panel
	AddPanelEventHandler( panel, eUIEvent.PANEL_SHOW, OnShow )

	Hud_AddEventHandler( Hud_GetChild(panel, "PrevButton"), UIE_CLICK, FreeRoamPageBackwards )
	Hud_AddEventHandler( Hud_GetChild(panel, "NextButton"), UIE_CLICK, FreeRoamPageForward )

	for(int i = 0; i < MAX_SHOWN_MAPS; i++)
	{
		Hud_AddEventHandler( Hud_GetChild(panel, "MapButton" + i), UIE_CLICK, SelectMap )
	}
}

void function SelectMap(var button)
{
	int index = Hud_GetScriptID( button ).tointeger() + (file.currentPage * 5 )

	SetFreeRoamMap(file.m_vMaps[index])

	HidePanel(file.panel)
}

void function OnShow(var panel)
{
	file.m_vMaps = GetPlaylistMaps("survival_dev")
	LoadMaps(0)
}

void function FreeRoamPageForward(var button)
{
	if(GetMaxPages() == 0)
		return

	int newPage = file.currentPage + 1

	if( newPage + 1 > GetMaxPages())
		newPage = 0

	LoadMaps(newPage)
}

void function FreeRoamPageBackwards(var button)
{
	if(GetMaxPages() == 0)
		return

	int newPage = file.currentPage - 1

	if( newPage - 1 < -1)
		newPage = GetMaxPages() - 1
	
	LoadMaps(newPage)
}

int function GetMaxPages()
{
	int maxPages = int( ceil(file.m_vMaps.len() / 5 ) ) + 1

	if(maxPages > 21)
		maxPages = 21

	return maxPages
}

void function LoadMaps(int page)
{
	EmitUISound( "UI_Menu_BattlePass_LevelTab" )

	file.currentPage = page

	HudElem_SetRuiArg( Hud_GetChild(file.panel, "PagesFooter"), "currentPage", file.currentPage )
	HudElem_SetRuiArg( Hud_GetChild(file.panel, "PagesFooter"), "numPages", GetMaxPages() )

	for(int i = 0; i < MAX_SHOWN_MAPS; i++)
	{
		int adjustedPageIndex = i + (file.currentPage * 5 )

		bool invalidIndex = adjustedPageIndex >= file.m_vMaps.len()

		Hud_SetVisible( Hud_GetChild(file.panel, "MapButton" + i), !invalidIndex )

		if(!invalidIndex)
		{
			RuiSetString( Hud_GetRui( Hud_GetChild( file.panel, "MapButton" + i ) ), "modeNameText", GetUIMapName(file.m_vMaps[adjustedPageIndex]) )
			RuiSetImage( Hud_GetRui( Hud_GetChild( file.panel, "MapButton" + i ) ), "modeImage", GetUIMapAsset(file.m_vMaps[adjustedPageIndex]) )
		}
	}
}