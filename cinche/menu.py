import cocos


class MenuLayer(cocos.layer.Layer):

    def __init__(self):
        super(MenuLayer, self).__init__()

        menu = MainMenu()
        menu.position = 0, 0
        self.add(menu)


class MainMenu(cocos.menu.Menu):
    def __init__(self):
        super(MainMenu, self).__init__()

        # TODO: Write menu

        self.create_menu()
