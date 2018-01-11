import cocos


class TitleLayer(cocos.layer.Layer):

    def __init__(self):
        super(TitleLayer, self).__init__()

        image = cocos.sprite.Sprite('assets/images/logo.png')

        # label = cocos.text.Label('Hello!',
        #                          font_name='Courier New',
        #                          font_size=4,
        #                          anchor_x='center', anchor_y='center')

        # label.position = 320, 240

        # TODO: Figure out coordinate space. Maybe lower-left corner origin?
        image.position = 34, 5
        self.add(image)
