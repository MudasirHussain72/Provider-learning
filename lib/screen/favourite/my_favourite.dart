import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/providers/favourite_provider.dart';
import 'package:provider/provider.dart';

class MyFavouriteSxreen extends StatefulWidget {
  const MyFavouriteSxreen({super.key});

  @override
  State<MyFavouriteSxreen> createState() => _MyFavouriteSxreenState();
}

class _MyFavouriteSxreenState extends State<MyFavouriteSxreen> {
  @override
  Widget build(BuildContext context) {
    print("build");
    final myFavouriteItems =
        Provider.of<FavouriteItemProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorites"),
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
          itemCount: myFavouriteItems.selectedItem.length,
          itemBuilder: (context, index) {
            return Consumer<FavouriteItemProvider>(
              builder: (context, value, child) => ListTile(
                onTap: () {
                  if (value.selectedItem.contains(index)) {
                    value.removeItems(index);
                  } else {
                    value.addItems(index);
                  }
                  print("only this widget build");
                },
                title: Text("Item" + index.toString()),
                trailing: Icon(value.selectedItem.contains(index)
                    ? Icons.favorite
                    : Icons.favorite_border_outlined),
              ),
            );
          },
        ))
      ]),
    );
  }
}
