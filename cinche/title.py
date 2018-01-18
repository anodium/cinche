from cinche.menu import MenuLayer

from cocos.actions import Blink
from cocos.actions import CallFunc
from cocos.actions import MoveBy
from cocos.actions import Repeat
from cocos.actions import sequence
from cocos.actions import ToggleVisibility
from cocos.audio.actions import PlayUntilFinishedAction
from cocos.audio.effect import Effect
from cocos.director import director
from cocos.layer import Layer
from cocos.scene import Scene
from cocos.sprite import Sprite


class TitleLayer(Layer):

    is_event_handler = True

    # Sprites
    logo = None
    prompt = None

    # Actions
    blink = None
    confirm = None
    move = None
    play = None

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

        # TODO: Have transition happen after Effect is finished
        self.play = sequence(PlayUntilFinishedAction(
                               Effect('assets/sounds/engine_start_white.ogg')),
                             CallFunc(self.on_sound_done))

        self.logo.add(self.prompt)
        self.add(self.logo)

        self.logo.do(self.move)

    def on_move_finish(self):
        self.prompt.do(self.blink)

    def on_key_release(self, key, modifiers):
        if not self.logo.are_actions_running():
            self.prompt.do(self.confirm)
            self.prompt.do(self.play)
        else:
            self.logo.stop()
            self.logo.x = 30
            self.on_move_finish()

    def on_sound_done(self):
        director.replace(Scene(MenuLayer()))
