
set /p ProjectName=Enter Project Name:

mkdir %ProjectName%
cd %ProjectName%

:: 创建sketch.js文件
(
    echo.
) > sketch.js

cd ..
set "sketchPath=sketch.js"
set "sketchDestPath=%ProjectName%/sketch.js"

copy "%sketchPath%" "%sketchDestPath%"

cd %ProjectName%

setlocal
:: 设置 HTML 文件的路径和名称
set "filePath=index.html"
:: 创建或覆盖 HTML 文件
(
    echo ^<!DOCTYPE html^>
    echo ^<html lang="en"^>
    echo ^<head^>
    echo     ^<script src="p5.js"^>^</script^>
    echo     ^<script src="./addons/p5.sound.js"^>^</script^>
    echo     ^<meta charset="UTF-8" /^>
    echo     ^<link rel="icon" type="image/svg+xml" href="favicon.svg" /^>
    echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0" /^>
    echo     ^<title^>%ProjectName%^</title^>
    echo ^</head^>

    echo ^<body^>
    echo     ^<main^>
    echo         ^</main^>
    echo     ^<script src="sketch.js"^>^</script^>
    echo ^</body^>
    echo ^</html^>
) > "%filePath%"

echo HTML File Created: %filePath%
endlocal

:: 复制文件 和 文件夹
mkdir addons

cd ..
set "p5jsPath=p5.js"
set "p5jsDestPath=%ProjectName%/p5.js"

:: 创建 p5.js 文件
(
    echo.
) > "%p5jsDestPath%"

copy "%p5jsPath%" "%p5jsDestPath%"

cd addons
set "p5SoundPath=p5.sound.js"
set "p5SoundDestPath=../%ProjectName%/addons/p5.sound.js"
:: 创建 p5.sound.js 文件
(
    echo.
) > "%p5SoundDestPath%"

copy "%p5SoundPath%" "%p5SoundDestPath%"

cd ..
cd %ProjectName%