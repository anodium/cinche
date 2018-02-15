from cocos.layer import Layer
from pyglet.graphics import Batch
from pyglet import gl


class BitmapLayer(Layer):

    _batch = None

    bitmap = None
    height = None
    width = None

    def __init__(self, height, width):
        super(Layer, self).__init__()

        self._batch = Batch()

        self.heigh = height
        self.width = width

        self.bitmap = [[(0, 0, 0) for x in range(width)]
                       for y in range(height)]

    def draw(self):
        super(Layer, self).draw()

        gl.glPushMatrix()
        self.transform()
        gl.glPushAttrib(gl.GL_CURRENT_BIT)
        self._batch.draw()
        gl.glPopAttrib()
        gl.glPopMatrix()
