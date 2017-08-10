/**
 * @Author: Vincent Dupont <vincent>
 * @Date:   2017-08-04T11:52:12+02:00
 * @Email:  vidupont@gmail.com
 * @Filename: main.js
 * @Last modified by:   vincent
 * @Last modified time: 2017-08-10T11:53:28+02:00
 */

const path = require('path');

const { app, BrowserWindow } = electron;

// simple parameters initialization
const electronConfig = {
  KIOSK_TOUCH: process.env.KIOSK_TOUCH === '1' ? 1 : 0,
  KIOSK_TOUCH_SIMULATE: process.env.KIOSK_TOUCH_SIMULATE === '1' ? 1 : 0,
  KIOSK_FRAME: process.env.KIOSK_FRAME === '1' ? 1 : 0,
  KIOSK_KIOSK: process.env.KIOSK_KIOSK === '1' ? 1 : 0,
  KIOSK_NODE: process.env.KIOSK_NODE === '1' ? 1 : 0,
  KIOSK_X: parseInt(process.env.KIOSK_X || 0, 10),
  KIOSK_Y: parseInt(process.env.KIOSK_Y || 0, 10),
  KIOSK_WIDTH: parseInt(process.env.KIOSK_WIDTH || 1920, 10),
  KIOSK_HEIGHT: parseInt(process.env.KIOSK_HEIGHT || 1080, 10),
  KIOSK_TITLE: process.env.KIOSK_TITLE || 'RESIN.IO',
  KIOSK_CONSOLE: process.env.KIOSK_CONSOLE === '1' ? 1 : 0,
  KIOSK_URL: process.env.KIOSK_URL || `file:///${path.join(__dirname, 'data', 'index.html')}`,
  KIOSK_ZOOM: parseFloat(process.env.KIOSK_ZOOM || 1.0),
  KIOSK_OVERLAY_SCROLLBARS: process.env.KIOSK_CONSOLE === '1' ? 1 : 0,
};

// enable touch events if your device supports them
if (electronConfig.KIOSK_TOUCH) {
  app.commandLine.appendSwitch('--touch-devices');
}
// simulate touch events - might be useful for touchscreen with partial driver support
if (electronConfig.KIOSK_TOUCH_SIMULATE) {
  app.commandLine.appendSwitch('--simulate-touch-screen-with-mouse');
}

if (process.env.NODE_ENV === 'development') {
  console.log('Running in development mode');
  Object.assign(electronConfig, {
    KIOSK_HEIGHT: 600,
    KIOSK_WIDTH: 800,
    KIOSK_KIOSK: 0,
    KIOSK_CONSOLE: 1,
    KIOSK_FRAME: 1,
  });
}

/*
 we initialize our application display as a callback of the electronJS "ready" event
 */
app.on('ready', () => {
  // here we actually configure the behavour of electronJS
  const window = new BrowserWindow({
    x:electronConfig.KIOSK_X,
    y:electronConfig.KIOSK_Y,
    width: electronConfig.KIOSK_WIDTH,
    height: electronConfig.KIOSK_HEIGHT,
    frame: !!(electronConfig.KIOSK_FRAME),
    title: electronConfig.KIOSK_TITLE,
    kiosk: !!(electronConfig.KIOSK_KIOSK),
    webPreferences: {
      nodeIntegration: !!(electronConfig.KIOSK_NODE),
      zoomFactor: electronConfig.KIOSK_ZOOM,
      overlayScrollbars: !!(electronConfig.KIOSK_OVERLAY_SCROLLBARS),
    },
  });

  window.webContents.on('did-finish-load', () => {
    setTimeout(() => {
      window.show();
    }, 300);
  });

  // if the env-var is set to true,
  // a portion of the screen will be dedicated to the chrome-dev-tools
  if (electronConfig.KIOSK_CONSOLE) {
    window.openDevTools();
  }

  // the big red button, here we go
  window.loadURL(electronConfig.KIOSK_URL);
});
