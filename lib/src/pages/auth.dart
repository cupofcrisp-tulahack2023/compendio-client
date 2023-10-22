import "package:compendio/src/pages/my_groups.dart";
import "package:flutter/material.dart";

enum AuthMode { signIn, signUp }

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _State();
}

class _State extends State<AuthPage> {
  AuthMode _selected = AuthMode.signIn;
  String _email = "";
  String _password = "";
  String _repeat = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(60),
          child: Column(
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                transformAlignment: Alignment.center,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/logo.png",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Compendio"),
              SegmentedButton<AuthMode>(
                segments: const <ButtonSegment<AuthMode>>[
                  ButtonSegment(
                    value: AuthMode.signIn,
                    label: Text("Вход"),
                  ),
                  ButtonSegment(
                    value: AuthMode.signUp,
                    label: Text("Регистрация"),
                  ),
                ],
                selected: <AuthMode>{_selected},
                onSelectionChanged: (e) {
                  setState(() {
                    _selected = e.first;
                  });
                },
                showSelectedIcon: false,
              ),
              SingleChildScrollView(
                child: _selected == AuthMode.signIn
                    ? Column(
                        children: <Widget>[
                          TextField(
                            decoration: const InputDecoration(
                              label: Text("Почта"),
                            ),
                            onChanged: (e) {
                              setState(() {
                                _email = e;
                              });
                            },
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              label: Text("Пароль"),
                            ),
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            onChanged: (e) {
                              setState(() {
                                _password = e;
                              });
                            },
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyGroupsPage(),
                                ),
                              );
                            },
                            child: const Text("Войти"),
                          ),
                        ],
                      )
                    : Column(
                        children: <Widget>[
                          TextField(
                            decoration: const InputDecoration(
                              label: Text("Почта"),
                            ),
                            onChanged: (e) {
                              setState(() {
                                _email = e;
                              });
                            },
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              label: Text("Пароль"),
                            ),
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            onChanged: (e) {
                              setState(() {
                                _password = e;
                              });
                            },
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              label: Text("Повторите пароль"),
                            ),
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            onChanged: (e) {
                              setState(() {
                                _repeat = e;
                              });
                            },
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Регистрация"),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
