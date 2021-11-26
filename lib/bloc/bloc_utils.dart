import 'package:albums_bloc_app/bloc/albums_bloc.dart';
import 'package:albums_bloc_app/bloc/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocUtils {
  static final BlocUtils _singleton = BlocUtils._internal();

  // Use the factory keyword when implementing a constructor that doesn’t always create a new instance of its class
  factory BlocUtils() {
    return _singleton;
  }

  BlocUtils._internal();

  // single point to gather events and send them to Bloc
  void event(BuildContext context, AlbumEvents event) {
    BlocProvider.of<AlbumsBloc>(context).add(event);
  }
}
