<?php
class Core{

	public function exec(){
		//criando uma instancia do roteador
		$router = new Router();

		//configurar as rotas
		//configurações da api 
		$router->addRoute('/cartas', array(new cartasController(), 'index'));
		$router->addRoute('/cartas/lista', array(new cartasController(), 'lista'));
		$router->addRoute('/cartas/cadastro', array(new cartasController(), 'cadastraCartas'));
		$router->addRoute('/cartas/deck', array(new cartasController(), 'deck'));
		$router->addRoute('/cartas/cadastradeck', array(new cartasController(), 'cadastraDeck'));
		$router->addRoute('/cartas/removedeck', array(new cartasController(), 'removeDeck'));


		$router->addRoute('/login', array(new loginController(), 'login'));

		$router->addRoute('/cadastro', array(new cadastroController(), 'cadastro'));

		$router->addRoute('/404', array(new notfoundController(), 'index'));

		//configurando rota de página não encontrada
		//lidando com a requisição
		$route = isset($_GET['route'])?'/'.$_GET['route']:'/';

		$router->handleRequest($route);
	}

}
