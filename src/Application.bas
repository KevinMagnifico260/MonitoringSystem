
REM      Author & Copyright (c)     : Kevin C. Magnifico
REM      Computer language          : "FreeBASIC" family of BASIC programming language
REM      Programming Paradiagm      : Procedural Oriented Programming and Structured
REM      Created at                 : 2021-01-03
REM      License                    : GPLv3

#DEFINE __USE_GTK3__

#INCLUDE ONCE "gtk/gtk.bi"
#INCLUDE ONCE "AdminForm.bi"
#INCLUDE ONCE "MainForm.bi"

#DEFINE NULL 0

REM DIM theme AS GTKCSSPROVIDER PTR

DIM mf AS MainForm PTR = NULL
GTK_INIT(@__FB_ARGC__, @__FB_ARGV__)
mf = MainForm_New("User Time-in System - Front End View")
MainForm_InitComponents(mf)
MainForm_InitComponentEvents(mf)
MainForm_Show(mf)
GTK_MAIN()
MainForm_Release(mf)
