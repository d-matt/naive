References
==========

* original idea and icons : http://somerandomdude.com/work/iconic/
* inkscape tutorial : http://cleversomeday.wordpress.com/2010/02/09/inkscape-dings/

Generate the fonts
==================

dependency : python-fontforge

* Place the new svg glyph in the vector dir
* Modify the dingbats dictionnary in make_font.py
* Execute the script make_font.py

Styles
------

* add a class with the same name as the glyph name in css/style.less

How to add a new icon to the font (inkscape way) 
================================================

In inkscape
-----------
* open the svg font with inkscape
* display the font dialog editor (text/font editor)
* import the icon 
* maximize it (max dimention 1000px) 
* center it on the page
* convert objects to path
* path/union
* change the glyph name to the name of the icon
* remove the icon from the page

Generate the other formats
--------------------------

* goto http://onlinefontconverter.com for example
* retrieve eot, otf, ttf and woff

http://www.fontconverter.org/

