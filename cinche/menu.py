from cinche.game import GameScene
from cinche.game import V2GameLayer

from cocos.director import director
from cocos.menu import Menu
from cocos.layer import Layer


class MenuLayer(Layer):

    def __init__(self):
        super(MenuLayer, self).__init__()

        # menu = MainMenu()
        # menu.position = 0, 0
        # self.add(menu)

        director.replace(GameScene(V2GameLayer()))


class MainMenu(Menu):

    def __init__(self):
        super(MainMenu, self).__init__()

        # TODO: Write menu

        self.create_menu()
