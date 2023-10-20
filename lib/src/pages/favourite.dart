import "package:compendio/src/pages/base.dart";
import "package:flutter/material.dart";

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      title: "Избранное",
      body: Text("FAVOURITE"),
    );
  }
}
