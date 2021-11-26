import 'package:equatable/equatable.dart';

abstract class AlbumEvents extends Equatable {
  const AlbumEvents();
}

class FetchAlbums extends AlbumEvents {
  @override
  List<Object?> get props => [];
}
