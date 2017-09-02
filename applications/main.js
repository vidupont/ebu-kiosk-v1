/**
 * @Author: Vincent Dupont <vincent>
 * @Date:   2017-09-02T15:09:06+02:00
 * @Email:  vidupont@gmail.com
 * @Filename: main.js
 * @Last modified by:   vincent
 * @Last modified time: 2017-09-02T16:37:46+02:00
 */

/* This is the Main script for the Kiosk frontend */

require('require-rebuild')();
const electron = require('electron');
const path = require('path');

const { app, BrowserWindow } = electron;

// simple parameters initialization
const electronConfig = {
  EJS_FRONT_TOUCH: process.env.EJS_FRONT_TOUCH === '1' ? 1 : 0,
  EJS_FRONT_TOUCH_SIMULATE: process.env.EJS_FRONT_TOUCH_SIMULATE === '1' ? 1 : 0,
  EJS_FRONT_FRAME: process.env.EJS_FRONT_FRAME === '1' ? 1 : 0,
  EJS_FRONT_KIOSK: process.env.EJS_FRONT_KIOSK === '1' ? 1 : 0,
  EJS_FRONT_NODE: process.env.EJS_FRONT_NODE === '1' ? 1 : 0,
  EJS_FRONT_WIDTH: parseInt(process.env.EJS_FRONT_WIDTH || 800, 10),
  EJS_FRONT_HEIGHT: parseInt(process.env.EJS_FRONT_HEIGHT || 600, 10),
  EJS_FRONT_TITLE: process.env.EJS_FRONT_TITLE || 'RESIN.IO',
  EJS_FRONT_CONSOLE: process.env.EJS_FRONT_CONSOLE === '1' ? 1 : 0,
  KIOSK_URL: process.env.KIOSK_URL || `file:///${path.join(__dirname, 'build', 'index.html')}`,
  EJS_FRONT_ZOOM: parseFloat(process.env.EJS_FRONT_ZOOM || 1.0),
  EJS_FRONT_OVERLAY_SCROLLBARS: process.env.EJS_FRONT_CONSOLE === '1' ? 1 : 0,
};

// enable touch events if your device supports them
if (electronConfig.EJS_FRONT_TOUCH) {
  app.commandLine.appendSwitch('--touch-devices');
}
// simulate touch events - might be useful for touchscreen with partial driver support
if (electronConfig.EJS_FRONT_TOUCH_SIMULATE) {
  app.commandLine.appendSwitch('--simulate-touch-screen-with-mouse');
}

if (process.env.NODE_ENV === 'development') {
  console.log('Running in development mode');
  Object.assign(electronConfig, {
    EJS_FRONT_HEIGHT: 600,
    EJS_FRONT_WIDTH: 800,
    EJS_FRONT_KIOSK: 0,
    EJS_FRONT_CONSOLE: 1,
    EJS_FRONT_FRAME: 1,
  });
}

/*
 we initialize our application display as a callback of the electronJS "ready" event
 */
app.on('ready', () => {
  // here we actually configure the behavour of electronJS
  const window = new BrowserWindow({
    width: electronConfig.EJS_FRONT_WIDTH,
    height: electronConfig.EJS_FRONT_HEIGHT,
    frame: !!(electronConfig.EJS_FRONT_FRAME),
    title: electronConfig.EJS_FRONT_TITLE,
    kiosk: !!(electronConfig.EJS_FRONT_KIOSK),
    webPreferences: {
      nodeIntegration: !!(electronConfig.EJS_FRONT_NODE),
      zoomFactor: electronConfig.EJS_FRONT_ZOOM,
      overlayScrollbars: !!(electronConfig.EJS_FRONT_OVERLAY_SCROLLBARS),
    },
  });

  window.webContents.on('did-finish-load', () => {
    setTimeout(() => {
      window.show();
    }, 300);
  });

  // if the env-var is set to true,
  // a portion of the screen will be dedicated to the chrome-dev-tools
  if (electronConfig.EJS_FRONT_CONSOLE) {
    window.openDevTools();
  }

  // the big red button, here we go
  window.loadURL(electronConfig.KIOSK_URL);
});
