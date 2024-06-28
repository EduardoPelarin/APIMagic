<?php
include '../ArquivosGlobais/variaveis.php'; // Inclui o arquivo de configuração

// Verifica se o formulário foi enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $_SESSION['usuario'] = $_POST["usuario"];
    $_SESSION['senha'] = $_POST["senha"];
    $arquivoJson = $_POST["token"];
    $jsonContent = file_get_contents('../'.$arquivoJson);
    
    // Decodifica o JSON para um array associativo
    $jsonData = json_decode($jsonContent, true);

    // Verifica se o JSON foi decodificado corretamente
    if ($jsonData === null) {
        die("Erro ao decodificar o JSON.");
    }
    $_SESSION['token'] = isset($jsonData['token']) ? $jsonData['token'] : '';

    $url = $_SESSION['baseUrl'] . '/login';
    $curl = curl_init($url);


    $dadosLogin = [
        'usuario' => $_SESSION['usuario'],
        'senha' => $_SESSION['senha']
    ];
    $jsonDadosLogin = json_encode($dadosLogin);

    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'POST');
    curl_setopt($curl, CURLOPT_POSTFIELDS, $jsonDadosLogin);
    curl_setopt($curl, CURLOPT_HTTPHEADER, [
        'Content-Type: application/json',
        'Authorization: ' . $_SESSION['token'] // Utiliza o token no cabeçalho de autorização
    ]);

    $response = curl_exec($curl);
    $retorno = json_decode($response, true);


    if ($retorno['status'] === true) {
            header('Location: ../Site/home.html');
            exit; 
    } else {
        echo "Erro no login: ". $retorno['titulo'] ;
    }

    curl_close($curl);
}
?>
