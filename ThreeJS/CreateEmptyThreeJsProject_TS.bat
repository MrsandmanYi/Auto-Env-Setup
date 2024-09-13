
set /p ProjectName=Enter Project Name:
set /p AuthorName=Enter Author Name:
::Create the project folder
mkdir %ProjectName%

cd %ProjectName%
::call tsc --init
::call npm init -y

::Create the tsconfig.json file
echo { > tsconfig.json
echo     "compilerOptions": { >> tsconfig.json
echo         "target": "es2016", >> tsconfig.json
echo         "module": "commonjs", >> tsconfig.json
echo         "outDir": "./dist", >> tsconfig.json
echo         "rootDir": "./src", >> tsconfig.json
echo         "strict": true, >> tsconfig.json
echo         "esModuleInterop": true, >> tsconfig.json
echo         "forceConsistentCasingInFileNames": true, >> tsconfig.json
echo         "skipLibCheck": true >> tsconfig.json
echo     } >> tsconfig.json
echo } >> tsconfig.json

::Create the package.json file
echo { > package.json
echo     "name": "%ProjectName%", >> package.json
echo     "version": "1.0.0", >> package.json
echo     "description": "", >> package.json
echo     "main": "main.js", >> package.json
echo     "scripts": { >> package.json
echo         "build": "tsc -b", >> package.json
echo         "start": "npx vite && start http://localhost:5173/", >> package.json
echo         "bs" : "tsc -b && npx vite && start http://localhost:5173/", >> package.json
echo         "test": "echo \"Error: no test specified\" && exit 1" >> package.json
echo     }, >> package.json
echo     "keywords": [], >> package.json
echo     "author": "%AuthorName%", >> package.json
echo     "license": "ISC" >> package.json
echo } >> package.json

@echo off
setlocal

:: 设置 HTML 文件的路径和名称
set "filePath=index.html"

:: 创建或覆盖 HTML 文件
(
    echo ^<!DOCTYPE html^>
    echo ^<html lang="en"^>
    echo ^<head^>
    echo     ^<meta charset="UTF-8" /^>
    echo     ^<link rel="icon" type="image/svg+xml" href="favicon.svg" /^>
    echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0" /^>
    echo     ^<title^>%ProjectName%^</title^>
    echo    ^<style^>
    echo    body {
    echo        margin: 0;
    echo        overflow: hidden;
    echo    }

    echo    #appElement {
    echo        width: 100vw;
    echo        height: 100vh;
    echo    }
    echo    ^</style^>
    echo ^</head^>

    echo ^<body^>
    echo    ^<div id="appElement"^>^</div^>
    echo    ^<script type="module" src="/src/main.ts"^>^</script^>
    echo ^</body^>

    echo ^</html^>
) > "%filePath%"

echo HTML File Created: %filePath%
endlocal


::Create the src & dist folder
mkdir src
mkdir dist

@echo off
setlocal
set "mainFilePath=src/main.ts"
(
    echo.
)> "%mainFilePath%"
echo Main File Created: %mainFilePath%
endlocal

cd ..
@echo off
setlocal
set "mainSourceFile=main_template.ts"
set "mainDestinationFile=%ProjectName%/src/main.ts"

copy "%mainSourceFile%" "%mainDestinationFile%"
:: 检查复制是否成功
if %errorlevel% equ 0 (
    echo copy main file success: %destinationFile%
) else (
    echo copy main file failed: %destinationFile%
)
endlocal

cd %ProjectName%

call npm install --save three
call npm install @types/three --save-dev
call npm install --save-dev vite

call npm run build
call npm run start 

