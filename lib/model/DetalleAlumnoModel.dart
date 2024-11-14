class DetalleAlumnoModel {
  Curso? curso;
  Profesor? profesor;
  List<Materia>? materias;

  DetalleAlumnoModel({this.curso, this.profesor, this.materias});

  factory DetalleAlumnoModel.fromJson(Map<String, dynamic> json) {
    return DetalleAlumnoModel(
      curso: json['curso'] != null ? Curso.fromJson(json['curso']) : null,
      profesor:
          json['profesor'] != null ? Profesor.fromJson(json['profesor']) : null,
      materias: json['materias'] != null
          ? List<Materia>.from(json['materias'].map((x) => Materia.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'curso': curso?.toJson(),
      'profesor': profesor?.toJson(),
      'materias': materias?.map((x) => x.toJson()).toList(),
    };
  }
}

class Curso {
  int? id;
  String? nombre;
  String? nivel;
  String? grado;
  String? turno;

  Curso({this.id, this.nombre, this.nivel, this.grado, this.turno});

  factory Curso.fromJson(Map<String, dynamic> json) {
    return Curso(
      id: json['id'],
      nombre: json['nombre'],
      nivel: json['nivel'],
      grado: json['grado'],
      turno: json['turno'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'nivel': nivel,
      'grado': grado,
      'turno': turno,
    };
  }
}

class Profesor {
  int? id;
  String? nombre;

  Profesor({this.id, this.nombre});

  factory Profesor.fromJson(Map<String, dynamic> json) {
    return Profesor(
      id: json['id'],
      nombre: json['nombre'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }
}

class Materia {
  int? id;
  String? nombre;
  Horario? horario;
  Aula? aula;
  Profesor? profesor;

  Materia({this.id, this.nombre, this.horario, this.aula, this.profesor});

  factory Materia.fromJson(Map<String, dynamic> json) {
    return Materia(
      id: json['id'],
      nombre: json['nombre'],
      horario:
          json['horario'] != null ? Horario.fromJson(json['horario']) : null,
      aula: json['aula'] != null ? Aula.fromJson(json['aula']) : null,
      profesor:
          json['profesor'] != null ? Profesor.fromJson(json['profesor']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'horario': horario?.toJson(),
      'aula': aula?.toJson(),
      'profesor': profesor?.toJson(),
    };
  }
}

class Horario {
  int? id;
  String? nombre;

  Horario({this.id, this.nombre});

  factory Horario.fromJson(Map<String, dynamic> json) {
    return Horario(
      id: json['id'],
      nombre: json['nombre'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }
}

class Aula {
  int? id;
  String? nombre;
  int? numero;

  Aula({this.id, this.nombre, this.numero});

  factory Aula.fromJson(Map<String, dynamic> json) {
    return Aula(
      id: json['id'],
      nombre: json['nombre'],
      numero: json['numero'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'numero': numero,
    };
  }
}
