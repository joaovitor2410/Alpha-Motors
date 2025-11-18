import http.server
import socketserver
from urllib.parse import urlparse, parse_qs
from datetime import datetime

# configurações do servidor
PORT = 8000 #port do servidor
DIRECTORY = "." # pasta que o script vai procurar os arquivos necessarios (. pois já está na pasta)
ARQUIVO_DE_SAIDA = "contatos_python.txt" # nome do arquivo onde os dados serão salvos

class CustomHandler(http.server.SimpleHTTPRequestHandler):
    
    # Esta função lida com requisições POST (envio do formulário)
    def do_POST(self):
        # Verifica se o formulário está sendo enviado para o caminho /submit-form
        if self.path == '/submit-form':
            
            # 1. Lê o corpo da requisição POST (os dados do formulário)
            content_length = int(self.headers['Content-Length'])
            post_data = self.rfile.read(content_length).decode('utf-8')
            
            # 2. Converte os dados do formulário em um dicionário Python
            parsed_data = parse_qs(post_data)
            
            # 3. Extrai e Limpa os dados
            nome = parsed_data.get('nome', [''])[0].strip()
            email = parsed_data.get('email', [''])[0].strip()
            telefone = parsed_data.get('telefone', [''])[0].strip()
            mensagem = parsed_data.get('mensagem', [''])[0].strip()

            # 4. Formata o texto para salvar
            timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            dados = f"========================================\n"
            dados += f"Data/Hora: {timestamp}\n"
            dados += f"Nome: {nome}\n"
            dados += f"Email: {email}\n"
            dados += f"Telefone: {telefone}\n"
            dados += f"Mensagem: {mensagem}\n"
            dados += f"========================================\n\n"

            # 5. Salva os dados no arquivo localmente
            try:
                with open(ARQUIVO_DE_SAIDA, 'a', encoding='utf-8') as f:
                    f.write(dados)
                
                # Resposta de Sucesso: Redireciona o usuário de volta para o index
                self.send_response(200)
                self.send_header('Content-type', 'application/json; charset=utf-8')
                self.end_headers()
                self.wfile.write(b'{"status":"ok"}')
                
            except Exception as e:
                # Resposta de Erro
                self.send_response(500)
                self.end_headers()
                self.wfile.write(f"Erro ao salvar dados: {e}".encode('utf-8'))
        
        else:
            # Para outros caminhos POST que não sejam o formulário
            super().do_POST()

# --- Inicia o Servidor Local ---
def run_server():
    with socketserver.TCPServer(("", PORT), CustomHandler) as httpd:
        print(f"Servidor Python rodando em: http://localhost:{PORT}")
        print("Pressione Ctrl+C para parar o servidor.")
        httpd.serve_forever()

if __name__ == "__main__":
    run_server()