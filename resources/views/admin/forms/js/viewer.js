$.extend({
    createUploadIframe: function(n, t) {
        var r = "jUploadFrame" + n,
            i = '<iframe id="' + r + '" name="' + r + '" style="position:absolute; top:-9999px; left:-9999px"';
        return window.ActiveXObject && (typeof t == "boolean" ? i += ' src="javascript:false"' : typeof t == "string" && (i += ' src="' + t + '"')), i += " />", jQuery(i).appendTo(document.body), jQuery("#" + r).get(0)
    },
    createUploadForm: function(n, t) {
        var u = "jUploadForm" + n,
            e = "jUploadFile" + n,
            i = jQuery('<form  action="" method="POST" name="' + u + '" id="' + u + '" enctype="multipart/form-data"></form>'),
            r = jQuery("#" + t),
            f = jQuery(r).clone();
        return jQuery(r).attr("id", e), jQuery(r).before(f), jQuery(r).appendTo(i), jQuery(i).css("position", "absolute"), jQuery(i).css("top", "-1200px"), jQuery(i).css("left", "-1200px"), jQuery(i).appendTo("body"), i
    },
    ajaxFileUpload: function(n) {
        var u, t, f, i;
        n = jQuery.extend({}, jQuery.ajaxSettings, n);
        var r = +new Date,
            i = jQuery.createUploadForm(r, n.fileElementId),
            h = jQuery.createUploadIframe(r, n.secureuri),
            e = "jUploadFrame" + r,
            o = "jUploadForm" + r;
        n.global && !jQuery.active++ && jQuery.event.trigger("ajaxStart"), u = !1, t = {}, n.global && jQuery.event.trigger("ajaxSend", [t, n]), f = function(r) {
            var f = document.getElementById(e),
                o, s;
            try {
                f.contentWindow ? (t.responseText = f.contentWindow.document.body ? f.contentWindow.document.body.innerHTML : null, t.responseXML = f.contentWindow.document.XMLDocument ? f.contentWindow.document.XMLDocument : f.contentWindow.document) : f.contentDocument && (t.responseText = f.contentDocument.document.body ? f.contentDocument.document.body.innerHTML : null, t.responseXML = f.contentDocument.document.XMLDocument ? f.contentDocument.document.XMLDocument : f.contentDocument.document)
            } catch (h) {
                jQuery.handleError(n, t, null, h)
            }
            if (t || r == "timeout") {
                u = !0;
                try {
                  // console.log('pepeppee');
                    o = r != "timeout" ? "success" : "error", o != "error" ? (s = jQuery.uploadHttpData(t, n.dataType), n.success && n.success(s, o), n.global && jQuery.event.trigger("ajaxSuccess", [t, n])) : jQuery.handleError(n, t, o)
                } catch (h) {
                    o = "error", jQuery.handleError(n, t, o, h)
                }
                n.global && jQuery.event.trigger("ajaxComplete", [t, n]), n.global && !--jQuery.active && jQuery.event.trigger("ajaxStop"), n.complete && n.complete(t, o), jQuery(f).unbind(), setTimeout(function() {
                    try {
                        jQuery(f).remove(), jQuery(i).remove()
                    } catch (r) {
                        jQuery.handleError(n, t, null, r)
                    }
                }, 100), t = null
            }
        }, n.timeout > 0 && setTimeout(function() {
            u || f("timeout")
        }, n.timeout);
        try {
            i = jQuery("#" + o), jQuery(i).attr("action", n.url), jQuery(i).attr("method", "POST"), jQuery(i).attr("target", e), i.encoding ? jQuery(i).attr("encoding", "multipart/form-data") : jQuery(i).attr("enctype", "multipart/form-data"), jQuery(i).submit()
        } catch (s) {
            jQuery.handleError(n, t, null, s)
        }
        return jQuery("#" + e).load(f), {
            abort: function() {}
        }
    },
    uploadHttpData: function(r, type) {
        var data = !type;
        return data = type == "xml" || data ? r.responseXML : r.responseText, type == "script" && jQuery.globalEval(data), type == "json" && eval("data = " + data.substring(data.indexOf("{"), data.lastIndexOf("}") + 1)), type == "html" && jQuery("<div>").html(data).evalScripts(), data
    }
});
var cad = {
    service: "/api/draw",
    debug: !1,
    trace: "",
    canvas: null,
    ctx: null,
    img: null,
    buff: null,
    box: {
        x: 0,
        y: 0,
        h: 0,
        w: 0,
        saved: null
    },
    pbox: {
        x: 0,
        y: 0,
        h: 0,
        w: 0,
        saved: null
    },
    state: {
        move: !1,
        touchmove: !1,
        first: null,
        shift: {
            coef: 1,
            zoom: {
                x: 0,
                y: 0
            },
            mouse: {
                x: 0,
                y: 0
            },
            touch: {
                x: 0,
                y: 0
            }
        },
        layout: 0
    },
    currentID: 0,
    math: {
        calcDist: function(n, t, i, r) {
            var u = function(n, t, i, r) {
                return Math.sqrt(Math.pow(i - n, 2) + Math.pow(r - t, 2))
            };
            return arguments.length < 4 ? u(n.pageX, n.pageY, t.pageX, t.pageY) : u(n, t, i, r)
        }
    },
    settings: {
        noscroll: !1,
        nomsg: !1,
        black: !1,
        init: function() {
            cad.currentID && cad.get("options/" + cad.currentID, undefined, function(n) {
                n && n.length && (cad.settings.black = n[0].value)
            }, null, !1)
        }
    },
    init: function(n) {
        var r, f, e;
        this.ctx = n.getContext("2d"), this.canvas = n, this.canvas.init = function() {
            cad.canvas.height = cad.canvas.clientHeight, cad.canvas.width = cad.canvas.clientWidth, $(cad.canvas).css.height = cad.canvas.clientHeight, $(cad.canvas).css.width = cad.canvas.clientWidth
        }, this.box.init = function() {
            var n = {};
            n.id = cad.currentID, n.l = cad.state.layout, cad.currentID && cad.get("layout?" + cad.makeParams(n), undefined, function() {
                cad.get("extents/" + cad.currentID, undefined, function(n) {
                    cad.extents = n, cad.box.x = n.x, cad.box.y = n.y, cad.box.h = n.h, cad.box.w = n.w, n.x == 0 && n.y == 0 && cad.box.fit()
                }, null, !1)
            }, null, !1)
        }, this.box.zoom = function(n) {
            this.h *= n, this.w *= n
        }, this.box.fit = function() {
            var t = this.w / this.h,
                i = cad.canvas.width / cad.canvas.height,
                n = 1;
            i > t ? n = cad.canvas.height / this.h : i < t && (n = cad.canvas.width / this.w), cad.box.zoom(n)
        }, this.box.reset = function() {
            this.x = 0, this.y = 0, this.fit()
        }, this.box.save = function() {
            this.saved = {
                x: this.x,
                y: this.y,
                w: this.w,
                h: this.h
            }
        }, this.pbox.save = this.box.save, this.box.assign = function(n) {
            this.x = n.x, this.y = n.y, this.w = n.w, this.h = n.h
        }, this.box.sync = function() {
            this.syncm(), cad.box.x += cad.pbox.x, cad.box.y += cad.pbox.y, cad.pbox.reset()
        }, this.box.syncm = function() {
            cad.box.x += cad.state.shift.mouse.x, cad.box.y += cad.state.shift.mouse.y, cad.state.shift.reset()
        }, this.pbox.reset = function() {
            this.x = 0, this.y = 0, this.w = cad.img.width, this.h = cad.img.height
        }, this.pbox.zoom = this.box.zoom, this.state.shift.reset = function() {
            this.touch.x = 0, this.touch.y = 0, this.mouse.x = 0, this.mouse.y = 0, this.zoom.x = 0, this.zoom.y = 0, this.coef = 1
        }, this.state.shift.x = function() {
            return this.zoom.x + this.mouse.x - this.touch.x
        }, this.state.shift.y = function() {
            return this.zoom.y + this.mouse.y - this.touch.y
        }, this.state.x = function() {
            return this.first.x - this.shift.x()
        }, this.state.y = function() {
            return this.first.y - this.shift.y()
        };
        var h = function(n) {
                var t = {
                    x: 0,
                    y: 0,
                    touch: null
                };
                return n.type.indexOf("touch") > -1 ? n.changedTouches.length > 0 && (t.x = n.changedTouches[0].pageX, t.y = n.changedTouches[0].pageY, t.touch = n.touches) : (t.x = n.pageX, t.y = n.pageY), t
            },
            t = !1,
            c = function(n, i) {
                t ? (cad.math.calcDist(t, n) < 50 && (t = !1, i && i()), t = !1) : (t = n, setTimeout(function() {
                    t = !1
                }, 600))
            },
            o = function(n) {
                n.preventDefault(), n.changedTouches && c(n.changedTouches[0], function() {
                    f(cad.state.first.x, cad.state.first.y, 2), cad.draw(cad.img, cad.state.shift.x(), cad.state.shift.y()), cad.refreshBuff()
                }), cad.state.touchmove = n.touches && n.touches.length > 1 ? !0 : !1, i = null, cad.state.first = h(n), cad.state.touchmove ? (cad.state.move = !1, cad.box.sync(), cad.refresh()) : cad.state.move = !0
            };
        n.addEventListener("mousedown", o), n.addEventListener("touchstart", o), r = function(n) {
            n.preventDefault(), i = null, cad.state.touchmove ? (cad.state.touchmove = n.touches && n.touches.length > 1 ? !0 : !1, cad.box.sync(), cad.refresh()) : cad.state.move && (cad.state.move = !1, cad.box.sync(), cad.refresh())
        }, n.addEventListener("mouseup", r), n.addEventListener("touchend", r), n.addEventListener("mouseout", r);
        var u = null,
            i = null,
            s = function(n) {
                var r, e, t, o, s, f;
                n.preventDefault(), n.touches && n.touches.length == 2 ? (r = {
                    x: (n.touches[0].pageX + n.touches[1].pageX) / 2,
                    y: (n.touches[0].pageY + n.touches[1].pageY) / 2
                }, e = cad.math.calcDist(n.touches[0], n.touches[1]), i ? (t = e / i, cad.pbox.w = cad.img.width * t, cad.pbox.h = cad.img.height * t, cad.pbox.x = r.x - u.x, cad.pbox.y = r.y - u.y, o = r.x / cad.img.width, s = r.y / cad.img.height, cad.pbox.x += -(cad.pbox.w - cad.img.width) * o, cad.pbox.y += -(cad.pbox.h - cad.img.height) * s, cad.draw(cad.img), cad.box.w = cad.box.saved.w * t, cad.box.h = cad.box.saved.h * t, cad.box.x = cad.box.saved.x * t, cad.box.y = cad.box.saved.y * t) : (i = e, u = r, cad.box.save())) : cad.state.move && (f = h(n), cad.pbox.x = f.x - cad.state.x(), cad.pbox.y = f.y - cad.state.y(), cad.draw(cad.img))
            };
        n.addEventListener("mousemove", s), n.addEventListener("touchmove", s), f = function(n, t, i) {
            cad.state.shift.coef *= i;
            var r = function(n, t) {
                n.h *= t, n.w *= t
            };
            cad.state.shift.zoom.x = cad.box.x * (1 - cad.state.shift.coef), cad.state.shift.zoom.y = cad.box.y * (1 - cad.state.shift.coef), cad.state.shift.mouse.x = (n - cad.box.x) / cad.box.w * cad.box.w * (1 - cad.state.shift.coef), cad.state.shift.mouse.y = (t - cad.box.y) / cad.box.h * cad.box.h * (1 - cad.state.shift.coef), r(cad.box, i), r(cad.img, i)
        }, e = function(n) {
            var i;
            if (!cad.settings.noscroll) {
                n.preventDefault(), n = n ? n : window.event, i = n.detail ? n.detail : n.wheelDelta, window.jQuery && ($.browser.opera || $.browser.mozilla) && (i *= -1);
                var r = n.offsetX ? n.offsetX : n.layerX,
                    u = n.offsetY ? n.offsetY : n.layerY,
                    t = n.shiftKey ? 1.5 : 1.25;
                i < 0 && (t = 1 / t), f(r, u, t), cad.draw(cad.img, cad.state.shift.x(), cad.state.shift.y()), cad.refreshBuff()
            }
        }, n.addEventListener("DOMMouseScroll", e), n.addEventListener("mousewheel", e), window.onresize = cad.resize, cad.canvas.init(), cad.box.init()
    },
    alert: function(n) {
        cad.buff = null, cad.img = null, cad.clear(), cad.ctx.fillStyle = "rgb(0,0,0)", cad.ctx.font = "32px Arial", cad.ctx.fillText(n, 16, 130)
    },
    clear: function() {
        cad.ctx.fillStyle = cad.settings.black ? "rgb(0,0,0)" : "rgb(255,255,255)", cad.ctx.fillRect(0, 0, cad.canvas.width, cad.canvas.height)
    },
    drawing: !1,
    draw: function(n, t, i, r, u, f) {
        cad.drawing = !0;
        try {
            cad.clear(), n && (f ? cad.ctx.drawImage(n, t, i, r * f, u * f) : u ? cad.ctx.drawImage(n, t, i, r, u) : i ? cad.ctx.drawImage(n, t, i, n.w, n.h) : cad.ctx.drawImage(n, cad.pbox.x, cad.pbox.y, cad.pbox.w, cad.pbox.h)), cad.debug && (cad.ctx.fillStyle = "rgb(0,0,255)", cad.ctx.font = "11px Arial", cad.ctx.fillText(cad.trace, 10, 120), cad.ctx.fillText(cad.canvas.width + ", " + cad.canvas.height, 10, 135))
        } finally {
            cad.drawing = !1
        }
    },
    drawText: function(n, t, i) {
        cad.ctx.fillStyle = "rgb(0,0,255)", cad.ctx.font = "11px Arial", cad.ctx.fillText(i, n, t)
    },
    refresh: function(n, t) {
        if ((!cad.currentID || !(cad.currentID.length < 9)) && cad.currentID) {
            t && this.box.init();
            var i = {};
            i.height = cad.canvas.height, i.width = cad.canvas.width, i.id = cad.currentID, i.x = cad.box.x + cad.state.shift.mouse.x, i.y = cad.box.y + cad.state.shift.mouse.y, i.w = cad.box.w, i.h = cad.box.h, i.l = cad.state.layout, i.rnd = Math.random(), cad.buff = new Image, cad.buff.box = {
                x: i.x,
                y: i.y,
                w: i.w,
                h: i.h
            }, cad.buff.onload = function(t) {
                try {
                    cad.img = cad.buff, cad.img.timeStamp = t.timeStamp, cad.img.h = cad.img.height, cad.img.w = cad.img.width, cad.pbox.reset()
                } finally {
                    cad.box.assign(cad.buff.box), cad.state.shift.reset(), typeof n == "function" ? n() && cad.draw(cad.img, 0, 0) : cad.draw(cad.img, 0, 0), $.browser.msie && $.browser.version < 10 && setTimeout(function() {
                        cad.draw(cad.img, 0, 0)
                    }, 100)
                }
            }, cad.buff.onerror = function() {
                cad.get("isalive/" + cad.currentID, undefined, function(n) {
                    n && n.ok && !n.alive && (cad.settings.nomsg ? (document.location.hash = "", document.location.reload()) : (cad.alert(n.text), setTimeout(function() {
                        document.location.hash = "", document.location.reload()
                    }, 3e3)))
                }, function() {
                    cad.alert("Service is down")
                }, !1)
            }, cad.buff.src = cad.service + "/image?" + cad.makeParams(i)
        }
    },
    timer: null,
    refreshBuff: function() {
        cad.timer && clearTimeout(cad.timer), cad.timer = setTimeout(cad.refresh, 100)
    },
    resize: function(n) {
        (n === undefined || n.target == window) && (cad.canvas.init(n), cad.refreshBuff())
    },
    unload: function() {
        cad.get("unload/" + cad.currentID)
    },
    get: function(n, t, i, r, u) {
        cad.ajax("GET", n, t, i, r, u)
    },
    post: function(n, t, i, r, u) {
        cad.ajax("POST", n, t, i, r, u)
    },
    ajax: function(n, t, i, r, u, f) {
        $.ajax({
            type: n,
            url: cad.service + "/" + t,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: jQuery.parseJSON(i),
            async: f,
            timeout: 5e3,
            success: r,
            error: u
        })
    },
    upload: function(n, t, i, r) {
        if (n)
            if (t(), typeof window.FormData == "undefined") cad.uploadEx(n.name, n.value, i, r);
            else {
                var u = new FormData;
                u.append("file", n.files[0]), u.append("test", "value"), $.ajax({
                    type: "POST",
                    url: cad.service + "/upload?name=" + encodeURIComponent(n.value),
                    enctype: "multipart/form-data",
                    dataType: "json",
                    data: u,
                    cache: !1,
                    contentType: !1,
                    processData: !1,
                    success: i,
                    error: r
                })
            }
    },
    uploadEx: function(n, t, i, r) {
        return $.ajaxFileUpload({
            url: cad.service + "/upload?name=" + t,
            secureuri: !1,
            fileElementId: n,
            dataType: "json",
            success: i,
            error: r
        }), !1
    },
    makeParams: function(n) {
        var i = [],
            t;
        for (t in n) i.push(encodeURIComponent(t) + "=" + encodeURIComponent(n[t]));
        return i.join("&")
    }
};
cad && (cad.face = {
    createCheckBox: function(n, t, i, r) {
        var u = document.createElement("input"),
            e, f;
        return u.type = "checkbox", u.checked = i, u.value = r, e = document.createElement("label"), e.htmlFor = "id", e.appendChild(document.createTextNode(t)), f = document.createElement("div"), f.appendChild(u), f.appendChild(e), n.appendChild(f), u
    },
    updateCBS: function(n) {
        var t = document.getElementById(n);
        t !== null && cad.get("options/" + cad.currentID, undefined, function(n) {
            var i, r;
            for (t.innerHTML = "", i = 0; i < n.length; i++) r = cad.face.createCheckBox(t, n[i].name, n[i].value, i), r.id = "optionCheckBox" + i;
            t.addEventListener("change", function(n) {
                var t = {};
                t.o = n.target.value, t.e = n.target.checked, t.id = cad.currentID, cad.get("options?" + cad.makeParams(t), undefined, function(n) {
                    n && n.index === 0 && (cad.settings.black = n.value), cad.refresh()
                }, null, !0)
            })
        }, null, !0)
    },
    updateCBL: function(n) {
        var t = document.getElementById(n);
        t !== null && cad.get("layers/" + cad.currentID, undefined, function(n) {
            t.innerHTML = "";
            for (var i = 0; i < n.length; i++) cad.face.createCheckBox(t, n[i].name, n[i].value, n[i].handle);
            t.addEventListener("change", function(n) {
                var t = {};
                t.l = n.target.value, t.v = n.target.checked, t.id = cad.currentID, cad.get("layer?" + cad.makeParams(t), undefined, function() {
                    cad.refresh()
                }, null, !0)
            })
        }, !0)
    },
    updateDDL: function(n) {
        var t = document.getElementById(n);
        t !== null && cad.get("layouts/" + cad.currentID, undefined, function(n) {
            for (var i = 0; i < n.length; i++) t.options[i] = new Option(n[i], i);
            t.options.length = n.length, t.addEventListener("change", function(n) {
                cad.state.layout = n.target.value, cad.box.init(), cad.refresh()
            })
        }, !0)
    },
    updateFDL: function(n, t) {
        var i = document.getElementById(n),
            r;
        i !== null && (r = $(i).css("display") == "none" ? i : i.parentElement, $(r).css("display", "none"), cad.get("sources/" + cad.currentID, undefined, function(n) {
            var f, u;
            if (n && n.files && n.files.length > 1) {
                for ($(r).css("display", "inline"), f = n.files, u = 0; u < f.length; u++) i.options[u] = new Option(f[u], f[u]);
                i.options.length = f.length, i.addEventListener("change", function(n) {
                    var i = {};
                    i.s = n.target.value, i.id = cad.currentID, cad.get("source?" + cad.makeParams(i), undefined, t, null, !0)
                })
            }
        }, !0))
    },
    updateVDL: function(n, t) {
        var r = document.getElementById(n),
            f, i, u;
        if (r !== null) {
            for (f = 0, i = 0; i < t.length; i++) t[i] == "-" ? (u = new Option("————————", i - f++), $(u).attr("role", "separator"), u.disabled = !0, r.options[i] = u) : r.options[i] = new Option(t[i], i - f);
            r.options.length = t.length, r.addEventListener("change", function(n) {
                var t = {};
                t.v = n.target.value, t.id = cad.currentID, cad.get("view?" + cad.makeParams(t), undefined, function() {
                    cad.box.init(), cad.refresh()
                }, null, !0)
            })
        }
    },
    resetView: function() {
        cad.box.init(), cad.refresh()
    },
    zoom: function(n) {
        cad.box.zoom(n), cad.box.x += (cad.canvas.width / 2 - cad.box.x) / cad.box.w * cad.box.w * (1 - n), cad.box.y += (cad.canvas.height / 2 - cad.box.y) / cad.box.h * cad.box.h * (1 - n), cad.refresh()
    },
    zoomIn: function() {
        cad.face.zoom(1.25)
    },
    zoomOut: function() {
        cad.face.zoom(.8)
    },
    changeBackgroundColor: function() {
        var t = $("#optionCheckBox0")[0],
            n;
        t && (t.checked = !cad.settings.black), n = {}, n.o = 0, n.e = !cad.settings.black, n.id = cad.currentID, cad.get("options?" + cad.makeParams(n), undefined, function(n) {
            n && n.index === 0 && (t && (t.checked = n.value), cad.settings.black = n.value), cad.refresh()
        }, null, !0)
    }
})
