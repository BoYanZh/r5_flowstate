global function InitR5RLobbyMenu
global function ActivateNav

struct NavButton {
	var button
	var panel
	int index
	int presentationType
}

struct
{
	var menu

	var HomePanel
	var CreateServerPanel
	var ServerBrowserPanel

	bool initialisedHomePanel = false

	int currentpanel = 0
	int CurrentNavIndex = 0
	array<var> TopButtons

	table<var,NavButton> BtnToNav
} file

void function InitR5RLobbyMenu( var newMenuArg )
{
	var menu = GetMenu( "R5RLobbyMenu" )
	file.menu = menu

	//Add menu event handlers
    AddMenuEventHandler( menu, eUIEvent.MENU_SHOW, OnR5RLobby_Show )
	AddMenuEventHandler( menu, eUIEvent.MENU_OPEN, OnR5RLobby_Open )
	AddMenuEventHandler( menu, eUIEvent.MENU_CLOSE, OnR5RLobby_Close )
	AddMenuEventHandler( menu, eUIEvent.MENU_NAVIGATE_BACK, OnR5RLobby_Back )

	file.TopButtons = GetElementsByClassname( file.menu, "TopButtons" )
		foreach ( elem in file.TopButtons )
			Hud_SetVisible( elem, false )
			
	CreateNavButtons()
	ToolTips_AddMenu( menu )
}

void function OnR5RLobby_Open()
{
	ServerBrowser_UpdateFilterLists()
	SetupLobby()

	//Show Home Panel
	ActivateNav( 0 )

	ToolTips_MenuOpened( file.menu )
	RegisterServerBrowserButtonPressedCallbacks()
	InitPanelonLobbyLoad()
}

void function OnR5RLobby_Close()
{
	ToolTips_MenuClosed( file.menu )
	UnRegisterServerBrowserButtonPressedCallbacks()
}

void function OnR5RLobby_Show()
{

}

void function OnR5RLobby_Back()
{
	if(pmatch_MenuOpen)
    {
		foreach(var p in GetElementsByClassnameForMenus( "CustomPrivateMatchMenu", uiGlobal.allMenus))
        	Hud_SetVisible( p, false )

        pmatch_MenuOpen = false
		return
    }

	if(file.currentpanel != 0)
	{
		ActivateNav( 0 )
		return
	}

	AdvanceMenu( GetMenu( "SystemMenu" ) )
}

void function SetupLobby()
{
	// Setup Lobby Stuff
	UI_SetPresentationType( CurrentPresentationType )
	thread TryRunDialogFlowThread()

	Play_SetupUI()

	if ( !file.initialisedHomePanel )
	{
		ItemFlavor character = GetItemFlavorByHumanReadableRef( GetCurrentPlaylistVarString( "set_legend", "character_revenant" ) )
		RequestSetItemFlavorLoadoutSlot( LocalClientEHI(), Loadout_CharacterClass(), character )

		file.initialisedHomePanel = true
	}

}

////////////////////////////////////////////////////////////////////////////////////////
//
// Nav Buttons
//
////////////////////////////////////////////////////////////////////////////////////////

void function CreateNavButtons()
{
	file.CurrentNavIndex = 0

	//Max size of 6 tabs

	AddNavButton("Play", Hud_GetChild(file.menu, "HomePanel"), ePresentationType.PLAY, void function( var button ) {
		Play_SetupUI()
	} )

	AddNavButton("Servers", Hud_GetChild(file.menu, "ServerBrowserPanel"), ePresentationType.COLLECTION_EVENT, void function( var button ) { } )

	AddNavButton("Create", Hud_GetChild(file.menu, "CreatePanel"), ePresentationType.CHARACTER_SELECT, void function( var button ) {
		OnCreateMatchOpen()
	} )

	AddNavButton("Legends", Hud_GetChild(file.menu, "LegendsPanel"), ePresentationType.CHARACTER_SELECT, void function( var button ) {
		R5RCharactersPanel_Show()
	} )

	AddNavButton("Loadout", Hud_GetChild(file.menu, "LoadoutPanel"), ePresentationType.WEAPON_CATEGORY, void function( var button ) {ShowLoadoutPanel()}, true )

	AddNavButton("Credits", Hud_GetChild(file.menu, "CreditsPanel"), ePresentationType.WEAPON_CATEGORY, void function( var button ) {ShowCreditPanel()}, true )

	/*AddNavButton("Settings", null, void function( var button ) {
		AdvanceMenu( GetMenu( "MiscMenu" ) )
	} )*/
}

void function AddNavButton(string title, var panel, int presentationType, void functionref(var button) Click = null, bool enabled = true)
{
	NavButton navbtn
	navbtn.button = file.TopButtons[file.CurrentNavIndex]
	navbtn.panel = panel
	navbtn.index = file.CurrentNavIndex
	navbtn.presentationType = presentationType
	file.BtnToNav[file.TopButtons[file.CurrentNavIndex]] <- navbtn

	RuiSetString( Hud_GetRui(file.TopButtons[file.CurrentNavIndex]), "buttonText", title )
	Hud_SetVisible( file.TopButtons[file.CurrentNavIndex], true )
	Hud_SetEnabled( file.TopButtons[file.CurrentNavIndex], enabled)

	Hud_AddEventHandler( file.TopButtons[file.CurrentNavIndex], UIE_CLICK, NavPressed )
	Hud_AddEventHandler( file.TopButtons[file.CurrentNavIndex], UIE_CLICK, Click )
	file.CurrentNavIndex++
}

void function ActivateNav(int index)
{
	NavPressed(file.TopButtons[index])
}

void function NavPressed(var button)
{
	NavButton navbtn = file.BtnToNav[button]

	if(navbtn.panel == null)
		return

	UI_SetPresentationType( navbtn.presentationType )
	CurrentPresentationType = navbtn.presentationType
	
	//Hide all panels
	foreach ( var btn, NavButton nav in  file.BtnToNav) {
		if(nav.panel != null)
			Hud_SetVisible( nav.panel, false )

		RuiSetBool( Hud_GetRui( nav.button ) ,"isSelected", false )
	}

	RuiSetBool( Hud_GetRui( button ) ,"isSelected", true )
	Hud_SetVisible( navbtn.panel, true )
	file.currentpanel = navbtn.index
}