from cocos.actions import MoveBy
from cocos.layer import Layer
from cocos.scene import Scene
from cocos.sprite import Sprite


class GameScene(Scene):

    def __init__(self, mode_layer):
        super(Scene, self).__init__()


class GameLayer(Layer):

    players = ()

    def __init__(self):
        super(Layer, self).__init__()


class AIGameLayer(GameLayer):

    def __init__(self):
        super(GameLayer, self).__init__()


class V2GameLayer(GameLayer):

    def __init__(self):
        super(GameLayer, self).__init__()
