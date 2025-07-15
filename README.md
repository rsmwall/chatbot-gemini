# chatbot-geminChatbot Gemini com Sinatra (Ruby)

Um chatbot multimodal (texto + imagem) usando Ruby, Sinatra, Tailwind e a API Gemini da Google.

### Tecnologias e dependências

    Ruby 3.x

    Sinatra (microframework web em Ruby)
    GitHub+13GitHub+13rubydoc.info+13
    The Ruby Toolbox+12Wikipedia+12GitHub+12

    sinatra-contrib (helper json)

    dotenv (para carregar a chave API via .env)

    gemini-ai (gem oficial para usar a API Gemini)
    GitHub
    GitHub
    GitHub+1GitHub+1

    Tailwind CSS (frontend estilo moderno-chat)

### Instalação

Clone o repositório:

git clone <repo_url>
cd chatbot-gemini

Adicione o Gemfile com:

gem 'sinatra'
gem 'sinatra-contrib'
gem 'dotenv'
gem 'gemini-ai', '~> 4.2.0'

Execute:

bundle install

Crie o arquivo .env na raiz com sua chave:

GEMINI_API_KEY=SEU_TOKEN_AQUI

🖥️ Estrutura do Projeto

chatbot-gemini/
│
├── app.rb           # Backend em Sinatra
├── Gemfile
├── .env
└── public/
    └── index.html  # Frontend com Tailwind + JS

### Backend (app.rb)

    Serve o frontend (index.html)

    Rota POST /chat que espera JSON com histórico e envia para a API Gemini

    Usa modelo "models/gemini-2.5-flash" (formato exigido pela API)
    GitHub+7GitHub+7The Ruby Toolbox+7
    The Ruby Toolbox+2Google AI Developers Forum+2GitHub+2
    GitHub+2Wikipedia+2GitHub+2

    Retorna JSON com reply.parts

    Imprime no terminal o log raw da resposta Gemini para diagnóstico

### Frontend (public/index.html)

    Interface estilo ChatGPT com bolhas de mensagem (texto ou imagem)

    Upload de imagem via botão 📷 que converte para Base64

    Envios via fetch('/chat')

    Exibe as respostas do modelo nas bolhas adequadas

### Como usar

    Execute o servidor:

bundle exec ruby app.rb

Acesse: http://localhost:4567/

Envie uma mensagem de texto ou imagem.

Respostas do Gemini aparecem como chat.

Verifique logs no terminal com "Gemini raw response:" para checar o JSON retornado.