require("source-map-support/source-map-support.js").install(), module.exports = function(e) {
    var t = {};

    function __webpack_require__(r) {
        if (t[r]) return t[r].exports;
        var n = t[r] = {
            i: r,
            l: !1,
            exports: {}
        };
        console.log(n);
        return e[r].call(n.exports, n, n.exports, __webpack_require__), n.l = !0, n.exports
    }
    return __webpack_require__.m = e, __webpack_require__.c = t, __webpack_require__.d = function(e, t, r) {
        __webpack_require__.o(e, t) || Object.defineProperty(e, t, {
            enumerable: !0,
            get: r
        })
    }, __webpack_require__.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, __webpack_require__.t = function(e, t) {
        if (1 & t && (e = __webpack_require__(e)), 8 & t) return e;
        if (4 & t && "object" == typeof e && e && e.__esModule) return e;
        var r = Object.create(null);
        if (__webpack_require__.r(r), Object.defineProperty(r, "default", {
                enumerable: !0,
                value: e
            }), 2 & t && "string" != typeof e)
            for (var n in e) __webpack_require__.d(r, n, function(t) {
                return e[t]
            }.bind(null, n));
        return r
    }, __webpack_require__.n = function(e) {
        var t = e && e.__esModule ? function getDefault() {
            return e.default
        } : function getModuleExports() {
            return e
        };
        return __webpack_require__.d(t, "a", t), t
    }, __webpack_require__.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, __webpack_require__.p = "", __webpack_require__(__webpack_require__.s = 7)
}([function(e, t) {
    e.exports = require("electron")
}, function(e, t) {
    e.exports = require("electron-log")
}, function(e, t) {
    e.exports = require("electron-updater")
}, function(e, t) {
    e.exports = require("path")
}, function(e, t) {
    e.exports = require("electron-progressbar")
}, function(e, t) {
    e.exports = require("os")
}, function(e, t) {
    e.exports = require("url")
}, function(e, t, r) {
    e.exports = r(8)
}, function(e, t, r) {
    "use strict";
    r.r(t);
    var n = r(0),
        o = r(3),
        a = r(5),
        i = r(1),
        u = r.n(i),
        l = r(6);
    if (u.a.transports.file.file = Object(o.join)(Object(a.homedir)(), ".lunarclient", "logs", "launcher", u.a.transports.file.fileName), "darwin" === process.platform) {
        const e = n.Menu.buildFromTemplate([{
            label: "Lunar Client",
            submenu: [{
                role: "about",
                label: "About Lunar Client"
            }, {
                type: "separator"
            }, {
                role: "hide",
                label: "Hide Lunar Client"
            }, {
                role: "unhide"
            }, {
                type: "separator"
            }, {
                role: "quit",
                label: "Quit Lunar Client"
            }]
        }]);
        n.Menu.setApplicationMenu(e)
    }
    console.log(n);
    console.log("n is here ^");
    console.log("app is here v");
    console.log(n.app);
    n.app.whenReady().then(() => {
        r(9);
        const e = new n.BrowserWindow({
            width: 1300,
            height: 800,
            frame: !1,
            transparent: !0,
            resizable: !1,
            fullscreenable: !1,
            titleBarStyle: "customButtonsOnHover",
            webPreferences: {
                nodeIntegration: true,
                enableRemoteModule: !0,
                contextIsolation: !1
            }
        });
        e.on("close", () => e.removeAllListeners()), e.webContents.on("devtools-opened", () => e.webContents.closeDevTools()), e.loadURL(Object(l.format)({
            pathname: Object(o.join)(__dirname, "index.html"),
            protocol: "file",
            slashes: !0
        }))
    }), n.app.on("window-all-closed", () => n.app.quit())
}, function(e, t, r) {
    "use strict";
    r.r(t);
    var n = r(2),
        o = r(0),
        a = r(1),
        i = r.n(a),
        u = r(4),
        l = r.n(u);
    let p;
    n.autoUpdater.logger = i.a.scope("autoUpdater"), n.autoUpdater.requestHeaders = {
        "User-Agent": "Lunar Client Launcher v" + o.app.getVersion()
    }, n.autoUpdater.checkForUpdates();
    let s = {
        text: {
            color: "#FFFFFF"
        },
        detail: {
            color: "#FFFFFF"
        },
        body: {
            background: "#1C1A1B"
        }
    };
    n.autoUpdater.on("update-available", e => {
        try {
            p = new l.a({
                title: "Launcher Update",
                text: "Downloading launcher update v" + e.version,
                indeterminate: !1,
                value: 0,
                detail: "Starting update...",
                style: s,
                browserWindow: {
                    alwaysOnTop: !0,
                    webPreferences: {
                        nodeIntegration: !0
                    }
                }
            })
        } catch (e) {
            i.a.info(e)
        }
    }), n.autoUpdater.signals.progress(e => {
        try {
            let t = Math.round(e.percent);
            p.value = t, p.detail = t + "% downloaded (" + e.bytesPerSecond + " bytes/sec)"
        } catch (e) {
            i.a.info(e)
        }
    }), n.autoUpdater.on("update-downloaded", () => {
        try {
            p.setCompleted();
            let e = new l.a({
                title: "Launcher Update",
                text: "Waiting to install...",
                indeterminate: !0,
                detail: "Waiting to install...",
                style: s,
                browserWindow: {
                    alwaysOnTop: !0,
                    webPreferences: {
                        nodeIntegration: !0
                    }
                }
            });
            setTimeout(() => e.setCompleted(), 5e3)
        } catch (e) {
            i.a.info(e)
        }
        setTimeout(() => n.autoUpdater.quitAndInstall(!1, !0), 5e3)
    })
}]);
//# sourceMappingURL=main.js.map