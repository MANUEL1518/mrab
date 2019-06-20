@echo off

REM Espero y te agrade. No olvides visitar mi espacio en github. con amor: MANUEL H. PONCE

if %1 == 1 (
	goto Imagenes
) ELSE (
	if %1 == 2 (
		goto Documentos
	) ELSE (
		if %1 == 3 (
			goto Musica
		) ELSE (
			if %1 == 4 (
				goto Videos
			) ELSE (
				if %1 == 5 (
					goto Todo
				) ELSE (
					if %1 == 13 (
						goto delete
					) ELSE (
						if %1 == help (
							goto menu
						) ELSE (
							goto error
						)
					)
				)
			)
		)
	)
)
set /a r = 0
:menu
echo.
echo            ########     #######    ########
echo            # #   # #   # #   # #   # #   # #
echo            # #   # #   # #   # #   # #   # #
echo            # #### #    # ##### #   # #### #
echo            # #   # #   # #   # #   # #   # #
echo            # #   # #   # #   # #   # #   # #
echo            ###   ### # ###   ### # ########
echo.
echo              http://github.com/MANUEL1518
echo.
echo  ------------------------------------------------------ 
echo.
echo  Copia todos los archivos del equipo de distintos tipos
echo     una carpeta en la ruta donde esta este archivo
echo.
echo  ------------------------------------------------------
echo  -              1.       Imagenes                     -
echo  -              2.   Documentos:Office                -
echo  -              3.        Musica                      -
echo  -              4.        Videos                      -
echo  -              5.         Todo                       -
echo  -             13.    Borrar COPIADOS                 -
echo  ------------------------------------------------------
echo.
echo  Sintaxis: mrab [tipo de archivo]
goto end                   

:Imagenes
IF NOT EXIST "COPIADOS\Imagenes\"%USERNAME% MD "COPIADOS\Imagenes\"%USERNAME%
echo.
echo   Copiando Imagenes...
for /R C:/Users/%USERNAME%/ %%x in (*.jpg,*.png) do (
	copy "%%x" "COPIADOS\Imagenes\"%USERNAME% > Nul
	set /a r += 1
)
goto total

:Documentos
IF NOT EXIST "COPIADOS\Documentos\"%USERNAME% MD "COPIADOS\Documentos\"%USERNAME%
echo.
echo   Copiando Documentos...
for /R C:/Users/%USERNAME%/ %%x in (*.pdf,*.ppsx,*.pptx,*.xlsx,*.docx,*.txt) do (
	copy "%%x" "COPIADOS\Documentos\"%USERNAME% > Nul
	set /a r += 1
)
goto total

:Musica
IF NOT EXIST "COPIADOS\Musica\"%USERNAME% MD "COPIADOS\Musica\"%USERNAME%
echo.
echo   Copiando Musica...
for /R C:/Users/%USERNAME%/ %%x in (*.mp3,*.wav) do (
	copy "%%x" "COPIADOS\Musica\"%USERNAME% > Nul
	set /a r += 1
)
goto total

:Videos
IF NOT EXIST "COPIADOS\Videos\"%USERNAME% MD "COPIADOS\Videos\"%USERNAME%
echo.
echo   Copiando Videos...
for /R C:/Users/%USERNAME%/ %%x in (*.mp4,.avi,*.wmv) do (
	copy "%%x" "COPIADOS\Videos\"%USERNAME% > Nul
	set /a r += 1
)
goto total

:Todo
IF NOT EXIST "COPIADOS\Todo\"%USERNAME% MD "COPIADOS\Todo\"%USERNAME%
echo.
echo   Copiando Todo...
for /R C:/Users/%USERNAME%/ %%x in (*.jpg,*.png,*.pdf,*.ppsx,*.pptx,*.xlsx,*.docx,*.txt,*.mp3,*.wav,*.mp4,.avi,*.wmv) do (
	copy "%%x" "COPIADOS\Todo\"%USERNAME% > Nul
	set /a r += 1
)
goto total

:delete
IF EXIST "COPIADOS\" (
	RD /s /q COPIADOS\
) ELSE (
	echo.
	echo No existe carpeta de archivos COPIADOS
	goto end
)
goto erase

:total
echo.
echo   #########################################
echo.
echo   Total de archivos copiados: %r%
echo.
echo   #########################################
echo.
echo   Ruta: ./COPIADOS/
goto erase

:error
echo.
echo  ERROR !!! Los parametros ingresados son incorrectos
echo.
echo  Puedes obtener mas informacion ingresando: mrab help
goto end

:erase
echo.
echo   [-] OK
set /a r = 0

:end
set /a r = 0