@ECHO OFF
TITLE REGCLIENT, PACKETS AND IDEMIA BACKUP TOOL
ECHO COMPUTER : %computername%
ECHO DATE : %date%

Set mydate=%DATE:~-4%%DATE:~-7,2%%DATE:~-10,2%
Set DirName=%computername% Regclient_1.4.3_Updated_Validation ^(%mydate%^)
Set DirName2=%computername% Reg-client.1.4.4_012122 ^(%mydate%^)
Set DirName3=%computername% RegClient ^(%mydate%^)

ECHO,
ECHO ====================NOTICE======================
ECHO MAKE SURE YOU TRIED UPLOADING ALL YOUR PACKETS!
ECHO,
ECHO PLEASE CLOSE THE REGCLIENT UPON USING THIS TOOL!
ECHO,
ECHO THIS WILL BACKUP THE FIRST MATCHED FOLDER FOUND.
ECHO,
ECHO PLEASE COORDINATE WITH YOUR I.S.A UPON USE!
ECHO ====================NOTICE======================
ECHO,
ECHO,

set /p answer=@%time% DO YOU INTEND TO BACKUP TODAY ^(Y/N^)? 
ECHO @%time% ANSWER : %answer%
ECHO,
IF %answer%==Y GOTO backup
IF %answer%==y GOTO backup
IF %answer%==N GOTO END
IF %answer%==n GOTO END

ECHO,
ECHO @%time% INVALID INPUT
ECHO,
GOTO END

:backup
ECHO @%time% DEFAULT REGCLIENT PATH FINDER :
IF exist C:\PhilSys_20210713\Regclient_1.4.3_Updated_Validation\* (
  ECHO C:\PhilSys_20210713\Regclient_1.4.3_Updated_Validation Exists : True
) ELSE ( ECHO C:\PhilSys_20210713\Regclient_1.4.3_Updated_Validation Exists : False )
IF exist C:\PhilSys_20210713\Reg-client.1.4.4_012122\* (
  ECHO C:\PhilSys_20210713\Reg-client.1.4.4_012122 Exists : True
) ELSE ( ECHO C:\PhilSys_20210713\Reg-client.1.4.4_012122 Exists : False )
IF exist C:\PhilSys_20220121\Reg-client.1.4.4_012122\* (
  ECHO C:\PhilSys_20220121\Reg-client.1.4.4_012122 Exists : True
) ELSE ( ECHO C:\PhilSys_20220121\Reg-client.1.4.4_012122 Exists : False )

ECHO,
ECHO @%time% DEFAULT BIOSDK PATH FINDER :
IF exist C:\PHILSYS_IDEMIA_SDK\* (
  ECHO C:\PHILSYS_IDEMIA_SDK Exists : True
) ELSE ( ECHO C:\PHILSYS_IDEMIA_SDK Exists : False )


ECHO,
ECHO @%time% REGCLIENT BACKUP INSTANTIATION :
IF exist C:\PhilSys_20210713\Regclient_1.4.3_Updated_Validation\* (
    XCOPY "C:\PhilSys_20210713\Regclient_1.4.3_Updated_Validation" "D:\%DirName3%\" /s /e /w
	ECHO,
	ECHO @%time% PHILSYS_IDEMIA BACKUP INSTANTIATION :
	XCOPY "C:\PHILSYS_IDEMIA_SDK" "D:\%DirName3%\PHILSYS_IDEMIA_SDK\" /s /e /w
    ECHO,
    ECHO @%time% BACKUP SUMMARY :
    ECHO FOLDER NAME = "%DirName3%"
    ECHO NEW PATH = "D:\%DirName3%\"
) ELSE (
  IF exist C:\PhilSys_20210713\Reg-client.1.4.4_012122\* (
      XCOPY "C:\PhilSys_20210713\Reg-client.1.4.4_012122" "D:\%DirName3%\" /s /e /w
	  ECHO,
	  ECHO @%time% PHILSYS_IDEMIA BACKUP INSTANTIATION :
	  XCOPY "C:\PHILSYS_IDEMIA_SDK" "D:\%DirName3%\PHILSYS_IDEMIA_SDK\" /s /e /w
      ECHO,
      ECHO @%time% BACKUP SUMMARY :
      ECHO FOLDER NAME = "%DirName3%"
      ECHO NEW PATH = "D:\%DirName3%\"
    ) ELSE (
        IF exist C:\PhilSys_20220121\Reg-client.1.4.4_012122\* (
            XCOPY "C:\PhilSys_20220121\Reg-client.1.4.4_012122" "D:\%DirName3%\" /s /e /w
			ECHO,
			ECHO @%time% PHILSYS_IDEMIA BACKUP INSTANTIATION :
			XCOPY "C:\PHILSYS_IDEMIA_SDK" "D:\%DirName3%\PHILSYS_IDEMIA_SDK\" /s /e /w
            ECHO,
            ECHO @%time% BACKUP SUMMARY :
	    ECHO FOLDER NAME = "%DirName3%"
    	    ECHO NEW PATH = "D:\%DirName3%\"
    	) ELSE (
		ECHO,
		ECHO NO DEFAULT DIRECTORIES FOUND TO BACKUP.
		ECHO REGCLIENT, PACKETS OR IDEMIA MAY HAVE BEEN STORED SOMEWHERE ELSE.
		ECHO PLEASE DO NOT RENAME ORIGINAL FOLDERS IN C:\
	)
    )
)

ECHO,
PAUSE

:END
ECHO,
ECHO @%time% USER EXITING

ECHO,
PAUSE
