
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
        title: Text("Albom"),
      ),

      body:  BlocBuilder<NoteBloc, NoteState>(builder: (_, state) {
        return ListView.builder(
          itemCount: state.list.length,
          padding: const EdgeInsets.all(5),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Text((state.list[index].id).toString(), style: TextStyle(fontSize: 20),),
               title: Text(
                state.list[index].title ?? "",
                style: const TextStyle(fontSize: 20),
              ),
            );
          },
        );
      }),
    );
  }
}
