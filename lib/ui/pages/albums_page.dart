import 'package:albums_bloc_app/bloc/albums_bloc.dart';
import 'package:albums_bloc_app/bloc/bloc_utils.dart';
import 'package:albums_bloc_app/bloc/states.dart';
import 'package:albums_bloc_app/model/album_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:albums_bloc_app/bloc/events.dart';
import 'package:flutter/material.dart';

import 'error.dart';
import 'list_row.dart';
import 'loading.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumsScreen> {
  @override
  void initState() {
    super.initState();
    _loadAlbums();
  }

  _loadAlbums() async {
    BlocUtils().event(context, FetchAlbums());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Albums'),
        ),
        body: Container(child: _body()));
  }

  _body() {
    return Column(children: [
      BlocBuilder<AlbumsBloc, AlbumState>(
          builder: (BuildContext context, AlbumState state) {
        if (state is AlbumListError) {
          final error = state.error;
          String message = '${error.message}\n Intente de nuevo';
          return ErrorTxt(message: message, onTap: _loadAlbums());
        }
        if (state is AlbumLoaded) {
          List<Album> albums = state.albums;
          return _list(albums);
        }
        return Loading();
      })
    ]);
  }

  Widget _list(List<Album> albums) {
    return Expanded(
      child: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (_, index) {
          Album album = albums[index];
          return ListRow(album: album);
        },
      ),
    );
  }
}
