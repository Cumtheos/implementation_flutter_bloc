// son acciones que disparamos que recebira el block y cambiara el state



part of 'user_bloc.dart';

//eventos que queremos llamar o esperamos
//si enviamos otros que no estan definidos dara error
//las importaciones se veran en bloc, debido a que se puso part of
@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {

  final User user;
  //constructor posicional, por lo cual debemos enviarle el 
  //order correspondiente
  ActivateUser(this.user);
}

class ChangeUserAge extends UserEvent {
  final int age;
  ChangeUserAge(this.age);
}

class AddProfession extends UserEvent {
  final String profession;

  AddProfession(this.profession);
}

class DeleteUser extends UserEvent {
  
}