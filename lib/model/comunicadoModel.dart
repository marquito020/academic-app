class ComunicadoModel {
  int id;
  String titulo;
  String descripcion;
  // enlace puede ser bool o String
  dynamic enlace;
  String? archivo_url;
  String? archivo_nombre;

  ComunicadoModel({
    required this.id,
    required this.titulo,
    required this.descripcion,
    this.enlace,
    this.archivo_url,
    this.archivo_nombre,
  });

  factory ComunicadoModel.fromJson(Map<String, dynamic> json) {
    return ComunicadoModel(
      id: json['id'],
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      enlace: json['enlace'] ?? false,
      archivo_url: json['archivo_url'] ?? '',
      archivo_nombre: json['archivo_nombre'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'descripcion': descripcion,
      'enlace': enlace,
      'archivo_url': archivo_url,
      'archivo_nombre': archivo_nombre,
    };
  }

  ComunicadoModel copyWith({
    int? id,
    String? titulo,
    String? descripcion,
    String? enlace,
    String? archivo_url,
    String? archivo_nombre,
  }) {
    return ComunicadoModel(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descripcion: descripcion ?? this.descripcion,
      enlace: enlace ?? this.enlace,
      archivo_url: archivo_url ?? this.archivo_url,
      archivo_nombre: archivo_nombre ?? this.archivo_nombre,
    );
  }

  @override
  String toString() {
    return 'Comunicadomodel{id: $id, titulo: $titulo, descripcion: $descripcion, enlace: $enlace, archivo_nombre: $archivo_nombre}';
  }
}
