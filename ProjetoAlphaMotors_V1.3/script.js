// funcionalidades gerais:
// 1- alternar entre modo escuro e claro
// 2- fazer o scrollamento suave da pagina
// 3- mostrar as informaçoes extras quando passar o mouse sobre os carros
// 4- enviar o formulario sem recarregar a pagina

// DOMCotentLoaded faz com que as coisas aconteçam depois que o html for carregado

// 1- função para trocar o modo escuro/claro no site
document.addEventListener('DOMContentLoaded', function() {
    
    // seleciona os elementos do html
    const themeToggle = document.getElementById('darkThemeToggle')
    const body = document.body

    // define os ícones a partir da pasta assets
    const iconMoon = 'assets/lua_botao.png'
    const iconSun = 'assets/sol_botao.jpg'

    // função que aplica o tema e muda a imagem na navbar
    // local storage guarda a escolha do usuario mesmo se ele fechar e abrir o navegador
    function applyTheme(theme) {
        if (theme === 'dark') {
            body.classList.add('dark-mode')
            themeToggle.src = iconMoon
            localStorage.setItem('theme', 'dark')
        } else {
            body.classList.remove('dark-mode')
            themeToggle.src = iconSun
            localStorage.setItem('theme', 'light')
        }
    }

    // eventlistener que aguarda o clique no botão para mudar o tema 
    themeToggle.addEventListener('click', () => {
        if (body.classList.contains('dark-mode')) {
            applyTheme('light')
        } else {
            applyTheme('dark')
        }
    })

    // carrega do armazenamento local o tema que o usuario usou pela ultima vez e aplica caso a encontre
    const savedTheme = localStorage.getItem('theme')
    
    if (savedTheme) {
        applyTheme(savedTheme)
    }

})

// 2- função de scroll lento da página usando o nav
document.addEventListener('DOMContentLoaded', function() {

    //seleciona os links dentro da navbar
    const links = document.querySelectorAll('header a[href^="#"]');

    links.forEach(link => {
        link.addEventListener('click', function(e) {
            
            //previne o pulo
            e.preventDefault();

            //pega id das secoes
            const href = this.getAttribute('href');
            const targetElement = document.querySelector(href);

            if (targetElement) {
                
                //pega a posição atual da janela
                const startPosition = window.scrollY;

                //acha a posicao da janela
                const targetPosition = targetElement.getBoundingClientRect().top + startPosition;
                
                //segue a regra do css de 120px
                const style = window.getComputedStyle(targetElement);
                const scrollMargin = parseFloat(style.scrollMarginTop) || 0; 

                //calcula o destino final
                const finalDestination = targetPosition - scrollMargin;

                //configura a animacao
                const duration = 400;
                let startTime = null;

                //função de animar o scrollamento da pagina
                function animateScroll(currentTime) {
                    if (startTime === null) {
                        startTime = currentTime;
                    }
                    const timeElapsed = currentTime - startTime;
                    const run = easeInOutQuad(timeElapsed, startPosition, finalDestination - startPosition, duration);
                    window.scrollTo(0, run);
                    if (timeElapsed < duration) {
                        requestAnimationFrame(animateScroll);
                    }
                }

                // calcula posiçao
                // uma formula pronta de suavizaçao (easeInOut) usada em animaçoes graficas
                function easeInOutQuad(t, b, c, d) {
                    t /= d / 2;
                    if (t < 1) return c / 2 * t * t + b;
                    t--;
                    return -c / 2 * (t * (t - 2) - 1) + b;
                }
                //inicia animação
                requestAnimationFrame(animateScroll);
            }
        });
    });
});

// 3- função que exibe os cards dos carros
document.addEventListener('DOMContentLoaded', () => {
    // pega todos os carros da carro.card
    const carros = document.querySelectorAll('.carro-card');

    carros.forEach(carro => {
        // pega o texto atribuido no html, se nao tiver, ignora
        const infoExtra = carro.getAttribute('data-info');
        if (!infoExtra) return;

        // cria uma div dinamicamente, que tambem foi estilizada no css
        const tooltip = document.createElement('div');
        // adiciona a classe
        tooltip.classList.add('carro-tooltip');
        // insere dentro do card o texto
        tooltip.textContent = infoExtra;
        carro.appendChild(tooltip);

        // fazer o card seguir o mouse
        carro.addEventListener('mousemove', e => {
            const rect = carro.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            tooltip.style.left = `${x + 15}px`;
            tooltip.style.top = `${y - 10}px`;
        });
    });
});

// 4- funçao do envio do forms de contato pra o server
document.addEventListener('DOMContentLoaded', () => {
    
    //seleciona o elemento usando o id (form-contato e o armazena na constante form)
    const form = document.getElementById('form-contato');
    
    //verifica se o formulário foi encontrado ou não
    if (!form) {
        console.error("Formulário não encontrado!");
        return;
    }

    //eventlistener que aguarda o submit para executar o código de aviso
    form.addEventListener('submit', async (event) => {
        
        // event que previne o comportamento da página se abrir a respostas em uma pagina separada
        event.preventDefault(); 
        
        
        //cria a constante formData que armazena os dados digitados no form convertidas para a comunicação com o servidor
        const formData = new URLSearchParams(new FormData(form));
        
        //try com um catch que exibe mensagem de erro
        try {
            
            // envia os dados do formulário para o servidor
            const response = await fetch(form.action, {
                method: form.method, 
                // informa ao servidor o tipo de dado
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                // atribui ao body os dados formatados
                body: formData 
            });

            //se o servidor retornar ok, exibe as mensagens desejadas
            if (response.ok) {
                alert('Mensagem enviada com sucesso!');
                //limpa o campo de formulario
                form.reset();
            } 
            
            //se o servidor retornar algo diferente de ok, ele exibe como alerta a mensagem de erro e seu código
            else {
                alert('Erro ao enviar mensagem. Código: ' + response.status);
            }
            
        //se ocorrer erro com a conexão geral do servidor ele retorna um alerta de erro, faz parte do try
        } catch (error) {
            alert('Erro de conexão com o servidor.');
            console.error(error);
        }
    });
});