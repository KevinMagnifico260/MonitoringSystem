
REM      Author & Copyright (c)     : Kevin C. Magnifico
REM      Computer language          : "FreeBASIC" family of BASIC programming language
REM      Programming Paradiagm      : Procedural Oriented Programming
REM      Created at                 : 2021-01-03
REM      License                    : GPLv3

#INCLUDE ONCE "MainForm.bi"

#DEFINE NULL      0
#DEFINE W_WIDTH   640
#DEFINE W_HEIGHT  480
#DEFINE STR_NULL  ""

DIM SHARED prvt_self AS MainForm PTR

DECLARE SUB btntimein_Clicked(BYVAL widget AS GTKWIDGET PTR, BYVAL user_data AS GPOINTER)
DECLARE SUB btntimeout_Clicked(BYVAL widget AS GTKWIDGET PTR, BYVAL user_data AS GPOINTER)
DECLARE SUB Clear_Input()

FUNCTION MainForm_New(title AS STRING) AS MainForm PTR
	DIM self AS MainForm PTR
	self = ALLOCATE(SIZEOF(MainForm))
	*(self).window = GTK_WINDOW_NEW(GTK_WINDOW_TOPLEVEL)
	GTK_WINDOW_SET_TITLE(GTK_WINDOW(*(self).window), title)
	GTK_WIDGET_SET_SIZE_REQUEST(*(self).window, W_WIDTH, W_HEIGHT)
	GTK_WINDOW_SET_RESIZABLE(GTK_WINDOW(*(self).window), FALSE)
	GTK_WINDOW_SET_POSITION(GTK_WINDOW(*(self).window), GTK_WIN_POS_CENTER)
	G_SIGNAL_CONNECT(G_OBJECT(*(self).window), "destroy", G_CALLBACK(@GTK_MAIN_QUIT), NULL)
	RETURN self
END FUNCTION

SUB MainForm_InitComponents(self AS MainForm PTR)
	*(self).layout = GTK_FIXED_NEW()
	*(self).lbluserid = GTK_LABEL_NEW("User ID")
	*(self).entuserid = GTK_ENTRY_NEW()
	*(self).lblpasswrd = GTK_LABEL_NEW("Password")
	*(self).entpasswrd = GTK_ENTRY_NEW()
	*(self).btntimein = GTK_BUTTON_NEW()
	*(self).btntimeout = GTK_BUTTON_NEW()
	*(self).btnadmin = GTK_BUTTON_NEW()
	
	GTK_BUTTON_SET_LABEL(GTK_BUTTON(*(self).btntimein), "Time-in")
	GTK_BUTTON_SET_LABEL(GTK_BUTTON(*(self).btntimeout), "Time-out")
	GTK_BUTTON_SET_LABEL(GTK_BUTTON(*(self).btnadmin), "Log-in as Admin")
	
	GTK_WIDGET_SET_SIZE_REQUEST(*(self).entuserid, 320, 24)
	GTK_WIDGET_SET_SIZE_REQUEST(*(self).entpasswrd, 320, 24)
	GTK_WIDGET_SET_SIZE_REQUEST(*(self).btntimein, 128, 32)
	GTK_WIDGET_SET_SIZE_REQUEST(*(self).btntimeout, 128, 32)
	GTK_WIDGET_SET_SIZE_REQUEST(*(self).btnadmin, 320, 32)
	
	GTK_ENTRY_SET_VISIBILITY(GTK_ENTRY(*(self).entpasswrd), FALSE)
	
	GTK_FIXED_PUT(GTK_FIXED(*(self).layout), *(self).lbluserid, 150, 124)
	GTK_FIXED_PUT(GTK_FIXED(*(self).layout), *(self).entuserid, 150, 148)
	GTK_FIXED_PUT(GTK_FIXED(*(self).layout), *(self).lblpasswrd, 150, 188)
	GTK_FIXED_PUT(GTK_FIXED(*(self).layout), *(self).entpasswrd, 150, 212)
	GTK_FIXED_PUT(GTK_FIXED(*(self).layout), *(self).btntimein, 150, 264)
	GTK_FIXED_PUT(GTK_FIXED(*(self).layout), *(self).btntimeout, 342, 264)
	GTK_FIXED_PUT(GTK_FIXED(*(self).layout), *(self).btnadmin, 150, 320)
	
	GTK_CONTAINER_ADD(GTK_CONTAINER(*(self).window), *(self).layout)
	
	prvt_self = self
END SUB

SUB MainForm_InitComponentEvents(self AS MainForm PTR)
	G_SIGNAL_CONNECT(G_OBJECT(*(self).btntimein), "clicked", G_CALLBACK(@btntimein_Clicked), NULL)
	G_SIGNAL_CONNECT(G_OBJECT(*(self).btntimeout), "clicked", G_CALLBACK(@btntimeout_Clicked), NULL)
END SUB

PRIVATE SUB btntimein_Clicked(BYVAL widget AS GTKWIDGET PTR, BYVAL user_data AS GPOINTER)
	PRINT "Time-in clicked"
	REM GTK_ENTRY_SET_TEXT(GTK_ENTRY(*(prvt_self).entuserid), "Time-in")\
	DIM userid AS STRING
	DIM password AS STRING
	userid = STR(*(GTK_ENTRY_GET_TEXT(GTK_ENTRY(*(prvt_self).entuserid))))
	password = STR(*(GTK_ENTRY_GET_TEXT(GTK_ENTRY(*(prvt_self).entpasswrd))))
	IF userid = "admin" AND password = "admin" THEN
		PRINT "Time-in"
		Clear_Input()
	ELSE
		PRINT "Invalid userid or password"
	ENDIF
END SUB

PRIVATE SUB btntimeout_Clicked(BYVAL widget AS GTKWIDGET PTR, BYVAL user_data AS GPOINTER)
	PRINT "Time-out clicked"
	REM GTK_ENTRY_SET_TEXT(GTK_ENTRY(*(prvt_self).entuserid), "Time-out")
	DIM userid AS STRING
	DIM password AS STRING
	userid = STR(*(GTK_ENTRY_GET_TEXT(GTK_ENTRY(*(prvt_self).entuserid))))
	password = STR(*(GTK_ENTRY_GET_TEXT(GTK_ENTRY(*(prvt_self).entpasswrd))))
	IF userid = "admin" AND password = "admin" THEN
		PRINT "Time-out"
		Clear_Input()
	ELSE
		PRINT "Invalid userid or password"
	ENDIF
END SUB

PRIVATE SUB Clear_Input()
	GTK_ENTRY_SET_TEXT(GTK_ENTRY(*(prvt_self).entuserid), STR_NULL)
	GTK_ENTRY_SET_TEXT(GTK_ENTRY(*(prvt_self).entpasswrd), STR_NULL)
END SUB

SUB MainForm_Show(self AS MainForm PTR)
	GTK_WIDGET_SHOW(*(self).lbluserid)
	GTK_WIDGET_SHOW(*(self).entuserid)
	GTK_WIDGET_SHOW(*(self).lblpasswrd)
	GTK_WIDGET_SHOW(*(self).entpasswrd)
	GTK_WIDGET_SHOW(*(self).btntimein)
	GTK_WIDGET_SHOW(*(self).btntimeout)
	GTK_WIDGET_SHOW(*(self).btnadmin)
	GTK_WIDGET_SHOW(*(self).layout)
	GTK_WIDGET_SHOW(*(self).window)
END SUB

SUB MainForm_Release(self AS MainForm PTR)
	IF self <> NULL THEN
		DEALLOCATE(self)
		self = NULL
		PRINT "Deallocate object has been successfully"
	END IF
END SUB

