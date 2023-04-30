import 'package:flutter/material.dart';
import 'guardarlista.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.blue,
          Colors.red,
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            const SizedBox(height: 50),
            _inputField("username", usernameController),
            const SizedBox(height: 20),
            _inputField("password", passwordController, isPasswowrd: true),
            const SizedBox(height: 50),
            _loginBtn(),
            const SizedBox(height: 20),
            _extraText(),
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://play-lh.googleusercontent.com/-uScmz-qtagHb074sElxtAhyiDNN6YO-hD9UTaqwGgOOM2G5nIyxsuB_uxNQ-N0-bTU=w240-h480-rw"),
              fit: BoxFit.cover),
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle),
      child: const Icon(
        Icons.person,
        color: Colors.transparent,
        size: 130,
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPasswowrd = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.white));
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPasswowrd,
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Nombre: " + usernameController.text);
        debugPrint("password: " + passwordController.text);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => guardarlista()));
      },
      child: const SizedBox(
          width: double.infinity,
          child: Text(
            "Entrar ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )),
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.white,
          onPrimary: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 16)),
    );
  }

  Widget _extraText() {
    return const Text(
      "no se puede acceder a la cuenta?",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, color: Colors.white),
    );
  }
}
