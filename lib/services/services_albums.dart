import 'package:albums_bloc_app/model/album_list.dart';
import 'package:http/http.dart' as http;

abstract class AlbumsRepo {
  Future<List<Album>> getAlbumList();
}

class AlbumServices implements AlbumsRepo {
  static const _baseUrl = 'jsonplaceholder.typicode.com';
  static const String _GetAlbums = '/albums';

  @override
  Future<List<Album>> getAlbumList() async {
    Uri uri = Uri.http(_baseUrl, _GetAlbums);
    http.Response response = await http.get(uri);
    List<Album> albums = albumFromJson(response.body);
    return albums;
  }
}
