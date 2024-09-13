
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
    echo     ^<title^>%ProjectName%^</title^>
    echo ^</head^>
    echo ^<body^>
    echo    ^<script type="module" src="/dist/main.js"^>^</script^>
    echo ^</body^>
    echo ^</html^>
) > "%filePath%"

echo HTML 文件已创建：%filePath%
endlocal


::Create the src & dist folder
mkdir src
mkdir dist

::Create the main.ts file
cd src
echo. > main.ts
echo console.log("Hello World"); >> main.ts
cd ..

call npm install --save three
call npm install --save-dev vite

call npm run build
call npm run start 

