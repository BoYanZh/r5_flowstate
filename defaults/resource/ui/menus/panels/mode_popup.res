"resource/ui/menus/panels/mode_popup.res"
{
    PanelFrame
    {
		ControlName				Label
		xpos					0
		ypos					0
		wide					%100
		tall					%100
		labelText				""
		visible				    1
        bgcolor_override        "0 0 255 128"
        paintbackground         1

        proportionalToParent    0
    }

    ModeList
    {
        ControlName				GridButtonListPanel
        xpos                    0
        ypos                    0
        tall                    60
        columns                 1
        rows                    12
        buttonSpacing           0
        scrollbarSpacing        6
        scrollbarOnLeft         0
        visible					1
        ButtonSettings
        {
            rui                     "ui/generic_popup_button.rpak"
            clipRui                 1
            wide					367
            tall					60
            cursorVelocityModifier  0.7
        }
    }
}