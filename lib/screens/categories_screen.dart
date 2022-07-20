import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/models/categories_model.dart';
import 'package:store_api_flutter_course/widgets/category_widget.dart';

import '../services/api_handler.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Categories")),
        body: FutureBuilder<List<CategoriesModel>>(
            future: APIHandler.getAllCategories(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                Center(
                  child: Text("An error occured ${snapshot.error}"),
                );
              } else if (snapshot.data == null) {
                const Center(
                  child: Text("No products has been added yet"),
                );
              }
              return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (ctx, index) {
                    return ChangeNotifierProvider.value(
                        value: snapshot.data![index],
                        child: const CategoryWidget());
                  });
            })));
  }
}
