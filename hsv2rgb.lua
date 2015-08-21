-- hsv2rgb.lua - transformes a color given in hsv to rgb values
-- Copyright (C) 2015 Max Andre (http://telegnom.org)
-- derived from work by Ulrich Radig
-- http://www.ulrichradig.de/home/index.php/projekte/hsv-to-rgb-led
--
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

function hsv2rgb(h,s,v)

    -- calculates the position in the chromatic circle
    -- 0 - 359° (hue)
    if h < 61 then
        r = 255
        b = 0
        g = (425 * h) / 100
    elseif h >= 61 and h < 121 then
        r = 255 - ((425 * (h - 60)) / 100)
        g = 255
        b = 0
    elseif h >= 121 and h < 181 then
        r = 0
        g = 255
        b = (425 * (h-120)) / 100
    elseif h >= 181 and h < 241 then
        r = 0
        g = 255 - ((425 * (h-180))/100)
        b = 255
    elseif h >= 241 and h < 301 then
        r = (425 * (h-240))/100
        g = 0
        b = 255
    elseif h >= 241 and h < 360 then
        r = 255
        g = 0
        b = 255 - ((425 * (h-300))/100);
    end

    -- calculates the saturation
    -- a value in the range 0-100 (percent) is expected
    s = 100 - s
    diff = ((255 - r) * s) / 100
    r = r + diff
    diff = ((255 - g) * s) / 100
    g = g + diff
    diff = ((255 - b) * s) / 100
    b = b + diff

    -- calculates the black value
    -- a value in the range 0-100 (percent) is expected
    r = (r * v) / 100
    g = (g * v) / 100
    b = (b * v) / 100
    color = {r = math.floor(r), g = math.floor(g), b = math.floor(b)}
    return(color)
end
