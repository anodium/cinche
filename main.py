#!/usr/bin/env python
# -*- coding: utf-8 -*-

from cinche.title import TitleLayer

from cocos.director import director
from cocos.scene import Scene
from pyglet.gl import glEnable, glTexParameteri
from pyglet.gl import GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST
from pyglet.image import load

if __name__ == "__main__":
    director.init(caption='Cinche', height=64, width=64, autoscale=True,
                  audio_backend='sdl')
    director.window.set_icon(load('assets/images/icon.png'))
    director.window.set_size(512, 512)

    title_scene = Scene(TitleLayer())

    glEnable(GL_TEXTURE_2D)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST)

    director.run(title_scene)
