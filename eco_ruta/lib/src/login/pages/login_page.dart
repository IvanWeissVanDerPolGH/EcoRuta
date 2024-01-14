import 'package:eco_ruta/src/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void dispose() {
    // Asegúrate de liberar el controlador cuando el widget se elimina
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _buildBackgroud(),
            _buildForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return SafeArea(
      child: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: _titulo(),
                  ),
                  _loginForm(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          CustomTextField(
            label: 'Correo Electronico',
            controller: _userController,
            onChanged: (value) {
              print(value);
            },
          ),
          const SizedBox(height: 8),
          CustomTextField(
            label: 'Contraseña',
            controller: _passController,
            onChanged: (value) {
              print(value);
            },
          ),
          const SizedBox(height: 16),
          CustomButton(
            label: 'Iniciar Sesion',
            onPresed: () {
              print('Iniciar Sesion');
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Aun no tienes cuenta?"),
              CustomTextButton(
                label: 'Registrate',
                onPresed: () {
                  print("Registrate clickeado");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding _titulo() {
    return Padding(
      padding: const EdgeInsets.only(top: 64, left: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bienvenido",
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 40,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Inicia sesion para continuar",
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroud() {
    return Positioned(
      top: -450,
      left: -250,
      child: Container(
        width: MediaQuery.of(context).size.width * 2,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 236, 182, 22), Color.fromARGB(255, 255, 136, 0)], // Colores del degradado
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String label;
  final Function() onPresed;
  const CustomTextButton({
    super.key,
    required this.label,
    required this.onPresed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPresed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          // Configura el color de superposición como transparente para desactivar el efecto de clic
          return Colors.transparent;
        }),
      ),
      child: Text(label),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onPresed;
  const CustomButton({
    super.key,
    required this.label,
    required this.onPresed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color.fromARGB(255, 236, 182, 22), Color.fromARGB(255, 255, 136, 0)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
      ),
      child: ElevatedButton(
        onPressed: onPresed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            // Configura el color de superposición como transparente para desactivar el efecto de clic
            return Colors.transparent;
          }),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(8), // Establece el radio de las esquinas a 0
          ),
        ),
        labelText: label ?? 'Ingrese',
      ),
    );
  }
}
