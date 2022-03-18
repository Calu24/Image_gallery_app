import 'package:flutter/material.dart';
import 'package:image_gallery_app/src/widgets/list_page/item_detail.dart';

import '../../services/unsplash_api.dart';
import 'package:image_gallery_app/src/models/photo_model.dart';
import 'package:image_gallery_app/src/widgets/list_page/item.dart';

// ignore: use_key_in_widget_constructors
class ListPage extends StatefulWidget {
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final ScrollController _scrollController = ScrollController();

  final List<PhotoModel> _listItems = [];

  final getPhotos = UnsplashService().getPhotos();

  @override
  void initState() {
    super.initState();
    _add10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _add10();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: RefreshIndicator(
        onRefresh: _getPage,
        child: ListView.builder(
            controller: _scrollController,
            itemCount: _listItems.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 15, 50),
                    child: ListTile(
                      title: Column(
                        children: [
                          ItemDetail(
                              likes: _listItems[index].likes ?? 0,
                              firstName: _listItems[index].user?.firstName ?? '-',
                              lastName: _listItems[index].user?.lastName ?? '-',
                              userUrlImg: _listItems[index].user?.profileImage?.medium),
                          const SizedBox(height: 20),
                          Item(
                              urlImage: _listItems[index].urls.full,
                            ),
                        ],
                      ),
                    ),
                  );
            }),
      ),
    );
  }

  Future<void> _add10() async {
    final items = await getPhotos;

    _listItems.addAll(items);

    setState(() {});
  }

  Future<void> _getPage() async {
    _listItems.clear();
    _add10();
  }
}
