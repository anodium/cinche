import cocos


class HelloWorld(cocos.layer.Layer):

    def __init__(self):
        super(HelloWorld, self).__init__()

        label = cocos.text.Label('Hello!',
                                 font_name='Courier New',
                                 font_size=4,
                                 anchor_x='center', anchor_y='center')

        label.position = -64, 0
        self.add(label)
