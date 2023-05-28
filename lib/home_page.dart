
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/note_bloc.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState(){
    super.initState();
  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    context.read<NoteBloc>().add(NoteNetworkEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( centerTitle: true,
        title: Text("Notes"),
      ),

      body:  BlocBuilder<NoteBloc, NoteState>(builder: (_, state) {
        return GridView.builder(
          itemCount: state.list.length,
          padding: const EdgeInsets.all(5),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                Positioned(
                  child: Image.network(
                    state.list[index].url ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 5,
                    child: Text(
                      state.list[index].title ?? "",
                      style: const TextStyle(fontSize: 6),
                    )),
              ],
            );
          },
        );
      }),
    );
  }
}
