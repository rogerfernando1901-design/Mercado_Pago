import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'LoginBlocCubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBlocCubit? _loginBlocCubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _loginBlocCubit = BlocProvider.of<LoginBlocCubit>(context, listen: false);

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/img/background2.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.3),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.person, color: Colors.white, size: 125),
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: StreamBuilder(
                      stream: _loginBlocCubit?.emailStream,
                      builder: (context, asyncSnapshot) {
                        return DefaultTextField(
                          label: 'Correo electrónico',
                          icon: Icons.email,
                          onChanged: (text) {
                            _loginBlocCubit?.changeEmail(
                              text,
                            ); // Handle text change
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: StreamBuilder(
                      stream: _loginBlocCubit?.passwordStream,
                      builder: (context, asyncSnapshot) {
                        return DefaultTextField(
                          label: 'Contraseña',
                          icon: Icons.lock,
                          onChanged: (text) {
                            _loginBlocCubit?.changePassword(
                              text,
                            ); // Handle text change
                          },
                          obscureText: true, // Hide the text for password
                        );
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    margin: EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 25,
                      bottom: 15,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        _loginBlocCubit?.login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text(
                        'INICIAR SESION',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, //Horizontal
                    children: [
                      Container(
                        width: 62,
                        height: 1,
                        color: Colors.white,
                        margin: EdgeInsets.only(right: 5),
                      ),
                      Text(
                        '¿No tienes cuenta?',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      Container(
                        width: 62,
                        height: 1,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 5),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'register');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: Text(
                        'REGISTRATE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
