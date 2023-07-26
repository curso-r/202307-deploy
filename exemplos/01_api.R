library(httr)

resposta <- GET("https://pokeapi.co/api/v2/pokemon/ditto")
lista <- content(resposta)

lista$moves[[1]]$move$name

# NASA_KEY = "9jLkejFX39K5xEfrYOiGZhugwOd5S8HSqOZPz1L2"
# usethis::edit_r_environ()

Sys.getenv("NASA_KEY")

params <- list(
  date = "2023-01-02",
  api_key = Sys.getenv("NASA_KEY")
)

resposta <- GET("https://api.nasa.gov/planetary/apod", query = params)
content(resposta)$hdurl

params <- list(
  errado = "erro"
)

# Chamado com erro (não mandei a api_key)
resposta <- GET("https://api.nasa.gov/planetary/apod", query = params)
content(resposta)

# GET = só pega informação
# POST = mas ele altera informação (ou transmite senhas!)

params <- list(
  usuario = "caio",
  chave = "chave secreta"
)

resposta <- POST("https://httpbin.org/post", body = params)
content(resposta)

library(plumber)

# 80 = site (http)
# 443 = site (https)
# https://google.com:443 = https://google.com
# https://google.com:22 = erro! não é um site

# 8000-8999 (no geral) = portas livres

api <- plumb("exemplos/01_plumber.R")
pr_run(api, port = 8000)
# 127.0.0.1 = localhost (link que volta pro PC)

# Em outra sessão do RStudio
params <- list(
  msg = "Funciona!"
)
resposta <- GET("http://127.0.0.1:8000/echo", query = params)
content(resposta)

# Agora com o endpoint /sum
api <- plumb("exemplos/01_plumber.R")
pr_run(api, port = 8000)

params <- list(
  a = -1,
  b = 5,
  senha = "segredo"
)
resposta <- POST(
  "http://127.0.0.1:8000/sum",
  body = params,
  encode = "json"
)
content(resposta)

# Erro
params <- list(
  a = -1,
  b = 5,
  senha = "errada"
)
resposta <- POST(
  "http://127.0.0.1:8000/sum",
  body = params,
  encode = "json"
)
content(resposta)
