from cocos.layer import Layer


class GameLayer(Layer):

    def __init__(self, mode):
        super(Layer, self).__init__()


class AIGameLayer(GameLayer):

    def __init__(self, mode):
        super(GameLayer, self).__init__()


class V2GameLayer(GameLayer):

    def __init__(self, mode):
        super(GameLayer, self).__init__()
