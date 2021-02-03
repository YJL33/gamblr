import 'package:flutter/material.dart';
import 'package:gamblr/firebase/user_repository.dart';

class LoginPage extends StatelessWidget {
  final UserRepository _userRepository;

  LoginPage({UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    String _usr = 'unknown';
    _userRepository.getUser().then((String usr) {
      _usr = usr;
    });
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: Text('now signed in as...'),
            onPressed: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                backgroundColor: Colors.blue,
                title: Text('User:'),
                content: Text('$_usr'),
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Login with Google'),
            onPressed: () => _userRepository.signInWithGoogle(),
          ),
          ElevatedButton(
            child: Text('Sign out'),
            onPressed: () => _userRepository.signOut(),
          )
        ],
      ),
    );
  }
}
