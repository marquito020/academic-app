import 'package:flutter/material.dart';
import 'package:academic_app/model/comunicadoModel.dart';
import 'package:academic_app/services/comunicado_service.dart';
import 'package:url_launcher/url_launcher.dart';

class ComunicadosScreen extends StatefulWidget {
  @override
  _ComunicadosScreenState createState() => _ComunicadosScreenState();
}

class _ComunicadosScreenState extends State<ComunicadosScreen> {
  ComunicadoService comunicadoService = ComunicadoService();
  List<ComunicadoModel> comunicados = [];
  bool isLoading = true;
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    _fetchComunicados(); // Cargar comunicados al iniciar
  }

  Future<void> _fetchComunicados() async {
    try {
      comunicados = (await comunicadoService.getComunicados())!;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar los comunicados')),
        );
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _refreshComunicados() async {
    await _fetchComunicados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comunicados',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: _refreshComunicados,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    itemCount: comunicados.length,
                    itemBuilder: (context, index) {
                      final comunicado = comunicados[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.blueAccent,
                                    child: Icon(Icons.announcement,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      comunicado.titulo,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                comunicado.descripcion,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                              // Enlace puede ser bool
                              if (comunicado.enlace is String &&
                                  comunicado.enlace!.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: GestureDetector(
                                    onTap: () async {
                                      // final url = comunicado.enlace!;
                                      // if (await canLaunch(url)) {
                                      //   await launch(url);
                                      // } else {
                                      //   ScaffoldMessenger.of(context)
                                      //       .showSnackBar(
                                      //     SnackBar(
                                      //       content: Text(
                                      //           'No se puede abrir el enlace'),
                                      //     ),
                                      //   );
                                      // }
                                    },
                                    child: const Text(
                                      'Ver más',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ),
                              if (comunicado.archivo_nombre != null &&
                                  comunicado.archivo_nombre!.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    'Archivo: ${comunicado.archivo_nombre}',
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              const Divider(
                                  height: 20,
                                  color: Colors.grey,
                                  thickness: 0.5),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.more_vert,
                                      color: Colors.blueAccent),
                                  onPressed: () => _showActionsBottomSheet(
                                      context, comunicado),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
          if (isProcessing)
            Container(
              color: Colors.black54,
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  void _showActionsBottomSheet(
      BuildContext context, ComunicadoModel comunicado) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.visibility, color: Colors.blueAccent),
              title: const Text('Ver Detalle'),
              onTap: () {
                Navigator.pop(context);
                // Agregar acción para ver detalles del comunicado
              },
            ),
            ListTile(
              leading: const Icon(Icons.download, color: Colors.green),
              title: const Text('Descargar Archivo'),
              onTap: () {
                Navigator.pop(context);
                _downloadFile(comunicado.archivo_nombre);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _downloadFile(String? fileName) async {
    if (fileName == null || fileName.isEmpty) return;
    setState(() {
      isProcessing = true;
    });
    try {
      // Implementar la lógica de descarga
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Descargando $fileName...')));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error en la descarga')));
    } finally {
      if (mounted) {
        setState(() {
          isProcessing = false;
        });
      }
    }
  }
}
