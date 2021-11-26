import 'dart:io';

import 'package:albums_bloc_app/bloc/events.dart';
import 'package:albums_bloc_app/bloc/states.dart';
import 'package:albums_bloc_app/model/album_list.dart';
import 'package:albums_bloc_app/services/services_albums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';

class AlbumsBloc extends Bloc<AlbumEvents, AlbumState> {
  late final AlbumsRepo albumsRepo;
  List<Album> albums = [];
  AlbumsBloc({required this.albumsRepo}) : super(AlbumsInitState());

  @override
  Stream<AlbumState> mapEventToState(AlbumEvents event) async* {
    if (event is FetchAlbums) {
      yield AlbumsLoading();
      try {
        albums = await albumsRepo.getAlbumList();
        yield AlbumLoaded(albums: albums);
      } on SocketException {
        yield const AlbumListError(
            error: "No se encontro conexcion a internet");
      } on HttpException {
        yield const AlbumListError(error: "No se encontro el servicio");
      } on FormatException {
        yield const AlbumListError(error: "Respuesta en formato invalido");
      } catch (e) {
        yield const AlbumListError(error: "Error desconocido");
      }
    }
  }
}
