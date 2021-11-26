import 'package:albums_bloc_app/model/album_list.dart';
import 'package:equatable/equatable.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();
  @override
  List<Object> get props => [];
}

class AlbumsInitState extends AlbumState {}

class AlbumsLoading extends AlbumState {}

class AlbumLoaded extends AlbumState {
  final List<Album> albums;
  const AlbumLoaded({required this.albums});
  @override
  List<Object> get props => [albums];
}

class AlbumListError extends AlbumState {
  final error;
  const AlbumListError({this.error});
  @override
  List<Object> get props => [error];
}
