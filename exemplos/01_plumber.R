library(plumber)

#* Escreve uma mensagem
#* @param msg A mensagem para escrever
#* @get /echo
function(msg = "") {
  paste0("A mensagem é: '", msg, "'")
}

#* Retorna a soma de dois números
#* @param a O primeiro número
#* @param b O segundo número
#* @param senha O código de autorização
#* @post /sum
function(a, b, senha = "") {
  if (senha == "segredo") {
    as.numeric(a) + as.numeric(b)
  } else {
    stop("SENHA ERRADA")
  }
}
