@echo off
chcp 65001 >nul
set correct=0
set total=3
echo === Модуль инспекции кода ===
echo Фрагменты кода конфигурации текстового редактора.
echo.
echo --- Фрагмент 1: загрузка плагинов ---
echo 10: def load_plugins(cfg):
echo 11:     enabled = []
echo 12:     enabled = ["linter", "autosave"]
echo 13:     return enabled
echo.
echo Какой дефект здесь скрыт?
echo 1. Неинициализированная переменная
echo 2. Мёртвое присваивание
echo 3. Утечка ресурса
choice /c 123 /n
if %errorlevel%==2 (
echo Верно! Строка 11 всё равно затирается строкой 12.
set /a correct+=1
) else (
echo Неверно. Правильный ответ: 2
)
echo.
echo --- Фрагмент 2: таймаут автосохранения ---
echo 20: def set_autosave(t):
echo 21:     result = t * 3600
echo 22:     apply_setting(result)
echo 23:     return result
echo.
echo Какой дефект здесь скрыт?
echo 1. Магическое число
echo 2. Неинициализированная переменная
echo 3. Утечка ресурса
choice /c 123 /n
if %errorlevel%==1 (
echo Верно! Число 3600 надо вынести в именованную константу.
set /a correct+=1
) else (
echo Неверно. Правильный ответ: 1
)
echo.
echo --- Фрагмент 3: сохранение настроек ---
echo 30: def save_settings(data):
echo 31:     f = open("config.json", "w")
echo 32:     f.write(data)
echo 33:     status = "saved"
echo 34:     return status
echo.
echo Какой дефект здесь скрыт?
echo 1. Отсутствие обработки ошибок
echo 2. Мёртвое присваивание
echo 3. Магическое число
choice /c 123 /n
if %errorlevel%==1 (
echo Верно! Нет try/except на случай сбоя записи файла.
set /a correct+=1
) else (
echo Неверно. Правильный ответ: 1
)
echo.
echo === Итоговый отчёт ===
echo Правильных ответов: %correct% из %total%
set /a percentage=correct*100/total
echo Точность: %percentage%%%
if %percentage% geq 80 set level=Senior Reviewer
if %percentage% geq 50 if %percentage% lss 80 set level=Middle Reviewer
if %percentage% lss 50 set level=Junior Reviewer
echo Уровень ревьюера: %level%
>"result_ch2.txt" echo Уровень ревьюера: %level%
pause
