require 'sinatra'
require 'json'
require 'net/http'
require 'uri'
require 'dotenv/load'

GEMINI_API_KEY = ENV.fetch("GEMINI_API_KEY")
GEMINI_MODEL = "gemini-2.5-flash" 
GEMINI_ENDPOINT = "https://generativelanguage.googleapis.com/v1beta/models/#{GEMINI_MODEL}:generateContent"

set :public_folder, File.dirname(__FILE__) + '/public'

get "/" do
  send_file File.join(settings.public_folder, 'index.html')
end

post "/chat" do
  content_type :json

  data = JSON.parse(request.body.read)
  message = data["message"]
  image_base64 = data["image_base64"]

  parts = []

  if image_base64 && !image_base64.empty?
    parts << {
      inlineData: {
        mimeType: "image/jpeg",
        data: image_base64
      }
    }
  end

  if message && !message.empty?
    parts << { text: message }
  end

  body = {
    contents: [
      {
        role: "user",
        parts: parts
      }
    ]
  }

  uri = URI("#{GEMINI_ENDPOINT}?key=#{GEMINI_API_KEY}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  request_http = Net::HTTP::Post.new(uri, { 'Content-Type': 'application/json' })
  request_http.body = JSON.dump(body)

  response = http.request(request_http)
  result = JSON.parse(response.body)

  if result["candidates"]
    content = result["candidates"].first.dig("content", "parts", 0, "text")
    { reply: content }.to_json
  else
    status 500
    { error: result["error"] || "Resposta inesperada da API" }.to_json
  end
end
