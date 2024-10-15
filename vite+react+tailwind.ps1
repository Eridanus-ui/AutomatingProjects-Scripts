# Function to execute commands and handle errors
function Invoke-CommandLine {
    param (
        [string]$Command
    )
    try {
        Invoke-Expression $Command
        if ($LASTEXITCODE -ne 0) {
            throw "Command failed with exit code $LASTEXITCODE"
        }
    }
    catch {
        Write-Host "Error executing command: $Command" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
        exit 1
    }
}

# Prompt for project name
$projectName = Read-Host -Prompt "Enter the project name"

# Check if folder exists
if (Test-Path $projectName) {
    Write-Host "A folder with the name '$projectName' already exists." -ForegroundColor Red
    exit 1
}

# Step 1: Create the project folder
New-Item -ItemType Directory -Path $projectName | Out-Null
Set-Location $projectName

# Step 2: Initialize Vite project
Write-Host "Initializing Vite project..." -ForegroundColor Cyan
Invoke-CommandLine "npm init vite@latest . -- --template react"

# Step 3: Install TailwindCSS and other dependencies
Write-Host "Installing TailwindCSS and PostCSS dependencies..." -ForegroundColor Cyan
Invoke-CommandLine "npm install -D tailwindcss@latest postcss@latest autoprefixer@latest"

# Step 4: Initialize TailwindCSS config
Write-Host "Initializing TailwindCSS configuration..." -ForegroundColor Cyan
Invoke-CommandLine "npx tailwindcss init -p"

# Step 5: Configure tailwind.config.js
Write-Host "Configuring tailwind.config.js..." -ForegroundColor Cyan
$tailwindConfig = @"
/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {},
  },
  plugins: [],
}
"@
Set-Content -Path "tailwind.config.js" -Value $tailwindConfig

# Step 6: Setup TailwindCSS in the CSS file
Write-Host "Setting up TailwindCSS directives in src/index.css..." -ForegroundColor Cyan
$cssContent = @"
@tailwind base;
@tailwind components;
@tailwind utilities;
"@
Set-Content -Path "src\index.css" -Value $cssContent

# Step 7: Update main React component to use Tailwind classes
Write-Host "Updating App.jsx with Tailwind classes..." -ForegroundColor Cyan
$appJsxContent = @"
import React from 'react'

function App() {
  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-100">
      <h1 className="text-4xl font-bold text-blue-600">Hello Vite + React + Tailwind!</h1>
    </div>
  )
}

export default App
"@
Set-Content -Path "src\App.jsx" -Value $appJsxContent

# Step 8: Install project dependencies
Write-Host "Installing project dependencies..." -ForegroundColor Cyan
Invoke-CommandLine "npm install"

# Step 9: Open the project folder in Visual Studio Code
Write-Host "Opening the project in Visual Studio Code..." -ForegroundColor Cyan
Invoke-CommandLine "code ."


Write-Host "Vite project with TailwindCSS setup is complete!" -ForegroundColor Green
Write-Host "You can now run 'npm run dev' to start the development server." -ForegroundColor Green

# Keep the console window open
Read-Host -Prompt "Press Enter to exit"
