#!/usr/bin/env python
# -*- coding: utf-8 -*-

from cinche.title import TitleLayer
from cocos.director import director
from cocos.scene import Scene

if __name__ == "__main__":
    director.init(caption='Cinche', height=64, width=64, autoscale=True)
    # TODO: This expects a pyglet.image.AbstractImage
    director.window.set_icon('assets/images/icon.png')
    # TODO: Blurry as hell, but works
    director.window.set_size(512, 512)

    title_layer = TitleLayer()

    main_scene = Scene(title_layer)

    director.run(main_scene)
