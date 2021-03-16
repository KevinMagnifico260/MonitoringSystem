
REM      Author & Copyright (c)     : Kevin C. Magnifico
REM      Computer language          : "FreeBASIC" family of BASIC programming language
REM      Programming Paradiagm      : Procedural Oriented Programming
REM      Created at                 : 2021-01-03
REM      License                    : GPLv3

#IFNDEF __MAINFORM__BI
#DEFINE __MAINFORM__BI

#DEFINE __USE_GTK3__

#INCLUDE ONCE "gtk/gtk.bi"

TYPE MainForm
	window      AS GTKWIDGET PTR
	layout      AS GTKWIDGET PTR
	lbluserid   AS GTKWIDGET PTR
	lblpasswrd  AS GTKWIDGET PTR
	entuserid   AS GTKWIDGET PTR
	entpasswrd  AS GTKWIDGET PTR
	btntimein   AS GTKWIDGET PTR
	btntimeout  AS GTKWIDGET PTR
	btnadmin    AS GTKWIDGET PTR
END TYPE

DECLARE FUNCTION MainForm_New(title AS STRING) AS MainForm PTR
DECLARE SUB MainForm_InitComponents(self AS MainForm PTR)
DECLARE SUB MainForm_InitComponentEvents(self AS MainForm PTR)
DECLARE SUB MainForm_Show(self AS MainForm PTR)
DECLARE SUB MainForm_Release(self AS MainForm PTR)

#ENDIF
