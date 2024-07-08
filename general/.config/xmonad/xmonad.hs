-- vim: foldmethod=marker foldlevel=0

import XMonad
import XMonad.Actions.CycleWS
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import XMonad.Hooks.Modal
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Accordion
import XMonad.Layout.Spacing


restartXmonad = spawn
    $  "if type xmonad;"
    ++ " then xmonad --recompile && xmonad --restart;"
    ++ " else xmessage xmonad not in \\$PATH;"
    ++ " fi"

main :: IO ()
main = xmonad . modal [modeGaps] . docks . ewmhFullscreen . ewmh $ cfg
    `removeKeysP`
        [ "M-S-<Tab>", "M-<Tab>" -- extra next/prev window
        , "M-S-w", "M-w" -- xinerama screen 1
        , "M-S-e", "M-e" -- xinerama screen 2
        , "M-S-r", "M-r" -- xinerama screen 3
        , "M-S-p", "M-p" -- dmenu and qmrun
        , "M-S-c" -- kill window (sxhkd does that)
        ]
    `additionalKeysP`
        [ ("M-b", sendMessage ToggleStruts)
        , ("M-[", prevWS)
        , ("M-]", nextWS)
        , ("M-S-[", shiftToPrev *> prevWS)
        , ("M-S-]", shiftToNext *> nextWS)
        , ("M-g", setMode modeGapsLabel)
        , ("M-r", restartXmonad)
        ]

cfg = def
    { terminal = "kitty"
    , modMask = mod4Mask -- super key
    , layoutHook = myLayoutHook
    , startupHook = myStartupHook
    , manageHook = myManageHook
    }

myLayoutHook = avoidStruts
    $ let borderSize = Border 0 0 0 0 in
        spacingRaw False borderSize True borderSize True
    $ tiled ||| Mirror tiled ||| Full ||| Accordion
        where
            tiled   = Tall nmaster delta ratio
            nmaster = 1     -- The default number of windows in the master pane
            ratio   = 1/2   -- Default proportion of screen occupied by master pane
            delta   = 3/100 -- Percent of screen to increment by when resizing panes

myStartupHook = do
    spawnOnce "polybar -c ~/.config/polybar/config.ini main"

myManageHook = composeAll
    [ className =? "Galculator" --> doFloat
    , className =? "zenity" --> doFloat
    , className =? "float-term" --> doFloat
    , className =? "Tor Browser" --> doFloat
    , className =? "Lxappearance" --> doFloat
    , className =? "Pavucontrol" --> doFloat
    , className =? "System-config-printer.py" --> doFloat
    , className =? "Zathura" --> doShift "4"
    , className =? "firefox" --> doShift "2"
    ]

modeGapsLabel = "Gaps"
modeGaps :: Mode
modeGaps = mode modeGapsLabel $ mkKeysEz [
        ("j", incScreenWindowSpacing 5),
        ("k", decScreenWindowSpacing 5),
        ("0", setScreenWindowSpacing 0),
        ("s", toggleSmartSpacing)
    ]

