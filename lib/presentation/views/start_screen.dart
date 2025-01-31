import 'package:flutter/material.dart';
import '../../app_routes.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
  });

  void strtGame(BuildContext context) =>
      Navigator.pushNamed(context, AppRoutes.gameScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tic Tac Toe",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => strtGame(context),
              child: Text("Start Game"),
            ),
          ],
        ),
      ),
    );
  }
}
