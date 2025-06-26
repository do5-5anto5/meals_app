import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            category.color.withAlpha(185),
            category.color.withAlpha(225),
          ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
          )
      ),
      child: Text(category.title, style: Theme
          .of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: Theme.of(context).colorScheme.onSurface)),
    );
  }
}
