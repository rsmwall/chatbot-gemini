# app.rb
require "sinatra/base"
require "json"
require "base64"
require "dotenv/load"
require "gemini-ai"

class ChatbotApp < Sinatra::Base
  configure do
    # inicializa cliente Gemini com chave da API via .env
    set :client, Gemini.new(
      credentials: {
        service: "generative-language-api",
        api_key: ENV.fetch("GEMINI_API_KEY")
      },
      options: {
        model: "gemini-2.5-flash",
        server_sent_events: false
      }
    )
  end

  get "/" do
    redirect "/public/index.html"
  end  

  post "/chat" do
    content_type :json
    payload = if request.media_type == "application/json"
                JSON.parse(request.body.read)
              else
                {
                  "message" => params["message"],
                  "history" => JSON.parse(params["history"] || "[]"),
                  "is_image" => false
                }
              end

    history = payload["history"]
    # adiciona a mensagem do usuário ao histórico
    history << { "role" => "user", "content" => payload["message"], "is_image" => payload["is_image"] }

    # prepara nodes para a API, texto ou imagem
    contents = history.map do |m|
      if m["is_image"]
        { role: m["role"], parts: [{ inlineData: { data: m["content"] } }] }
      else
        { role: m["role"], parts: [{ text: m["content"] }] }
      end
    end

    resp = settings.client.generate_content({ contents: contents })
    candidate = resp["candidates"].first["content"]
    reply = { "role" => "model", "parts" => [] }
    candidate["parts"].each do |part|
      if part["text"]
        reply["parts"] << { "text" => part["text"] }
      elsif part["inlineData"] && part["inlineData"]["data"]
        reply["parts"] << { "image_base64" => part["inlineData"]["data"] }
      end
    end

    history << reply
    { reply: reply, history: history }.to_json
  end

  # faz o app rodar se for executado diretamente
  run! if __FILE__ == $0
end
