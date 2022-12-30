// estado de la app, usuario logeado, prodctos en carritos de compras
//diferentes estados
//sirve para crear otras clases que si cambiaran la clase
part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existUser;
  final User? user;

  //constructor por nombre
  const UserState({
    this.existUser = false, 
    this.user
    });
}


class UserInitialState extends UserState {
  const UserInitialState(): super(existUser: false, user: null);
}

class UserSetState extends UserState {
  final User newUser;
  // const ya que no cambiara desde el momento de su creación
  // se llama al padre para que inicialize el user
  const UserSetState(this.newUser)
  : super(existUser: true, user: newUser);

}