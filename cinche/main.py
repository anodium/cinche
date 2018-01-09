#!/usr/bin/env python
# -*- coding: utf-8 -*-

import cocos

from hello import HelloWorld

if __name__ == "__main__":
    cocos.director.director.init(caption='Cinche',
                                 height=64, width=64, autoscale=True)

    cocos.director.director.get_virtual_coordinates

    hello_layer = HelloWorld()

    # A scene that contains the layer hello_layer
    main_scene = cocos.scene.Scene(hello_layer)

    # And now, start the application, starting with main_scene
    cocos.director.director.run(main_scene)

    # or you could have written, without so many comments:
    #      director.run( cocos.scene.Scene( HelloWorld() ) )
