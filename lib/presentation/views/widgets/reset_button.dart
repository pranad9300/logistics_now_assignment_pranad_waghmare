import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/game_bloc.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Restart Game"),
          content: Text("Are you sure you want to reset the game?"),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("Cancel")),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                context
                    .read<GameBloc>()
                    .add(ResetGameEvent()); // Dispatch reset event
              },
              child: Text("Reset"),
            ),
          ],
        ),
      ),
      child: Icon(Icons.refresh),
    );
  }
}
