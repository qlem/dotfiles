--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--

-- Base
import XMonad
import System.Exit
import qualified XMonad.StackSet as W

-- Data
import Data.Monoid
import qualified Data.Map as M

-- Actions
import XMonad.Actions.CycleWS
import XMonad.Actions.WithAll (killAll)

-- Layouts
import XMonad.Layout.Spacing
import XMonad.Layout.Renamed

-- Hooks
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.InsertPosition

-- Utils
import XMonad.Util.Cursor

-- XF86 keys
import Graphics.X11.ExtraTypes.XF86

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal = "alacritty"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth = 0

-- Amount of space around windows
--
mySpacing :: Int
mySpacing = 6

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask = mod4Mask

-- dead circumflex key
--
xK_deadcircumflex :: KeySym
xK_deadcircumflex = 0xfe52

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces    = [" \61728 ", " \62057 ", " \61729 ", " \61888 ", " 5 ", " 6 ", " \61848 ", " \62409 ", " 9 "]
myWorkspaceKeys = [ xK_exclam
                  , xK_eacute
                  , xK_numbersign
                  , xK_dollar
                  , xK_percent
                  , xK_deadcircumflex
                  , xK_egrave
                  , xK_asterisk
                  , xK_parenleft ]

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#ff0000"

-- dmenu args
--
dmenuFn = "SourceCodePro:style=Regular:size=12:antialias=true"
dmenuNb = "\\#222222"
dmenuNf = "\\#bbbbbb"
dmenuSb = "\\#005577"
dmenuSf = "\\#eeeeee"

dmenuArgs :: String
dmenuArgs = " -fn " ++ dmenuFn ++ " -nb  " ++ dmenuNb ++ " -nf " ++ dmenuNf ++ " -sb " ++ dmenuSb ++ " -sf " ++ dmenuSf

-- toggle xmobar command
--
toggleXmobar :: String
toggleXmobar = "dbus-send --session --dest=org.Xmobar.Control --type=method_call '/org/Xmobar/Control' org.Xmobar.Control.SendSignal 'string:Toggle 0'"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launching programs
    [ ((modm,                   xK_Return   ), spawn $ XMonad.terminal conf)
    , ((modm,                   xK_slash    ), spawn "rofi -show drun")

    -- session
    , ((modm .|. controlMask,   xK_l        ), spawn "lock.sh")
    , ((modm,                   xK_grave    ), spawn ("session.sh" ++ dmenuArgs))

    -- quit, or restart
    , ((modm .|. controlMask,   xK_q        ), io (exitWith ExitSuccess))
    , ((modm .|. shiftMask  ,   xK_q        ), spawn "xmonad --recompile; xmonad --restart")

    -- kill pid
    , ((modm,               xK_p     ), spawn ("killpid.sh" ++ dmenuArgs))

    -- display management
    , ((modm,               xK_n     ), spawn ("display.sh" ++ dmenuArgs))

    -- brightness
    , ((0, xF86XK_MonBrightnessUp    ), spawn "light -A 5")
    , ((0, xF86XK_MonBrightnessDown  ), spawn "light -U 5")

    -- screen capture
    , ((0,                  xK_Print ), spawn ("screenshot.sh" ++ dmenuArgs))
    , ((shiftMask,          xK_Print ), spawn ("screenshot.sh --upload" ++ dmenuArgs))

    -- audio
    , ((0, xF86XK_AudioRaiseVolume   ), spawn "audio.sh --volume-up")
    , ((0, xF86XK_AudioLowerVolume   ), spawn "audio.sh --volume-down")
    , ((0, xF86XK_AudioMute          ), spawn "audio.sh --mute")
    , ((0, xF86XK_AudioMicMute       ), spawn "audio.sh --source-mute")

    -- killing clients
    , ((modm,               xK_x     ), kill)
    , ((modm .|. shiftMask, xK_x     ), killAll)

    -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    -- Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Toggle spacing if there is only one window displayed in the current workspace
    , ((modm,               xK_s     ), toggleSmartSpacing)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_r     ), refresh)

    -- move focus up or down the window stack
    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp)
    , ((modm,               xK_m     ), windows W.focusMaster)

    -- modifying the window order
    , ((modm,               xK_z     ), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown)
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp)

    -- cycle/shift through workspaces
    , ((modm              , xK_Left  ), prevWS)
    , ((modm              , xK_Right ), nextWS)
    , ((modm .|. shiftMask, xK_Left  ), shiftToPrev)
    , ((modm .|. shiftMask, xK_Right ), shiftToNext)

    -- resizing the master/slave ratio
    , ((modm,               xK_h     ), sendMessage Shrink)
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

     -- increase or decrease number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    , ((modm              , xK_b     ), spawn toggleXmobar)

    -- Run xmessage with a summary of the default keybindings (useful for beginners)
    -- , ((modm .|. shiftMask,   xK_slash ), xmessage help)
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) myWorkspaceKeys
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    -- ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    -- [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        -- | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        -- , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = renamed [CutWordsLeft 1]
         $ avoidStruts
         $ spacingWithEdge mySpacing
         $ tiled ||| mirror ||| full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = renamed [Replace "▸"] $ Tall nmaster delta ratio
     mirror  = renamed [Replace "▾"] $ Mirror tiled
     full    = renamed [Replace "▪"] Full

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = insertPosition End Newer <+> composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
    setDefaultCursor xC_left_ptr -- set default cursor

------------------------------------------------------------------------
-- xmobar

-- xmobarPP
--
myXmobarPP :: PP
myXmobarPP = def
    { ppSep              = magenta " ❯ "
    , ppWsSep            = ""
    , ppTitleSanitize    = xmobarStrip
    , ppCurrent          = white . wrap (magenta "<") (magenta ">")
    , ppHidden           = lowWhite . wrap (white "[") (white "]")
    , ppHiddenNoWindows  = lowWhite . wrap "[" "]"
    , ppUrgent           = red . wrap (yellow "!") (yellow "!")
    , ppLayout           = white . wrap (white "⌈") (white "⌋")
    , ppOrder            = \[ws, l, w] -> [ws, l, w]
    , ppExtras           = []
    }
  where
    -- colors
    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#7f7f7f" ""

-- xmobar toggleStrutsKey
--
myToggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
myToggleStrutsKey XConfig { modMask = modm } = (modm .|. shiftMask, xK_b)

-- status bar
--
mySB = statusBarProp "xmobar" $ pure myXmobarPP

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main :: IO ()
main = xmonad
     . withSB mySB
     . ewmhFullscreen
     . ewmh
     . docks
     $ myConfig

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
myConfig = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }
