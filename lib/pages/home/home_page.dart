import 'package:flutter/material.dart';

import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';
import 'components/most_popular_section.dart';
import 'components/recommended_section.dart';

class HomePage extends StatelessWidget {
  static const id = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ECMAppBar(title: 'Zero To Unicorn'),
      ),
      bottomNavigationBar: const ECMBottomAppBar(),
      body: ListView(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (ctx, state) {
              final CategoryStatus status = state.status;

              if (status == CategoryStatus.initial) {
                return const SizedBox.shrink();
              }

              if (status == CategoryStatus.loading) {
                return const SizedBox(
                  height: 300,
                  child: ECMLoading(),
                );
              }

              if (status == CategoryStatus.error) {
                return const SizedBox(
                  height: 300,
                  child: ECMErrorMessage(),
                );
              }

              final categories = state.categories;

              return ECMHeroCarouselCategories(categories: categories);
            },
          ),
          const RecommendedSection(),
          const SizedBox(height: 10),
          const MostPopularSection(),
        ],
      ),
    );
  }
}
