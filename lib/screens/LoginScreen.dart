import 'package:academic_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isRememberMeChecked = false;
  bool _isLoading = false;

  Future<void> _toggleRememberMe(bool? value) async {
    setState(() {
      _isRememberMeChecked = value ?? false;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRememberMe', _isRememberMeChecked);
  }

  Future<void> _login() async {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      try {
        await AuthService().login(
          email: _emailController.text,
          password: _passwordController.text,
        );
        Navigator.of(context).pushReplacementNamed('/home');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: Usuario o contraseña incorrectos.')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor ingrese su correo y contraseña.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo de la app
                    Container(
                      height: 170,
                      child: Image.asset(
                        'assets/images/logo.png', // Asegúrate de agregar el logo a tu carpeta de assets
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Iniciar Sesión',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent[700],
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40.0),
                    // Campo de correo electrónico
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Correo Electrónico',
                        labelStyle: TextStyle(color: Colors.blueAccent[400]),
                        prefixIcon: Icon(Icons.email, color: Colors.blueAccent),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent[700]!),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20.0),
                    // Campo de contraseña
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(color: Colors.blueAccent[400]),
                        prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent[700]!),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20.0),
                    // Checkbox y botón "Olvidé mi contraseña"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _isRememberMeChecked,
                              onChanged: _toggleRememberMe,
                              activeColor: Colors.blueAccent,
                            ),
                            Text('Recordarme',
                                style: TextStyle(color: Colors.blueAccent)),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // Agrega la funcionalidad de "Olvidé mi contraseña"
                          },
                          child: Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(color: Colors.blueAccent[700]),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    // Botón de inicio de sesión
                    ElevatedButton(
                      onPressed: _isLoading ? null : _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        'Ingresar',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Indicador de carga
          if (_isLoading)
            Container(
              color: Colors.black54,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
