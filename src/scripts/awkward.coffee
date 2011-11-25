# Awkward Family Photos
#
# awkward me - Display a recent awkward family photo at random
#

Apricot = require("apricot").Apricot;

module.exports = (robot) ->
  robot.hear /.*(awkward (me ?)).*/i, (msg) ->
    randomPhoto msg, (urls) ->
      msg.send msg.random urls

randomPhoto = (msg, cb) ->
  Apricot.open "http://awkwardfamilyphotos.com/", (err, html) ->
    html.find("a.img")
    photos = []
    html.each (o) ->
      photos.push o.children[0].src
    cb photos
