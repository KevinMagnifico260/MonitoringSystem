
REM      Author & Copyright (c)     : Kevin C. Magnifico
REM      Computer language          : "FreeBASIC" family of BASIC programming language
REM      Programming Paradiagm      : Procedural Oriented Programming
REM      Created at                 : 2021-01-03
REM      License                    : GPLv3

#IFNDEF __ADMINFORM__BI
#DEFINE __ADMINFORM__BI

#DEFINE __USE_GTK3__

#INCLUDE ONCE "gtk/gtk.bi"

TYPE AdminForm
	window      AS GTKWIDGET PTR
	lssemp      AS GTKWIDGET PTR
	btnaddemp   AS GTKWIDGET PTR
	btnedtemp   AS GTKWIDGET PTR
	entsearch   AS GTKWIDGET PTR
	btnadmin    AS GTKWIDGET PTR
END TYPE

DECLARE FUNCTION AdminForm_New() AS AdminForm PTR
DECLARE SUB AdminForm_InitComponents(self AS AdminForm PTR)
DECLARE SUB AdminForm_InitComponentEvents(self AS AdminForm PTR)
DECLARE SUB AdminForm_Show(self AS AdminForm PTR)
DECLARE SUB AdminForm_Release(self AS AdminForm PTR)

#ENDIF
