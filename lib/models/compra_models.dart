class ItensCompra {
  final String id;
  final String nome;
  final double preco;
  final String urlImagem;
  final String descricao;
  final String marca;
  final int quantidade;
  final String categoria;

  ItensCompra({
    required this.id,
    required this.nome,
    required this.preco,
    required this.urlImagem,
    required this.descricao,
    required this.marca,
    this.quantidade = 0,
    required this.categoria,
  });

  factory ItensCompra.fromJson(Map<String, dynamic> json) {
    return ItensCompra(
      id: json['id'].toString(),
      nome: json['name'],
      preco: json['preco'].toDouble(),
      urlImagem: json['imagem'],
      descricao: json['descricao'],
      marca: json['marca'],
      quantidade: 0,
      categoria: json['Categoria'],
    );
  }
}
