"scripts/resource/ui/menus/CustomLobby/panels/credits.res"
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
    CreditProfileButton0
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              0
        xpos                  10
        ypos                  20
        tabPosition           1
        cursorVelocityModifier 0.7

        navRight              CreditProfileButton1
        navDown               CreditProfileButton4
    }
    CreditProfileButton1
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              1
        xpos                  -121
        cursorVelocityModifier 0.7

        navLeft               CreditProfileButton0
        navRight              CreditProfileButton2
        navDown               CreditProfileButton5

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
        xpos                  -121
        cursorVelocityModifier 0.7

        navLeft               CreditProfileButton1
        navRight              CreditProfileButton3
        navDown               CreditProfileButton6

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
        xpos                  -121
        cursorVelocityModifier 0.7

        navLeft               CreditProfileButton2
        navDown               CreditProfileButton7

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
        ypos                  35
        cursorVelocityModifier 0.7
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton0
        navRight              CreditProfileButton5
        navDown               CreditProfileButton8

        pin_to_sibling        CreditProfileButton0
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner BOTTOM_LEFT
    }
    CreditProfileButton5
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              5
        xpos                  -121
        cursorVelocityModifier 0.7
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton1
        navLeft               CreditProfileButton4
        navRight              CreditProfileButton6
        navDown               CreditProfileButton9

        pin_to_sibling        CreditProfileButton4
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }
    CreditProfileButton6
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              6
        xpos                  -121
        cursorVelocityModifier 0.7
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton2
        navLeft               CreditProfileButton5
        navRight              CreditProfileButton7
        navDown               CreditProfileButton10

        pin_to_sibling        CreditProfileButton5
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }
    CreditProfileButton7
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              7
        xpos                  -121
        cursorVelocityModifier 0.7
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton3
        navLeft               CreditProfileButton6
        navDown               CreditProfileButton11

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
        ypos                  35
        cursorVelocityModifier 0.7
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton4
        navRight              CreditProfileButton9

        pin_to_sibling        CreditProfileButton4
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner BOTTOM_LEFT
    }
    CreditProfileButton9
    {
        ControlName           RuiButton
        InheritProperties     WeaponCategoryButton
        classname             CreditProfileButtonClass
        scriptID              9
        xpos                  -121
        cursorVelocityModifier 0.7
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton5
        navLeft               CreditProfileButton8
        navRight              CreditProfileButton10

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
        xpos                  -121
        cursorVelocityModifier 0.7
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton6
        navLeft               CreditProfileButton9
        navRight              CreditProfileButton11

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
        xpos                  -121
        cursorVelocityModifier 0.7
        ruiArgs
        {
            isNameAtTop       1
        }

        navUp                 CreditProfileButton7
        navLeft               CreditProfileButton10

        pin_to_sibling        CreditProfileButton10
        pin_corner_to_sibling TOP_LEFT
        pin_to_sibling_corner TOP_RIGHT
    }
}