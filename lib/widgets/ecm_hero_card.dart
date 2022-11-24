import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/models.dart';
import '../pages/pages.dart';

class ECMHeroCard extends StatelessWidget {
  const ECMHeroCard({
    super.key,
    this.category,
    this.product,
  });

  final Category? category;
  final Product? product;

  void _onTap(BuildContext ctx) => Navigator.pushNamed(
        ctx,
        category != null ? CatalogPage.id : ProductPage.id,
        arguments: category ?? product,
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(context),
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 20,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl:
                    category != null ? category!.imageUrl : product!.imageUrl,
                fit: BoxFit.cover,
                width: 1000,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                    ),
                  ),
                  child: Text(
                    category != null ? category!.name : '',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
