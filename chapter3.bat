@echo off
chcp 65001 >nul
echo === Модуль сравнительного анализа (WSM) ===
echo Альтернативы: Sublime Text, Atom, Notepad++
echo Критерии: 1 - скорость работы, 2 - наличие плагинов, 3 - стоимость лицензии
echo.
echo Назначьте веса критериям в процентах, сумма должна быть 100:
set /p w1="Вес критерия 1 (скорость): "
set /p w2="Вес критерия 2 (плагины): "
set /p w3="Вес критерия 3 (стоимость): "
set /a total_weight=w1+w2+w3
if %total_weight% neq 100 (
echo Ошибка: сумма весов не равна 100!
pause
exit
)
echo.
echo Оцените альтернативы по шкале от 1 до 5:
echo --- Sublime Text ---
set /p s1="Скорость (1-5): "
set /p s2="Плагины (1-5): "
set /p s3="Стоимость (1-5): "
echo --- Atom ---
set /p a1="Скорость (1-5): "
set /p a2="Плагины (1-5): "
set /p a3="Стоимость (1-5): "
echo --- Notepad++ ---
set /p n1="Скорость (1-5): "
set /p n2="Плагины (1-5): "
set /p n3="Стоимость (1-5): "
set /a score_s=s1*w1+s2*w2+s3*w3
set /a score_a=a1*w1+a2*w2+a3*w3
set /a score_n=n1*w1+n2*w2+n3*w3
echo.
echo === Матрица решений ===
echo Критерий      ^| Вес ^| Sublime ^| Atom ^| Notepad++
echo Скорость      ^| %w1%  ^| %s1%      ^| %a1%   ^| %n1%
echo Плагины       ^| %w2%  ^| %s2%      ^| %a2%   ^| %n2%
echo Стоимость     ^| %w3%  ^| %s3%      ^| %a3%   ^| %n3%
echo ИТОГО         ^|     ^| %score_s%    ^| %score_a% ^| %score_n%
echo.
set best=Notepad++
if %score_s% geq %score_a% if %score_s% geq %score_n% set best=Sublime Text
if %score_a% geq %score_s% if %score_a% geq %score_n% set best=Atom
if %score_n% geq %score_s% if %score_n% geq %score_a% set best=Notepad++
echo Победитель: %best%
>"result_ch3.txt" echo Победитель сравнительного анализа: %best%
pause
