import cocos


class TitleScene(cocos.layer.Layer):

    def __init__(self):
        super(TitleScene, self).__init__()

        label = cocos.text.Label('Hello!',
                                 font_name='Courier New',
                                 font_size=4,
                                 anchor_x='center', anchor_y='center')

        label.position = 320, 240
        self.add(label)
