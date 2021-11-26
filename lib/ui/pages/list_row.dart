import 'package:albums_bloc_app/model/album_list.dart';
import 'package:albums_bloc_app/ui/pages/txt.dart';
import 'package:flutter/material.dart';

class ListRow extends StatelessWidget {
  //
  final Album album;
  const ListRow({required this.album});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Txt(text: album.title),
          Divider(),
        ],
      ),
    );
  }
}
