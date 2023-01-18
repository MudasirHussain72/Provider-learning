import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/providers/favourite_provider.dart';
import 'package:mvvm_with_provider/screen/favourite/my_favourite.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    // final favouriteProvider =
    // Provider.of<FavouriteItemProvider>(context, listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Add to Favorites"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return MyFavouriteSxreen();
                  },
                ));
              },
              icon: Icon(Icons.favorite))
        ],
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: 100,
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
          ),
        )
      ]),
    );
  }
}
