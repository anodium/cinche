package;

import kha.System;
import cinche.Cinche;

class Main {

	public static function main() {
		System.init({ title: "Cinche", width: 512, height: 512 }, init);
	}

	private static function init() {
		var game = new Cinche();
		System.notifyOnRender(game.render);
	}
}
