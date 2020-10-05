@echo off
::Start of file
	color c
	:cosa
		set /p COSA=Inserisci "a" per spegnere, "b" per riavviare e "c" per annullare: 
		IF %COSA%==a GOTO spegni
		IF %COSA%==b GOTO riavvia
		IF %COSA%==c GOTO interrompi

	:spegni
		color 3
		set /p MINUTI=Inserisci minuti: 
		set /a RESULT=%MINUTI%*60
		shutdown /f /t %RESULT% /s
		echo Ho avviato la funzione shutdown
		echo Il computer si spegnera' tra %MINUTI% minuti
		echo Hai pianificato di spegnere il pc dopo %MINUTI% minuti il: %date%, alle: %time% >> LogSpegni.txt
		GOTO ripeti
	:riavvia
		shutdown /r /t 5
		color E
		echo Sto riavviando il pc
		echo Hai riavviato il pc: %MINUTI% minuti il: %date%, alle: %time% >> LogSpegni.txt
		GOTO ripeti

	:interrompi
		color 6
		shutdown /a
		echo Ho interrotto lo spegnimento pianificato del pc
		echo Hai interrotto la pianificazione: %date%, alle: %time% >> LogSpegni.txt
		GOTO ripeti

	:ripeti 
		set /p RIPETI=Inserisci "n" per spegnere, "y" per ripetere: 
		IF %RIPETI%==n GOTO pause
		IF %RIPETI%==y GOTO cosa
		
	:pause
		pause
::End of file