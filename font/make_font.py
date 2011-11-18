#!/usr/bin/env python
#encoding:utf-8
# based from the script Khaled Hosny : http://tex.stackexchange.com/questions/22487/create-a-symbol-font-from-svg-symbols

import fontforge
import os

#
dingbats = {
    u"b" : "pen_alt_fill.svg",
    u"c" : "comment_stroke.svg",
    u"e" : "eye.svg",
    u"f" : "magnifying_glass_alt.svg",
    u"n" : "bolt.svg",
    u"p" : "play.svg",
    u"q" : "pause.svg",
    u"r" : "rss.svg",
    u"s" : "stop.svg",
    u"v" : "check.svg",
    u"x" : "x.svg",
    u"+" : "plus.svg",
    u"-" : "minus.svg",
    u"‹" : "arrow_left.svg",  # ‹
    u"›" : "arrow_right.svg",  # ›
    u"»" : "last.svg",  # »
    u"«" : "first.svg", # «
    u"\u22C6" : "star.svg"   # ★
}

# create empty font
font = fontforge.font()

# set font names
font.fontname = "naive"
font.fullname = "Naive"
font.familyname = "Naive"

# import svgs
for uni, svg in dingbats.iteritems():
    # create a new glyph with the given unicode
    glyph = font.createChar(ord(uni))

    # import svg file into it
    glyph.importOutlines("vector/%s" % svg)

    # center the glyph verticaly
    xmin,ymin, xmax,ymax = glyph.boundingBox()
    max_dim = max(xmax-xmin, ymax-ymin)
    glyph.transform([1, 0, 0, 1, 0, ((ymax-ymin)-max_dim)/2])

    # set the glyph name 
    glyph.glyphname = ("%s" % os.path.splitext(svg)[0])

    # set glyph side bearings, can be any value or even 0
    glyph.left_side_bearing = glyph.right_side_bearing = 10

#Generate fonts
font.generate("naive.otf")
font.generate("naive.ttf")
font.generate("naive.svg")
font.generate("naive.woff")
font.generate("naive.eot")
