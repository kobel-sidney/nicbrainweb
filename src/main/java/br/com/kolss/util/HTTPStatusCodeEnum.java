package br.com.kolss.util;


/** Códigos de Status do HTTP */
public enum HTTPStatusCodeEnum {
	
	// Informativa:
	STATUS_100("100", "continuar"),
	STATUS_101("101", "mudando protocolos"),
	STATUS_122("122", "pedido-URI muito longo"),
	
	// Sucesso:
	STATUS_200("200", "ok"),
	STATUS_201("201", "criado"),
	STATUS_202("202", "aceito"),
	STATUS_203("203", "não autorizado"),
	STATUS_204("204", "nenhum conteudo"),
	STATUS_205("205", "reset"),
	STATUS_206("206", "conteúdo parcial"),
	STATUS_207("207", "status multi (WebDAV)"),
	
	// Redirecionamento:
	STATUS_300("300", "múltipla escolha"),
	STATUS_301("301", "movido"),
	STATUS_302("302", "encontrado"),
	STATUS_304("304", "não modificado"),
	STATUS_305("305", "use proxy"),
	STATUS_306("306", "proxy switch"),
	STATUS_307("307", "redicionamento temporário"),
	
	// Erro do Cliente:
	STATUS_400("400", "requisição inválida"),
	STATUS_401("401", "não autorizado"),
	STATUS_402("402", "pagamento necessário"),
	STATUS_403("403", "proibido"),
	STATUS_404("404", "não encontrado"),
	STATUS_405("405", "método não permitido"),
	STATUS_406("406", "não aceitável"),
	STATUS_407("407", "autenticação de proxy necessária"),
	STATUS_408("408", "timeout pedido"),
	STATUS_409("409", "conflito"),
	STATUS_410("410", "gone"),
	STATUS_411("411", "comprimento necessário"),
	STATUS_412("412", "pré-condição falhou"),
	STATUS_413("413", "entidade de solicitação muito grande"),
	STATUS_414("414", "pedido uri too long"),
	STATUS_415("415", "tipo de mídia não suportado"),
	STATUS_416("416", "solicitada de faixa não satisfatória"),
	STATUS_417("417", "falha na expectativa"),
	STATUS_418("418", "eu sou um bule de chá"),
	STATUS_422("422", "entidade improcessável (WebDAV)"),
	STATUS_423("423", "fechado (WebDAV)"),
	STATUS_424("424", "falha de dependência (WebDAV)"),
	STATUS_425("425", "coleção não ordenada"),
	STATUS_426("426", "upgrade obrigatório"),
	STATUS_450("450", "bloqueados pelo windows controles dos pais"),
	STATUS_499("499", "cliente fechou pedido"),
	
	// Outros Erros
	STATUS_500("500", "erro interno do servidor"),
	STATUS_501("501", "não implementado"),
	STATUS_502("502", "bad gateway"),
	STATUS_503("503", "serviço indisponível"),
	STATUS_504("504", "gateway time-out"),
	STATUS_505("505", "HTTP version not supported");
	
	private String statusCode;
	private String descricao;
	
	
	private HTTPStatusCodeEnum(String statusCode, String descricao) {
		this.statusCode = statusCode;
		this.descricao = descricao;
	}
	
	public String getStatusCode() {
		return statusCode;
	}
	
	public String getDescricao() {
		return descricao;
	}
	
}
