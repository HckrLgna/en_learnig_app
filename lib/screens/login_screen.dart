import 'package:en_learn/providers/providers.dart';
import 'package:en_learn/services/services.dart';
import 'package:en_learn/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),
                CardContainer(
                    child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text("Bienvenido", style: TextStyle(color: Color.fromRGBO(0, 102, 129, 1), fontWeight: FontWeight.bold, fontSize: 32),),
                    const SizedBox(height: 5,),
                    const Text("Ingresa tus datos", style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4), fontWeight: FontWeight.w600, fontSize: 16),),
                    const SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: const _LoginForm(),
                    )
              ],
            )),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'register'),
              style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(const Color.fromRGBO(7, 67, 83, 0.9)),
                      shape: MaterialStateProperty.all(const StadiumBorder())
                  ),
              child: const Text('Olvide mi contraseña',
                  style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4), fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 50)
          ],
        ),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
          //TODO: mantener el key
          key: LoginForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Jhon@correo.com',
                  labelText: 'Correo electronico',
                  //prefixIcon: Icons.alternate_email_rounded ,
                ),
                onChanged: (value) => LoginForm.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(pattern);
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'Ingrese un correo valido ';
                },
              ),
              const SizedBox(height: 30,),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: '**************',
                  labelText: 'Password',
                  //prefixIcon: Icons.lock_outline_rounded
                ),
                onChanged: (value) => LoginForm.password = value,
                validator: (value) {
                  if (value != null && value.length >= 6) return null;
                  return 'la contraseña debe ser mayor a 6 caracteres';
                },
              ),
              const SizedBox(height: 30),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: const Color.fromRGBO(7, 67, 83, 0.9),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                      LoginForm.isLoading ? 'Espere...' : 'Ingresar',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                onPressed: LoginForm.isLoading
                    ? null
                    : () async {
                        //TODO: login form
                        FocusScope.of(context).unfocus();
                        //final authService = Provider.of<AuthService>(context, listen: false);
                        if (!LoginForm.isValidForm()) return;
                        LoginForm.isLoading = true;
                        // final String? errorMessage =  await authService.login(LoginForm.email,LoginForm.password);
                        final String? errorMessage = null;
                        if (errorMessage == null) {
                          Navigator.pushReplacementNamed(context, 'home');
                        } else {
                          print(errorMessage);
                          NotificationsService.showSnackBar(errorMessage);
                          await Future.delayed(Duration(seconds: 2));
                          LoginForm.isLoading = false;
                        }
                      },
              )
            ],
          )),
    );
  }
}
