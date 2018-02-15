from enum import Enum

from cinche.util import BitmapLayer

from cocos.layer import Layer
from cocos.sprite import Sprite


class GameLayer(Layer):

    def __init__(self):
        super(Layer, self).__init__()


class AIGameLayer(GameLayer):

    def __init__(self):
        super(GameLayer, self).__init__()


class V2GameLayer(GameLayer):

    is_event_handler = True

    paths = None

    p1_sprite = None
    p1_inertia = None
    p1_timer = None
    p1_direction = None
    p1_dirty = None

    p2_sprite = None
    p2_inertia = None
    p2_timer = None
    p2_direction = None
    p2_dirty = None

    class Direction(Enum):
        NORTH = 1
        SOUTH = 2
        EAST = 3
        WEST = 4

    def __init__(self):
        super(GameLayer, self).__init__()

        self.paths = BitmapLayer(64, 64)
        self.paths.position = (0, 64)

        self.p1_sprite = Sprite('assets/images/player.png',
                                color=(255, 127, 0))
        self.p1_sprite.position = (7, 32)
        self.p2_sprite = Sprite('assets/images/player.png',
                                color=(0, 127, 255))
        self.p2_sprite.position = (56, 31)

        self.p1_inertia = 6
        self.p1_timer = self.p1_inertia
        self.p1_direction = self.Direction.EAST
        self.p1_dirty = False

        self.p2_inertia = 6
        self.p2_timer = self.p2_inertia
        self.p2_direction = self.Direction.WEST
        self.p2_dirty = False

        # FIXME: These aren't drawing anything to the screen, even before
        #        overriding super.on_draw(self)
        self.add(self.paths)
        self.add(self.p1_sprite)
        self.add(self.p2_sprite)

    def on_draw(self):
        # well, first off, check if they should still be alive
        # TODO: check for alive-ness by checking collision with others

        # check if they changed direction, slow them down if they did.
        if self.p1_dirty and self.p1_timer == 0:
            self.p1_inertia += 1
            self.p1_dirty = False

        if self.p2_dirty and self.p2_timer == 0:
            self.p2_inertia += 1
            self.p2_dirty = False

        # check if the inertia timer expired, if it did, move them
        # if they moved, also add to their trail, and then re-set the timer
        if self.p1_timer == 0:
            if self.p1_direction == self.Direction.NORTH:
                self.paths.bitmap[self.p1_sprite.position] = self.p1_sprite.color
                self.p1_sprite.position[1] += 1

            if self.p1_direction == self.Direction.SOUTH:
                self.paths.bitmap[self.p1_sprite.position] = self.p1_sprite.color
                self.p1_sprite.position[1] -= 1

            if self.p1_direction == self.Direction.EAST:
                self.paths.bitmap[self.p1_sprite.position] = self.p1_sprite.color
                self.p1_sprite.position[0] += 1

            if self.p1_direction == self.Direction.WEST:
                self.paths.bitmap[self.p1_sprite.position] = self.p1_sprite.color
                self.p1_sprite.position[0] -= 1

            self.p1_timer = self.p1_inertia

        if self.p2_timer == 0:
            if self.p2_direction == self.Direction.NORTH:
                self.paths.bitmap[self.p2_sprite.position] = self.p2_sprite.color
                self.p2_sprite.position[1] += 1

            if self.p2_direction == self.Direction.SOUTH:
                self.paths.bitmap[self.p2_sprite.position] = self.p2_sprite.color
                self.p2_sprite.position[1] -= 1

            if self.p2_direction == self.Direction.EAST:
                self.paths.bitmap[self.p2_sprite.position] = self.p2_sprite.color
                self.p2_sprite.position[0] += 1

            if self.p2_direction == self.Direction.WEST:
                self.paths.bitmap[self.p2_sprite.position] = self.p2_sprite.color
                self.p2_sprite.position[0] -= 1

            self.p2_timer = self.p2_inertia

    def on_key_press(self, key, modifiers):
        # TODO: change direction and raise dirty flag of each player on key
        pass
