{-# LANGUAGE FlexibleInstances, MultiParamTypeClasses #-}

import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ICCCMFocus

import XMonad.Util.EZConfig

import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders

import Control.Arrow ((***), second)

import qualified XMonad.StackSet as W

import XMonad.Util.Run(spawnPipe)
import System.IO

myLayouts = avoidStruts $ smartBorders $ tiled ||| leftTiled ||| Full
    where
        tiled = Tall nmaster delta ratio

        leftTiled = Flip tiled

        nmaster = 1

        ratio = 1/2

        delta = 3/100

newtype Flip l a = Flip (l a) deriving (Show, Read)

instance LayoutClass l a => LayoutClass (Flip l) a where
    runLayout (W.Workspace i (Flip l) ms) r = (map (second flipRect) *** fmap Flip)
                                                `fmap` runLayout (W.Workspace i l ms) (flipRect r)
                                         where screenWidth = fromIntegral $ rect_width r
                                               flipRect (Rectangle rx ry rw rh) = Rectangle (screenWidth - rx - (fromIntegral rw)) ry rw rh
    handleMessage (Flip l) = fmap (fmap Flip) . handleMessage l
    description (Flip l) = "Flip "++ description l


main = do
xmproc <- spawnPipe "xmobar"
xmonad $ ewmh defaultConfig
	{ manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = myLayouts
        , logHook = takeTopFocus >> dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , focusFollowsMouse = False
        , startupHook = setWMName "LG3D"
	, terminal = "urxvt"
  , handleEventHook = handleEventHook defaultConfig <+> fullscreenEventHook
	} `additionalKeys`
    [ ((mod1Mask, xK_o ), spawn "gnome-screenshot") 
     ,((mod1Mask, xK_F10 ), spawn "gnome-screenshot -a")
     ,((mod1Mask, xK_F7), spawn "xbacklight -3")
     ,((mod1Mask, xK_F8), spawn "xbacklight +3")
     ,((mod1Mask, xK_F5), spawn "amixer -D pulse sset Master 5%-")
     ,((mod1Mask, xK_F6), spawn "amixer -D pulse sset Master 5%+")
     ,((mod1Mask, xK_F9), spawn "monitor")
    ] 
	
