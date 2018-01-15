from cocos.actions import Blink
from cocos.actions import CallFunc
from cocos.actions import MoveBy
from cocos.actions import Repeat
from cocos.actions import sequence
from cocos.actions import ToggleVisibility
from cocos.audio.effect import Effect
from cocos.layer import Layer
from cocos.sprite import Sprite


class TitleLayer(Layer):

    is_event_handler = True

    logo = None
    prompt = None
    move = None
    blink = None
    confirm = None
    engine = None
    rev = None

    def __init__(self):
        super(TitleLayer, self).__init__()

        self.logo = Sprite('assets/images/logo.png')
        self.logo.position = -17, 49

        self.prompt = Sprite('assets/images/start.png')
        self.prompt.position = 0, -28
        self.prompt.visible = False

        self.move = sequence(MoveBy((47, 0), 1.5),
                             CallFunc(self.on_move_finish))
        self.blink = sequence(ToggleVisibility(), Repeat(Blink(1, 0.75)))
        self.confirm = Repeat(Blink(1, 0.25))

        self.engine = Effect('assets/sounds/engine_start_white.ogg')

        self.logo.add(self.prompt)
        self.add(self.logo)

        self.logo.do(self.move)

    def on_move_finish(self):
        self.prompt.do(self.blink)

    def on_key_release(self, key, modifiers):
        self.engine.play()
        self.do(self.engine.action)
        self.prompt.do(self.confirm)
