import 'package:flutter/material.dart';
import 'package:academic_app/model/DetalleAlumnoModel.dart';
import 'package:academic_app/services/curso_service.dart';

class MiCursoScreen extends StatefulWidget {
  @override
  _MiCursoScreenState createState() => _MiCursoScreenState();
}

class _MiCursoScreenState extends State<MiCursoScreen> {
  DetalleAlumnoModel? detalleAlumno;
  bool isLoading = true;
  DetalleAlumnoService detalleAlumnoService = DetalleAlumnoService();

  @override
  void initState() {
    super.initState();
    _fetchCursoDetalle();
  }

  Future<void> _fetchCursoDetalle() async {
    try {
      // Aquí llamarías a tu servicio para obtener el modelo
      // Por ejemplo: detalleAlumno = await CursoService().fetchDetalleAlumno();
      detalleAlumno = (await detalleAlumnoService.getDetalleAlumno())!;
      // Simulación de datos de ejemplo para propósitos de demostración:
      setState(() {
        // detalleAlumno = DetalleAlumnoModel(
        //   curso: Curso(
        //     id: 1,
        //     nombre: "Primero de Secundaria",
        //     nivel: "Secundaria",
        //     grado: "1°",
        //     turno: "Mañana",
        //   ),
        //   profesor: Profesor(id: 1, nombre: "Jose Toledo"),
        //   materias: [
        //     Materia(
        //       id: 1,
        //       nombre: "Matemáticas",
        //       horario: Horario(id: 1, nombre: "Mañana"),
        //       aula: Aula(id: 1, nombre: "Aula 1", numero: 1),
        //       profesor: Profesor(id: 42, nombre: "Jose Toledo"),
        //     ),
        //   ],
        // );
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar los datos del curso')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Curso'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : detalleAlumno == null
              ? Center(child: Text('No hay datos disponibles'))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCursoInfo(),
                      SizedBox(height: 16),
                      _buildProfesorInfo(),
                      SizedBox(height: 16),
                      _buildMateriasList(),
                    ],
                  ),
                ),
    );
  }

  Widget _buildCursoInfo() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Curso: ${detalleAlumno?.curso?.nombre ?? 'N/A'}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Nivel: ${detalleAlumno?.curso?.nivel ?? 'N/A'}'),
            Text('Grado: ${detalleAlumno?.curso?.grado ?? 'N/A'}'),
            Text('Turno: ${detalleAlumno?.curso?.turno ?? 'N/A'}'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfesorInfo() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.person, color: Theme.of(context).colorScheme.primary),
            SizedBox(width: 12),
            Text(
              'Profesor del curso: ${detalleAlumno?.profesor?.nombre ?? 'N/A'}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMateriasList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Materias',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        if (detalleAlumno?.materias == null || detalleAlumno!.materias!.isEmpty)
          Text('No hay materias disponibles.')
        else
          ...detalleAlumno!.materias!
              .map((materia) => _buildMateriaCard(materia)),
      ],
    );
  }

  Widget _buildMateriaCard(Materia materia) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              materia.nombre ?? 'Sin nombre',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Horario: ${materia.horario?.nombre ?? 'N/A'}'),
            Text(
                'Aula: ${materia.aula?.nombre ?? 'N/A'} (${materia.aula?.numero ?? 'N/A'})'),
            Text('Profesor: ${materia.profesor?.nombre ?? 'N/A'}'),
          ],
        ),
      ),
    );
  }
}
