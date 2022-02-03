
	' SecondBASIC Studio v3.9.58
	Option XgmOff
	Dim BFCode$(1) As String
	BFCode$(1) = ">-[>>+.<<]/"
	Dim BFArray(15000) As Integer
	Dim PTR As Integer
	PTR = 5
	Dim INP$(1) As String
	Dim CodePTR As Integer
	CodePTR = 1
	Dim CodePTRf As Integer
	CodePTRf = 1
	X = 0
	Y = 0
	BFArray(PTR) = 0
	If Resetv$ = "Brainfucked" Then Goto EndBF End If
	Resetv$ = "Brainfucked"
	Color 2
program:
	If BFArray(PTR) > 256 Then
		BFArray(PTR) = 255
	End If
	If BFArray(PTR) > 255 Then
		BFArray(PTR) = 0
	End If
	If Mid$(BFCode$(1), CodePTR, 1) = "/" Then
		Goto EndBF
	End If
	If Mid$(BFCode$(1), CodePTR, 1) = "#" Then
		Print BFArray(PTR)
		CodePTR = CodePTR + 1
	End If
	If Mid$(BFCode$(1), CodePTR, 1) = "+" Then
		BFArray(PTR) = BFArray(PTR) + 1
		CodePTR = CodePTR + 1
	End If
	If Mid$(BFCode$(1), CodePTR, 1) = "-" Then
		BFArray(PTR) = BFArray(PTR) - 1
		CodePTR = CodePTR + 1
	End If
	If Mid$(BFCode$(1), CodePTR, 1) = ">" Then
		PTR = PTR + 1
		CodePTR = CodePTR + 1
	End If
	If Mid$(BFCode$(1), CodePTR, 1) = "<" Then
		PTR = PTR - 1
		CodePTR = CodePTR + 1
	End If
	If Mid$(BFCode$(1), CodePTR, 1) = "[" Then
		If BFArray(PTR) = 0 Then
			CodePTRf = CodePTR
			Checkforclosing:
				If Mid$(BFCode$(1), CodePTRf, 1) = "]" Then
					Goto Closingknown
				End If
				CodePTRf = CodePTRf + 1
			Goto Checkforclosing
			Closingknown:
				CodePTR = CodePTRf + 1
		Else
			CodePTR = CodePTR + 1
		End If
	End If
	If Mid$(BFCode$(1), CodePTR, 1) = "]" Then
		If BFArray(PTR) = 0 Then
			CodePTR = CodePTR + 1
		Else
			CodePTRf = CodePTR
			Checkforclosing2:
				If Mid$(BFCode$(1), CodePTRf, 1) = "[" Then
					Goto Closingknown2
				End If
				CodePTRf = CodePTRf - 1
			Goto Checkforclosing2
			Closingknown2:
				CodePTR = CodePTRf + 1
		End If
	End If
	If Mid$(BFCode$(1), CodePTR, 1) = "." Then
		Locate Y,X
		Print Chr$(BFArray(PTR))
		Color 2
		X = X + 1
		If X > 37 Then
			X = 0
			Y = Y + 1
		End If
		If Y > 24 Then
			Color 0
			Cls
			Color 2
			X = 0
			Y = 0
		End If
		CodePTR = CodePTR + 1
	End If
	If Mid$(BFCode$(1), CodePTR, 1) = "," Then
		Locate 24,0
		Input "",PTRStr$
		BFArray(PTR) = Asc(PTRStr$)
		Locate 24,0
		Print "     "
		CodePTR = CodePTR + 1
	End If
	Goto program
EndBF:
