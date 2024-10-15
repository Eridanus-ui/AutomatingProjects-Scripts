# Vite + React + TailwindCSS Project Setup Script

This PowerShell script automates the setup of a new Vite project with React and TailwindCSS. It handles everything from creating the project directory to configuring TailwindCSS and installing all necessary dependencies.

## Prerequisites

Ensure you have the following software installed on your machine:

- **Node.js** (version 12 or higher)
- **npm** (Node Package Manager)
- **Visual Studio Code** (optional, to open the project automatically)

## How to Use the Script

### Step 1: Save the PowerShell Script

1. Copy the entire PowerShell script.
2. Open a text editor (e.g., **Notepad**).
3. Paste the copied script into the text editor.
4. Save the file with the name `vite+react+tailwind.ps1`.

   - In **Notepad**:
     - Click **File** > **Save As**.
     - Set "Save as type" to **All Files**.
     - Enter `vite+react+tailwind.ps1` as the filename.
     - Save it in your preferred location, for example, `C:\Users\<YourName>\Documents\`.

### Step 2: Set PowerShell to Open `.ps1` Files (One-Time Setup)

To run the script more conveniently, you can configure `.ps1` files to always open with PowerShell:

1. In **Windows Explorer**, navigate to the location where you saved the script (`vite+react+tailwind.ps1`).
2. Right-click on the `.ps1` file and select **Open with** > **Choose another app**.
3. In the popup window, scroll down and select **More apps**.
4. If PowerShell is not listed, click **Look for another app on this PC**.
5. Navigate to the following folder:
   ```plaintext
   C:\Windows\System32\WindowsPowerShell\v1.0\
   ```
6. Select `powershell.exe`, then check the box that says **Always use this app to open .ps1 files** and click **OK**.

> **Note**: You only need to do this setup once. After that, every `.ps1` file will automatically open with PowerShell, and you won’t have to repeat this process.

### Step 3: Run the Script

Once you have set PowerShell to always open `.ps1` files, you can run the script by simply double-clicking the `vite+react+tailwind.ps1` file in Windows Explorer.

You will be prompted to enter a project name. The script will then:

- Create the project folder.
- Initialize a Vite project using the React template.
- Install TailwindCSS and related dependencies.
- Configure TailwindCSS and update the `App.jsx` file.
- Install all project dependencies.
- Open the project in Visual Studio Code (if installed).

### Step 4: Start the Development Server

Once the setup completes, open a terminal (or use PowerShell), navigate to the project folder, and run the development server:

```bash
npm run dev
```

This will start the Vite development server, allowing you to view your project in the browser.

## Project Structure

After the setup, your project folder will have the following structure:

```plaintext
project-name/
│
├── index.html
├── package.json
├── postcss.config.js
├── tailwind.config.js
└── src/
    ├── App.jsx
    ├── index.css
    └── main.jsx
```

## License

This script is provided as-is without any warranty. Feel free to modify and adapt it as needed for your projects.
