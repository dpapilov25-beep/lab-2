@echo off
chcp 65001 >nul
:menu
cls
echo ========================================
echo   СИСТЕМА МОДЕЛИРОВАНИЯ ПРОЦЕССОВ РАЗРАБОТКИ ПО
echo ========================================
echo.
echo 1. Модуль выбора технологий
echo 2. Модуль инспекции кода
echo 3. Модуль сравнительного анализа
echo 4. Запустить все модули последовательно
echo 5. Выход
echo.
set /p choice="Ваш выбор: "
if "%choice%"=="1" call chapter1.bat
if "%choice%"=="2" call chapter2.bat
if "%choice%"=="3" call chapter3.bat
if "%choice%"=="4" goto all
if "%choice%"=="5" exit
goto menu
:all
call chapter1.bat
call chapter2.bat
call chapter3.bat
echo.
echo === Итоговый отчёт системы ===
echo === Итоговый отчёт системы === > report.txt
type result_ch1.txt >> report.txt
type result_ch2.txt >> report.txt
type result_ch3.txt >> report.txt
type report.txt
echo.
echo Отчёт сохранён в report.txt
pause
goto menu
