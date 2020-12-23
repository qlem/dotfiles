/* See LICENSE file for copyright and license details. */

#include <X11/XF86keysym.h>

/* -- PATCHES -- */
// attachbottom: https://dwm.suckless.org/patches/attachbottom/
// bottomstack (only bstack function): https://dwm.suckless.org/patches/bottomstack/
// tilegap: https://dwm.suckless.org/patches/tilegap/
// movestack (installed manually): https://dwm.suckless.org/patches/movestack/
// notitle: https://dwm.suckless.org/patches/notitle/
// statusallmons: https://dwm.suckless.org/patches/statusallmons/
// focusmaster: https://dwm.suckless.org/patches/focusmaster/

/* -- Compile dwm-setstatus --  */
// gcc dwm-setstatus.c -lX11 -o dwm-setstatus

/* appearance */
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int gappx     = 12;
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = {"SourceCodePro:style=Regular:size=12:antialias=true"};
static const char dmenufont[]       = "SourceCodePro:style=Regular:size=12:antialias=true";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]      = {
    /*               fg         bg         border   */
    [SchemeNorm] = {col_gray3, col_gray1, col_gray2},
    [SchemeSel]  = {col_gray4, col_cyan,  col_cyan},
};

/* tagging */
static const char *tags[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9"};

/* layout(s) */
static const float mfact     = 0.5;  /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
    /* symbol     arrange function */
    {"[|]",      tile},    /* first entry is default */
    {"[-]",      bstack},
    {"[ ]",      monocle},
    {"[*]",      NULL},    /* no layout function means floating behavior */
};

/* rules */
static const Rule rules[] = {
    /* xprop(1):
     *  WM_CLASS(STRING) = instance, class
     *  WM_NAME(STRING) = title
     */
    /* class      instance    title       tags mask     isfloating   monitor */
    {"jetbrains-toolbox", "JetBrains Toolbox", "JetBrains Toolbox", 0, 1, -1},
};

/* -- PROGRAMS -- */

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) {.v = (const char*[]){"/bin/sh", "-c", cmd, NULL}}

/* default */
static char       dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {"dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL};

/* global */
static const char *lock[] = {"lock.sh", NULL};
static const char *term[] = {"alacritty", NULL};
static const char *menu[] = {"rofi", "-show", "drun", NULL};

/* brightness */
static const char *bcklight_up[]   = {"light", "-A", "5", NULL};
static const char *bcklight_down[] = {"light", "-U", "5", NULL};

/* audio */
static const char *pa_vlm_up[]   = {"audio.sh", "--volume-up", NULL};
static const char *pa_vlm_down[] = {"audio.sh", "--volume-down", NULL};
static const char *pa_mute[]     = {"audio.sh", "--mute", NULL};
static const char *pa_mic_mute[] = {"audio.sh", "--source-mute", NULL};
static const char *pavucontrol[] = {"pavucontrol", "-t", "3", NULL};

/* session */
static const char *session[] = {"session.sh", "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL};

/* screen capture */
static const char *screenshot[]    = {"screenshot.sh", "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL};
static const char *screenshot_up[] = {"screenshot.sh", "--upload", "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL};

/* external screens */
static const char *display[] = {"display.sh", "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL};

/* -- BINDINGS -- */

// MODKEY                       + TAG N = switch view to tag n
// MODKEY|ControlMask           + TAG N = toggle selection of tag n
// MODKEY|ShiftMask             + TAG N = move current window to tag n
// MODKEY|ControlMask|ShiftMask + TAG N = toggle current window to tag n

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
    {MODKEY,                       KEY,      view,           {.ui = 1 << TAG}}, \
    {MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG}}, \
    {MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG}}, \
    {MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG}},

/* binds */
static Key keys[] = {
    /* modifier                     key        function        argument */

    // open a terminal window
    {MODKEY,                       XK_Return, spawn,          {.v = term}},

    // open application launcher
    {MODKEY,                       XK_slash,  spawn,          {.v = menu}},

    // manage external screens
    {MODKEY,                       XK_n,      spawn,          {.v = display}},

    // session actions
    {MODKEY,                       XK_Delete, spawn,          {.v = session}},
    {MODKEY|ControlMask,           XK_l,      spawn,          {.v = lock}},
    {MODKEY|ControlMask,           XK_q,      quit,           {0}},

    // backlight controls
    {0,                            XF86XK_MonBrightnessUp,    spawn, {.v = bcklight_up}},
    {0,                            XF86XK_MonBrightnessDown,  spawn, {.v = bcklight_down}},

    // volume controls
    {0,                            XF86XK_AudioRaiseVolume,   spawn, {.v = pa_vlm_up}},
    {0,                            XF86XK_AudioLowerVolume,   spawn, {.v = pa_vlm_down}},
    {0,                            XF86XK_AudioMute,          spawn, {.v = pa_mute}},
    {0,                            XF86XK_AudioMicMute,       spawn, {.v = pa_mic_mute}},
    {MODKEY,                       XK_p,                      spawn, {.v = pavucontrol}},

    // screen capture
    {MODKEY,                       XK_Print,  spawn,          {.v = screenshot}},
    {MODKEY|ShiftMask,             XK_Print,  spawn,          {.v = screenshot_up}},

    // bar toggle
    {MODKEY,                       XK_b,      togglebar,      {0}},

    // change layout
    {MODKEY,                       XK_space,  setlayout,      {0}},
    {MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]}},
    {MODKEY,                       XK_o,      setlayout,      {.v = &layouts[1]}},
    {MODKEY,                       XK_e,      setlayout,      {.v = &layouts[2]}},
    {MODKEY,                       XK_f,      setlayout,      {.v = &layouts[3]}},

    // float toggle
    {MODKEY|ShiftMask,             XK_t,      togglefloating, {0}},

    // focus master / stack / monitor
    {MODKEY,                       XK_m,      focusmaster,    {0}},
    {MODKEY,                       XK_j,      focusstack,     {.i = +1}},
    {MODKEY,                       XK_k,      focusstack,     {.i = -1}},
    {MODKEY,                       XK_Tab,    focusstack,     {.i = +1}},
    {MODKEY|ShiftMask,             XK_Tab,    focusstack,     {.i = -1}},
    {MODKEY,                       XK_Right,  focusmon,       {.i = +1}},
    {MODKEY,                       XK_Left,   focusmon,       {.i = -1}},

    // master area actions
    {MODKEY,                       XK_i,      incnmaster,     {.i = +1}},
    {MODKEY,                       XK_d,      incnmaster,     {.i = -1}},
    {MODKEY,                       XK_l,      setmfact,       {.f = +0.05}},
    {MODKEY,                       XK_h,      setmfact,       {.f = -0.05}},

    // swap current window
    {MODKEY,                       XK_z,      zoom,           {0}},
    {MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1}},
    {MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1}},

    // move current window to same tag in next / prev monitor
    {MODKEY|ShiftMask,             XK_Right,  tagmon,         {.i = +1}},
    {MODKEY|ShiftMask,             XK_Left,   tagmon,         {.i = -1}},

    // kill window
    {MODKEY,                       XK_x,      killclient,     {0}},

    // other
    {MODKEY,                       XK_v,      view,           {0}},
    {MODKEY|ShiftMask,             XK_v,      view,           {.ui = ~0}},
    {MODKEY|ShiftMask,             XK_g,      tag,            {.ui = ~0}},

    // see -- key definitions --
    TAGKEYS(                       XK_exclam,                 0)
    TAGKEYS(                       XK_eacute,                 1)
    TAGKEYS(                       XK_numbersign,             2)
    TAGKEYS(                       XK_dollar,                 3)
    TAGKEYS(                       XK_percent,                4)
    TAGKEYS(                       XK_dead_circumflex,        5)
    TAGKEYS(                       XK_egrave,                 6)
    TAGKEYS(                       XK_asterisk,               7)
    TAGKEYS(                       XK_parenleft,              8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
    /* click                event mask      button          function        argument */
    {ClkLtSymbol,          0,              Button1,        setlayout,      {0}},
    {ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]}},
    {ClkStatusText,        0,              Button2,        spawn,          {.v = term}},
    {ClkClientWin,         MODKEY,         Button1,        movemouse,      {0}},
    {ClkClientWin,         MODKEY,         Button2,        togglefloating, {0}},
    {ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0}},
    {ClkTagBar,            0,              Button1,        view,           {0}},
    {ClkTagBar,            0,              Button3,        toggleview,     {0}},
    {ClkTagBar,            MODKEY,         Button1,        tag,            {0}},
    {ClkTagBar,            MODKEY,         Button3,        toggletag,      {0}},
};
