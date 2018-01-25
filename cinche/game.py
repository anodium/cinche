from cocos.actions import MoveBy
from cocos.layer import Layer
from cocos.sprite import Sprite


class GameLayer(Layer):

    players = ()

    def __init__(self, mode):
        super(Layer, self).__init__()


class AIGameLayer(GameLayer):

    def __init__(self, mode):
        super(GameLayer, self).__init__()


class V2GameLayer(GameLayer):

    def __init__(self, mode):
        super(GameLayer, self).__init__()
