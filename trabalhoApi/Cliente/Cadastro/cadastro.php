<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tela de Cadastro</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            display: flex; /* Adicionado: para centralizar verticalmente */
            justify-content: center; /* Adicionado: para centralizar horizontalmente */
            align-items: center; /* Adicionado: para centralizar verticalmente */
            height: 100vh; /* Adicionado: para ocupar toda a altura da tela */
            margin: 0; /* Adicionado: para remover margens padrão */
            background-color: #f0f0f0; /* Adicionado: cor de fundo */
        }
        .container {
            max-width: 300px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
        input[type="text"], input[type="password"] {
            width: 90%;
            padding: 10px;
            margin-bottom: 10px;
        }
        input[type="file"]{
            border: 1px solid #ccc;
            display: inline-block;
            padding: 10px 10px;
            cursor: pointer;
            background-color: #f9f9f9;
            border-radius: 5px;
            margin-bottom: 10px;
        }        
        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 20px;
        }
        button:hover {
            background-color: #3389e5;
        }        
        a {
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Faça seu cadastro</h1>
        <form id="cadastroForm">
            <label for="usuario">Usuário:</label>
            <input type="text" id="usuario" name="usuario" required>
            <br>
            <label for="senha">Senha:</label>
            <input type="password" id="senha" name="senha" required>
            <br>
            <button type="submit">Cadastrar</button>
        </form>  
        <button onclick="voltar()" style="margin-top:15px;">Voltar para pagina de login</button>      
    </div>
    <script>
        const form = document.getElementById('cadastroForm');

        function voltar() {
            // Redireciona para a página de login (substitua pelo URL correto)
            window.location.href = '../index.html';
        }

        form.addEventListener('submit', async (event) => {
            event.preventDefault();

            const usuario = form.usuario.value;
            const senha = form.senha.value;

            // Enviar dados para a API (substitua pela URL da sua API)
            try {
                const response = await fetch('http://localhost/ApiMagic/cadastro', {
                    method: 'POST',
                    body: JSON.stringify({ usuario, senha }),
                    headers: {
                        'Content-Type': 'application/json'
                    }
                });
                if (response.ok) {
                    const data = await response.json();
                    const token = data.dados;

                    // Salvar o token em um arquivo JSON (substitua pelo seu método de armazenamento)
                    const tokenObj = { token };
                    const jsonToken = JSON.stringify(tokenObj);
                    // Cria um Blob com o conteúdo JSON
                    const blob = new Blob([jsonToken], { type: 'application/json' });

                    // Cria um URL temporário para o Blob
                    const url = URL.createObjectURL(blob);

                    // Cria um link de download
                    const linkDownload = document.createElement('a');
                    linkDownload.href = url;
                    linkDownload.download = 'token.json'; // Nome do arquivo
                    document.body.appendChild(linkDownload);

                    // Simula um clique no link para iniciar o download
                    linkDownload.click();

                    URL.revokeObjectURL(url);                    

                    alert("Usuário criado com sucesso!!! Utilize o token baixado para acessar o site!!!");          

                } else {
                    console.error('Erro ao cadastrar usuário.');
                }
            } catch (error) {
                console.error('Erro na comunicação com a API:', error);
            }
        });
    </script>    
</body>
</html>