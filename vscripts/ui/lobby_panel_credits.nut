global function InitCreditPanel
global function ShowCreditPanel

struct CreditDialogPageData
{
	asset  image = $""
	string imageName = ""
	string title = ""
	string desc = ""
	string link = ""
}

enum eTransType
{
	// must match TRANSTYPE_* in promo.rui
	NONE = 0,
	SLIDE_LEFT = 1,
	SLIDE_RIGHT = 2,

	_count,
}

struct
{
	var  					  menu
	var                       panel
	var  					  prevPageButton
	var  					  nextPageButton
	bool pageChangeInputsRegistered
	array<var>                buttons
	table<var, ItemFlavor>    buttonToCategory
	
	string ornull      hijackContent = null
	void functionref() hijackCloseCallback = null

	array<CreditDialogPageData> pages
	int                        activePageIndex = 0
	var                        lastPageRui
	var                        activePageRui
	int                        updateID = -1
} file


void function InitCreditPanel( var panel )
{
	file.panel = panel

	SetPanelTabTitle( panel, "CREDITS" )

	AddPanelFooterOption( panel, LEFT, BUTTON_B, true, "#B_BUTTON_BACK", "#B_BUTTON_BACK" )
	
	//var menu = GetMenu( "credits" )
	//file.menu = menu
	
	//AddMenuEventHandler( menu, eUIEvent.MENU_OPEN, CreditDialog_OnOpen )
	//AddMenuEventHandler( menu, eUIEvent.MENU_CLOSE, CreditDialog_OnClose )

	//file.prevPageButton = Hud_GetChild( menu, "PrevPageButton" )
	//HudElem_SetRuiArg( file.prevPageButton, "flipHorizontal", true )
	//Hud_AddEventHandler( file.prevPageButton, UIE_CLICK, Page_NavLeft )

	//file.nextPageButton = Hud_GetChild( menu, "NextPageButton" )
	//Hud_AddEventHandler( file.nextPageButton, UIE_CLICK, Page_NavRight )

	//file.lastPageRui = Hud_GetRui( Hud_GetChild( menu, "LastPage" ) )
	//file.activePageRui = Hud_GetRui( Hud_GetChild( menu, "ActivePage" ) )
}

void function Page_NavLeft( var button )
{
	ChangePage( -1 )
}


void function Page_NavRight( var button )
{
	ChangePage( 1 )
}


void function ChangePage( int delta )
{
	Assert( delta == -1 || delta == 1 )

	int newPageIndex = file.activePageIndex + delta
	if ( newPageIndex < 0 || newPageIndex >= file.pages.len() )
		return

	int lastPageIndex = file.activePageIndex
	file.activePageIndex = newPageIndex
	int transType = delta == 1 ? eTransType.SLIDE_LEFT : eTransType.SLIDE_RIGHT

	UpdatePageRui( file.lastPageRui, lastPageIndex )
	UpdatePageRui( file.activePageRui, file.activePageIndex )
	TransitionPage( file.activePageRui, transType )
	EmitUISound( "UI_Menu_MOTD_Tab" )

	UpdatePromoButtons()
}


void function UpdatePageRui( var rui, int pageIndex )
{
	CreditDialogPageData page = file.pages[pageIndex]
}


void function TransitionPage( var rui, int transType )
{
	file.updateID++
	RuiSetInt( rui, "transType", transType )
	RuiSetInt( rui, "updateID", file.updateID )
}


void function UpdatePromoButtons()
{
	if ( file.activePageIndex == 0 )
		Hud_Hide( file.prevPageButton )
	else
		Hud_Show( file.prevPageButton )

	if ( file.activePageIndex == file.pages.len() - 1 )
		Hud_Hide( file.nextPageButton )
	else
		Hud_Show( file.nextPageButton )

	UpdateFooterOptions()
}



bool function IsButtonFocused()
{
	if ( file.buttons.contains( GetFocus() ) )
		return true

	return false
}
void function ShowCreditPanel()
{
    file.buttonToCategory.clear()
}

void function ArmoryPanel_OnHide( var panel )
{
	file.buttonToCategory.clear()
}


void function ArmoryPanel_OnFocusChanged( var panel, var oldFocus, var newFocus )
{
	if ( !IsValid( panel ) ) // uiscript_reset
		return

	if ( !newFocus || GetParentMenu( panel ) != GetActiveMenu() )
		return

	UpdateFooterOptions()
}

void function RegisterPageChangeInput()
{
	if ( file.pageChangeInputsRegistered )
		return

	RegisterButtonPressedCallback( BUTTON_SHOULDER_LEFT, Page_NavLeft )
	RegisterButtonPressedCallback( BUTTON_DPAD_LEFT, Page_NavLeft )
	RegisterButtonPressedCallback( KEY_LEFT, Page_NavLeft )

	RegisterButtonPressedCallback( BUTTON_SHOULDER_RIGHT, Page_NavRight )
	RegisterButtonPressedCallback( BUTTON_DPAD_RIGHT, Page_NavRight )
	RegisterButtonPressedCallback( KEY_RIGHT, Page_NavRight )


	file.pageChangeInputsRegistered = true

	//thread TrackDpadInput()
}


void function DeregisterPageChangeInput()
{
	if ( !file.pageChangeInputsRegistered )
		return

	DeregisterButtonPressedCallback( BUTTON_SHOULDER_LEFT, Page_NavLeft )
	DeregisterButtonPressedCallback( BUTTON_DPAD_LEFT, Page_NavLeft )
	DeregisterButtonPressedCallback( KEY_LEFT, Page_NavLeft )

	DeregisterButtonPressedCallback( BUTTON_SHOULDER_RIGHT, Page_NavRight )
	DeregisterButtonPressedCallback( BUTTON_DPAD_RIGHT, Page_NavRight )
	DeregisterButtonPressedCallback( KEY_RIGHT, Page_NavRight )

	file.pageChangeInputsRegistered = false
}

void function CreditDialog_OnOpen()
{
	file.pages = InitPages()
	file.activePageIndex = 0

	//UpdatePageRui( file.activePageRui, 0 )
	UpdatePromoButtons()
	RegisterPageChangeInput()
}

array<CreditDialogPageData> function InitPages()
{
	array<CreditDialogPageData> pages

	// Temp
	CreditDialogPageData newPage
	pages.append( newPage )

	return pages
}

void function CreditDialog_OnClose()
{
	DeregisterPageChangeInput()

	if ( file.hijackContent != null )
	{
		file.hijackContent = null
		if ( file.hijackCloseCallback != null )
		{
			file.hijackCloseCallback()
			file.hijackCloseCallback = null
		}
	}
}