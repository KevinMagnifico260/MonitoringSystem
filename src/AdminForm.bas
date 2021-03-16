
REM      Author & Copyright (c)     : Kevin C. Magnifico
REM      Computer language          : "FreeBASIC" family of BASIC programming language
REM      Programming Paradiagm      : Procedural Oriented Programming
REM      Created at                 : 2021-01-03
REM      License                    : GPLv3

#INCLUDE ONCE "AdminForm.bi"

FUNCTION AdminForm_New() AS AdminForm PTR
	DIM self AS AdminForm PTR
	self = ALLOCATE(SIZEOF(AdminForm))
	PRINT "Allocate object has been successfully"
	RETURN self
END FUNCTION

SUB AdminForm_InitComponents(self AS AdminForm PTR)
	
END SUB

SUB AdminForm_InitComponentEvents(self AS AdminForm PTR)
	
END SUB

SUB AdminForm_Show(self AS AdminForm PTR)
	
END SUB

SUB AdminForm_Release(self AS AdminForm PTR)
	IF self <> NULL THEN
		DEALLOCATE(self)
		self = NULL
		PRINT "Deallocate object has been successfully"
	END IF
END SUB
