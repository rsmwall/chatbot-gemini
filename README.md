# 🤖 Chatbot com Gemini (Texto + Imagem)

Este é um projeto simples de chatbot utilizando a API do **Gemini** (Google AI), que permite o envio de **mensagens de texto e imagens**. A IA responde com uma análise da imagem ou responde ao texto enviado. Desenvolvido como trabalho final da disciplina de Inteligência Artificial do Instituto Federal do Piauí.

Construído com:
- [Google Gemini API (v1beta)](https://ai.google.dev/)
- [Sinatra](https://sinatrarb.com/) (Ruby)
- [Tailwind CSS](https://tailwindcss.com/) no frontend

---

## Funcionalidades

- Envie **texto** e receba respostas da IA.
- Envie uma **imagem** e receba uma **descrição** da imagem.
- Combine **texto + imagem** para descrições contextuais.
- Interface responsiva com Tailwind CSS.

---

## Instalação

### Pré-requisitos

- [Ruby](https://www.ruby-lang.org/pt/downloads/) (3.4 ou superior)
- Bundler
- Conta na [Google AI](https://ai.google.dev/)
- Chave de API do Gemini

### Passo a passo

1. **Clone o repositório**:

```bash
git clone https://github.com/seu-usuario/chatbot-gemini.git
cd chatbot-gemini
```

2. **Instale as dependências**:

```bash
bundle install
```

3. **Configure a chave da API**:

Crie um arquivo .env na raiz do projeto com sua chave:

```
GEMINI_API_KEY=sua_chave_aqui
```

4. **Execute o servidor**:

```bash
ruby app.rb
```

5. **Acesse o chat**:

Abra no navegador: http://localhost:4567

## Estrutura do Projeto

├── app.rb              # Backend Sinatra
├── .env                # Chave da API
├── Gemfile             # Gems necessárias
├── public/
│   └── index.html      # Frontend HTML + Tailwind
└── README.md           # Este arquivo

## Modelo Utilizado

Este projeto usa o modelo gemini-2.5-flash, que aceita texto e imagem simultaneamente.

Você pode trocar para outro modelo na constante GEMINI_MODEL dentro do app.rb.

## Contribuições

Pull requests são bem-vindos! Se encontrar bugs ou tiver sugestões, abra uma issue.

## Autor

Rafael Ribeiro da Silva
[Github](https://github.com/rsmwall)
[Bluesky](https://bsky.app/profile/rsmwall.dev)