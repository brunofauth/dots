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


main :: IO ()
main = xmonad . modal [modeGaps] . docks . ewmhFullscreen . ewmh $ cfg
    `additionalKeysP`
    [
        ("M-b", sendMessage ToggleStruts),
        ("M-[", prevWS),
        ("M-]", nextWS),
        ("M-S-[", shiftToPrev *> prevWS),
        ("M-S-]", shiftToNext *> nextWS),
        ("M-g", setMode modeGapsLabel)
    ]


cfg = def {
    terminal = "kitty",
    -- modMask = mod4Mask -- super key
    layoutHook = myLayoutHook,
    startupHook = myStartupHook
}

mySpacing = spacingRaw False borderSize True borderSize True
    where borderSize = (Border 0 0 0 0)

myLayoutHook = avoidStruts $ mySpacing (tiled ||| Mirror tiled ||| Full ||| Accordion)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

myStartupHook = do
    -- Desktop environment apps
    spawnOnce "polybar -c ~/.config/polybar/config.ini main"

modeGapsLabel = "Gaps"
modeGaps :: Mode
modeGaps = mode modeGapsLabel $ mkKeysEz [
        ("j", incScreenWindowSpacing 5),
        ("k", decScreenWindowSpacing 5),
        ("0", setScreenWindowSpacing 0),
        ("s", toggleSmartSpacing)
    ]

