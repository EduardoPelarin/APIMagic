<?php
class Cartas extends model{
	public function getNome($nome){
		$retorno = array();

		$sql = "SELECT *
		          FROM cartasmagic
		         WHERE nome = :nome";
	
		$sql = $this->db->prepare($sql);
		$sql->bindValue(':nome', $nome);
		$sql->execute();

		if($sql->rowCount() > 0){
			$retorno = $sql->fetchAll(\PDO::FETCH_ASSOC);
		}		         

		return $retorno;		
	}	

	public function getAll(){
		$retorno = array();

		$sql = "SELECT * 
		          FROM cartasmagic
		         ORDER BY id";
		
		$sql = $this->db->query($sql);

		if($sql->rowCount() > 0){
			$retorno = $sql->fetchAll(\PDO::FETCH_ASSOC);
		}		         

		return $retorno;
	}


	public function getDeck(){
		$retorno = array();

		$sql = "SELECT cartasmagic.id, cartasmagic.imagens, cartasmagic.nome, cartasmagic.descricao, cartasmagic.custo_mana
				FROM deck
				  INNER JOIN cartasmagic ON (cartasmagic.id = deck.cartas)
				ORDER BY cartasmagic.nome";
		
		$sql = $this->db->query($sql);

		if($sql->rowCount() > 0){
			$retorno = $sql->fetchAll(\PDO::FETCH_ASSOC);
		}		         

		return $retorno;
	}

	public function postDeck($cartas){

		$sql = "INSERT INTO deck(cartas) VALUES(:cartas)";
		$sql = $this->db->prepare($sql);
		$sql->bindParam(':cartas', $cartas);
		$sql->execute();

	}		

	public function deleteDeck($cartas){

		try {
			$sql = "DELETE FROM deck WHERE cartas = :cartas";
			$sql = $this->db->prepare($sql);
			$sql->bindParam(':cartas', $cartas);
			$sql->execute();
		} catch(PDOException $e) {
			echo "Erro ao excluir registro: " . $e->getMessage();
		}		
	}			

	public function cadastroCarta($nome, $tipo, $custo_mana, $descricao, $raridade, $colecao, $imagens){
		try {
			$sql = "INSERT INTO cartasmagic(nome, tipo, custo_mana, descricao, raridade, colecao, imagens) VALUES (:nome, :tipo, :custo_mana, :descricao, :raridade, :colecao, :imagens)";

			$sql = $this->db->prepare($sql);
			$sql->bindParam(':nome', $nome);
			$sql->bindParam(':tipo', $tipo);
			$sql->bindParam(':custo_mana', $custo_mana);
			$sql->bindParam(':descricao', $descricao);
			$sql->bindParam(':raridade', $raridade);
			$sql->bindParam(':colecao', $colecao);				
			$sql->bindParam(':imagens', $imagens);	
			$sql->execute();

		} catch(PDOException $e) {
		echo "Erro ao criar novo registro: " . $e->getMessage();
		}		

	}


}