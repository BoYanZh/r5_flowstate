"scripts/resource/ui/menus/panels/credits.res"
{
    PanelFrame
    {
        ControlName             Label
        xpos                    0
        ypos                    0
        wide                   %100
        tall                   %100
        labelText              ""
        visible                 0
        bgcolor_override       "0 0 0 0"
        paintbackground        1
    }
	PrevPageButton
    {
        ControlName				RuiButton
        wide					960
        tall					594
        rui                     "ui/promo_page_change_button.rpak"
        labelText               ""
        visible					0
        proportionalToParent    1
        sound_accept            "UI_Menu_MOTD_Tab"

        pin_to_sibling			ActivePage
        pin_corner_to_sibling	TOP_LEFT
        pin_to_sibling_corner	TOP_LEFT
     }

    NextPageButton
    {
        ControlName				RuiButton
        wide					960
        tall					594
        xpos                    50
        ypos                    -150
        rui                     "ui/promo_page_change_button.rpak"
        labelText               ""
        visible					1
        proportionalToParent    1
        sound_accept            "UI_Menu_MOTD_Tab"

        pin_to_sibling			PanelFrame
        pin_corner_to_sibling	TOP_RIGHT
        pin_to_sibling_corner	TOP_RIGHT
    }
    Background
    {
        ControlName				RuiPanel
		wide					%400
		tall					%200
		ypos                    -200
        visible					1
        enabled					1
        proportionalToParent    1
        visible                 1
        rui 					"ui/tabs_background.rpak"
    }
    HeaderPanel
    {
        ControlName				RuiPanel
        xpos                    950
		ypos                    30
        visible					1
        enabled					1
        proportionalToParent    1
        visible                 1
        rui 					"ui/store_header_special.rpak"
    }
    // First Row (Buttons 0-5)
    CreditProfileButton0
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              0
        xpos                  40
        ypos                  100
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170

        navRight              CreditProfileButton1
        navDown               CreditProfileButton6
    }

    CreditProfileButton1
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              1
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170

        navLeft               CreditProfileButton0
        navRight              CreditProfileButton2
        navDown               CreditProfileButton7

        pin_to_sibling        CreditProfileButton0
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    CreditProfileButton2
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              2
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170

        navLeft               CreditProfileButton1
        navRight              CreditProfileButton3
        navDown               CreditProfileButton8

        pin_to_sibling        CreditProfileButton1
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    CreditProfileButton3
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              3
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170

        navLeft               CreditProfileButton2
        navRight              CreditProfileButton4
        navDown               CreditProfileButton9

        pin_to_sibling        CreditProfileButton2
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    CreditProfileButton4
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              4
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170

        navLeft               CreditProfileButton3
        navRight              CreditProfileButton5
        navDown               CreditProfileButton10

        pin_to_sibling        CreditProfileButton3
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    CreditProfileButton5
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              5
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170

        navLeft               CreditProfileButton4
        navDown               CreditProfileButton11

        pin_to_sibling        CreditProfileButton4
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    // Second Row (Buttons 6-11)
    CreditProfileButton6
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              6
        ypos                  35
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton0
        navRight              CreditProfileButton7
        navDown               CreditProfileButton12

        pin_to_sibling        CreditProfileButton0
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner BOTTOM_LEFT
    }

    CreditProfileButton7
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              7
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton1
        navLeft               CreditProfileButton6
        navRight              CreditProfileButton8
        navDown               CreditProfileButton13

        pin_to_sibling        CreditProfileButton6
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    CreditProfileButton8
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              8
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton2
        navLeft               CreditProfileButton7
        navRight              CreditProfileButton9
        navDown               CreditProfileButton14

        pin_to_sibling        CreditProfileButton7
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    CreditProfileButton9
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              9
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton3
        navLeft               CreditProfileButton8
        navRight              CreditProfileButton10
        navDown               CreditProfileButton15

        pin_to_sibling        CreditProfileButton8
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    CreditProfileButton10
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              10
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton4
        navLeft               CreditProfileButton9
        navRight              CreditProfileButton11
        navDown               CreditProfileButton16

        pin_to_sibling        CreditProfileButton9
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    CreditProfileButton11
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              11
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton5
        navLeft               CreditProfileButton10
        navDown               CreditProfileButton17

        pin_to_sibling        CreditProfileButton10
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    // Third Row (Buttons 12-17)
    CreditProfileButton12
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              12
        ypos                  50
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton6
        navRight              CreditProfileButton13
        navDown               CreditProfileButton18

        pin_to_sibling        CreditProfileButton6
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner BOTTOM_LEFT
    }

    CreditProfileButton13
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              13
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton7
        navLeft               CreditProfileButton12
        navRight              CreditProfileButton14
        navDown               CreditProfileButton19

        pin_to_sibling        CreditProfileButton12
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    CreditProfileButton14
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              14
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton8
        navLeft               CreditProfileButton13
        navRight              CreditProfileButton15
        navDown               CreditProfileButton20

        pin_to_sibling        CreditProfileButton13
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    CreditProfileButton15
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              15
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton9
        navLeft               CreditProfileButton14
        navRight              CreditProfileButton16
        navDown               CreditProfileButton21

        pin_to_sibling        CreditProfileButton14
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    CreditProfileButton16
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              16
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton10
        navLeft               CreditProfileButton15
        navRight              CreditProfileButton17
        navDown               CreditProfileButton22

        pin_to_sibling        CreditProfileButton15
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    CreditProfileButton17
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              17
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton11
        navLeft               CreditProfileButton16
        navDown               CreditProfileButton23

        pin_to_sibling        CreditProfileButton16
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    // Fourth Row (Buttons 18-23)
    CreditProfileButton18
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              18
        ypos                  65
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton12
        navRight              CreditProfileButton19

        pin_to_sibling        CreditProfileButton12
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner BOTTOM_LEFT
    }

    CreditProfileButton19
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              19
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton13
        navLeft               CreditProfileButton18
        navRight              CreditProfileButton20

        pin_to_sibling        CreditProfileButton18
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    CreditProfileButton20
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              20
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton14
        navLeft               CreditProfileButton19
        navRight              CreditProfileButton21

        pin_to_sibling        CreditProfileButton19
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    CreditProfileButton21
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              21
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton15
        navLeft               CreditProfileButton20
        navRight              CreditProfileButton22

        pin_to_sibling        CreditProfileButton20
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    CreditProfileButton22
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              22
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton16
        navLeft               CreditProfileButton21
        navRight              CreditProfileButton23

        pin_to_sibling        CreditProfileButton21
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }

    CreditProfileButton23
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              23
        xpos                  -80
        cursorVelocityModifier 0.7
        wide                  370
        tall                  170
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton17
        navLeft               CreditProfileButton22

        pin_to_sibling        CreditProfileButton22
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }
}