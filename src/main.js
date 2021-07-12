const {app, BrowserWindow} = require('electron');
let mainWindow;

function createWindow() {
  mainWindow = new BrowserWindow({
    webPreferences: {
      nodeIntegration: true,
    },
    width: 1280, height: 720,
    'icon': __dirname + '/favicon.png',
  });
  mainWindow.loadURL('https://apps.moons14.com/');

  mainWindow.on('closed', () => {
    mainWindow = null;
  });
}

app.on('ready', createWindow);

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});app.on('activate', () => {
  if (mainWindow === null) {
    createWindow();
  }
});