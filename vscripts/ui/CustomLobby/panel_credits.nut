global function InitCreditPanel
global function ShowCreditPanel

struct
{
	var                       panel
	array<var>                buttons
	table<var, ItemFlavor>    buttonToCategory

	var miscCustomizeButton
} file


void function InitCreditPanel( var panel )
{
	file.panel = panel

	SetPanelTabTitle( panel, "CREDITS" )

	AddPanelFooterOption( panel, LEFT, BUTTON_B, true, "#B_BUTTON_BACK", "#B_BUTTON_BACK" )
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