import 'package:estados/bloc/user/user_bloc.dart';
import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Pagina2Page extends StatelessWidget {
  
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc =  BlocProvider.of<UserBloc>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              child: const Text('Establecer Usuario', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                final newUser = User( 
                  nombre: 'Juan Larenas',
                  edad: 36,
                  profesiones: [ 'FullStack Developer']
                );
                //listen en false en funciones,muchas veces esta demas ya que es opcional
                //por medio de un evento se cambia el valor usando add()
                // BlocProvider.of<UserBloc>(context, listen: false)
                
                userBloc.add( ActivateUser(newUser));
              }
            ),

            MaterialButton(
              child: const Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                userBloc.add( ChangeUserAge(25));

              }
            ),

            MaterialButton(
              child: const Text('Añadir Profesion', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                  userBloc.add( AddProfession('1'));
              }
            ),

          ],
        )
     ),
   );
  }
}