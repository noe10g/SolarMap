@echo off
title SolarMap - Arranque completo

echo ===============================
echo      INICIANDO SOLARMAP
echo ===============================

REM -------------------------------
REM BACKEND FASTAPI + MODELO
REM -------------------------------

REM Carpeta donde esta este .bat (raiz del proyecto)
set "ROOT=%~dp0"

start "Backend FastAPI - Modelo IA" cmd /k "cd /d %ROOT% && .venv\Scripts\activate && cd /d %ROOT%src\Mapa y Modelo Tejados && uvicorn api.main:app --reload"

REM -------------------------------
REM FRONTEND REACT
REM -------------------------------

start "Frontend React - SolarMap" cmd /k "cd /d %ROOT%frontend\solarmapuem-main && npm run dev"

REM -------------------------------
REM ESPERAR Y ABRIR WEB
REM -------------------------------

timeout /t 6 > nul

start http://localhost:8080

echo.
echo SolarMap iniciado correctamente.
echo No cierres las terminales abiertas.
echo.

pause