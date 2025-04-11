import 'package:flutter/material.dart';
import 'package:project_ui/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  late String userRole;
  String _errorMessage = '';

  // Hardcoded user credentials
  final Map<String, String> _users = {
    'admin': 'admin',
    'superadmin': 'superadmin',
  };

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (_users.containsKey(username) && _users[username] == password) {
      userRole = username;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            userRole: userRole,
          ),
        ),
      );
    } else {
      setState(() {
        _errorMessage = 'Incorrect credentials';
        _usernameController.clear();
        _passwordController.clear();
        FocusScope.of(context).requestFocus(_usernameFocus);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AutomatED Portal Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 700,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _usernameController,
                    focusNode: _usernameFocus,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(_passwordFocus);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: 700,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    onEditingComplete: _login,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Login'),
              ),
              const SizedBox(height: 10.0),
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
