-- vim: foldmethod=marker foldlevel=0

import XMonad
import XMonad.Actions.CycleWS (prevWS, nextWS, shiftToPrev, shiftToNext)
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Hooks.Modal (Mode, modal, setMode, mode, mkKeysEz)
import XMonad.Hooks.EwmhDesktops (ewmh, ewmhFullscreen)
import XMonad.Hooks.ManageDocks
import qualified XMonad.StackSet as W
import XMonad.Layout.Accordion
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageHelpers (doCenterFloat)

import Data.Maybe
import Control.Monad.State


restartXmonad :: X ()
restartXmonad = spawn $ concat
    [ "if type xmonad;"
    , " then xmonad --recompile && xmonad --restart;"
    , " else xmessage xmonad not in \\$PATH;"
    , " fi"
    ]

main :: IO ()
main = xmonad . modal [modeGaps] . docks . ewmhFullscreen . ewmh $ cfg
    `removeKeysP`
        [ "M-S-<Return>", "M-<Return>"
        , "M-S-<Tab>", "M-<Tab>" -- extra next/prev window
        , "M-S-w", "M-w" -- xinerama screen 1
        , "M-S-e", "M-e" -- xinerama screen 2
        , "M-S-r", "M-r" -- xinerama screen 3
        , "M-S-p", "M-p" -- dmenu and qmrun
        , "M-S-c" -- kill window (sxhkd does that)
        , "M-h", "M-l" -- now using < and >
        ]
    `additionalKeysP`
        [ ("M-S-<Return>", windows W.swapMaster)
        , ("M-[", prevWS), ("M-h", prevWS)
        , ("M-]", nextWS), ("M-l", nextWS)
        , ("M-S-[", shiftToPrev *> prevWS) , ("M-S-h", shiftToPrev *> prevWS)
        , ("M-S-]", shiftToNext *> nextWS) , ("M-S-l", shiftToNext *> nextWS)
        , ("M-g", setMode modeGapsLabel)
        , ("M-S-r", restartXmonad)
        , ("M-S-,", sendMessage Shrink)
        , ("M-S-.", sendMessage Expand)
        , ("M-y", withFocused hide)
        ]

cfg = def
    { terminal = "kitty"
    , modMask = mod4Mask -- super key
    , layoutHook = myLayoutHook
    , startupHook = myStartupHook
    , manageHook = myManageHook
    , focusedBorderColor = "red"
    }

{-# ANN myLayoutHook "HLint: ignore Redundant id" #-}
myLayoutHook = id
    $ avoidStruts
    $ spacingRaw False borderSize True borderSize True
    $ smartBorders
    $ tiled ||| Mirror tiled ||| Full ||| Accordion
    where
        tiled   = Tall nmaster delta ratio
        nmaster = 1     -- The default number of windows in the master pane
        ratio   = 1/2   -- Default proportion of screen occupied by master pane
        delta   = 3/100 -- Percent of screen to increment by when resizing panes
        borderSize = Border 0 0 0 0

myStartupHook = do
    spawnOnce "polybar -c ~/.config/polybar/config.ini main"

myManageHook = composeAll
    [ className =? "Galculator" --> doCenterFloat
    , className =? "zenity" --> doCenterFloat
    , className =? "float-term" --> doCenterFloat
    , className =? "Tor Browser" --> doCenterFloat
    , className =? "Lxappearance" --> doCenterFloat
    , className =? "pavucontrol" --> doCenterFloat
    , className =? "System-config-printer.py" --> doCenterFloat
    , className =? "Gcr-prompter" --> doCenterFloat -- GPG, pass...
    , className =? "Xmessage" --> doCenterFloat
    , className =? "confirm" --> doCenterFloat
    , className =? "file_progress" --> doCenterFloat
    , className =? "dialog" --> doCenterFloat
    , className =? "download" --> doCenterFloat
    , className =? "error" --> doCenterFloat

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

