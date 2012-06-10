import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar ~/.xmobarrc.hs"
    xmonad $ defaultConfig { 
        manageHook = manageDocks <+> manageHook defaultConfig,
        layoutHook = avoidStruts  $  layoutHook defaultConfig,
        logHook = dynamicLogWithPP xmobarPP {
            ppOutput = hPutStrLn xmproc,
            ppTitle = xmobarColor "green" "" . shorten 50
            },
        terminal = "urxvt",
        modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        -- Ctrl+Alt+Del to lock screen
        [ ((controlMask .|. mod1Mask, xK_Delete), spawn "xscreensaver-command -lock")
        -- Win+b for browser
        , ((mod4Mask, xK_b), spawn "chromium-browser")
        -- Win+f for file manager
        , ((mod4Mask, xK_f), spawn "nautilus")
        -- Ctrl+Print to save a delayed screencap
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        -- Print for a no-delay screencap
        , ((0, xK_Print), spawn "scrot")
        ]        
