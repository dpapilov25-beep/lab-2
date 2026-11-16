@echo off
chcp 65001 >nul
set score_sublime=0
set score_atom=0
set score_notepadpp=0
echo === Модуль выбора текстового редактора ===
echo Команда из 8 разработчиков, ограниченный бюджет.
echo.
echo Вопрос 1: Какой бюджет на инструменты?
echo 1. Нулевой - только бесплатные программы
echo 2. Малый - до 5 тысяч рублей
echo 3. Нормальный - лицензии купить можем
choice /c 123 /n
if %errorlevel%==1 set /a score_notepadpp+=10
if %errorlevel%==2 set /a score_atom+=5
if %errorlevel%==2 set /a score_notepadpp+=5
if %errorlevel%==3 set /a score_sublime+=15
echo.
echo Вопрос 2: Насколько важны плагины и расширяемость?
echo 1. Критично - настроим редактор под себя
echo 2. Базовых возможностей достаточно
choice /c 12 /n
if %errorlevel%==1 set /a score_atom+=10
if %errorlevel%==1 set /a score_sublime+=5
if %errorlevel%==2 set /a score_notepadpp+=10
echo.
echo Вопрос 3: Будут ли очень большие файлы?
echo 1. Да - логи, дампы, большие конфиги
echo 2. Нет - обычные исходники
choice /c 12 /n
if %errorlevel%==1 set /a score_sublime+=10
if %errorlevel%==1 set /a score_notepadpp+=5
if %errorlevel%==2 set /a score_atom+=5
echo.
echo Вопрос 4: Какая квалификация у команды?
echo 1. В основном новички
echo 2. Опытные разработчики
choice /c 12 /n
if %errorlevel%==1 set /a score_notepadpp+=10
if %errorlevel%==2 set /a score_sublime+=10
if %errorlevel%==2 set /a score_atom+=5
echo.
set best=Notepad++
if %score_sublime% geq %score_atom% if %score_sublime% geq %score_notepadpp% set best=Sublime Text
if %score_atom% geq %score_sublime% if %score_atom% geq %score_notepadpp% set best=Atom
if %score_notepadpp% geq %score_sublime% if %score_notepadpp% geq %score_atom% set best=Notepad++
echo Баллы: Sublime=%score_sublime% Atom=%score_atom% Notepad++=%score_notepadpp%
echo Рекомендация: %best%
>"result_ch1.txt" echo Рекомендация: %best%
pause
