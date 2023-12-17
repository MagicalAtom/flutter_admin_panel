import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocogame/bloc/Category/category_bloc.dart';
import 'package:pocogame/di/admin/di.dart';
import 'package:pocogame/screens/dashboard_content_screens/categories/show_category_screen.dart';
import 'package:pocogame/widgets/CustomButton.dart';
import 'add_Category_screen.dart';
import 'Category_screen_section.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(CategoryRequestEvent(Page: 1));
  }

  CategoryScreenSection section = CategoryScreenSection.show;
  CategoryScreenSection create = CategoryScreenSection.create;
  CategoryScreenSection show = CategoryScreenSection.show;
  CategoryScreenSection edit = CategoryScreenSection.edit;
  String ButtonText = "Add Category";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomButton(
            onTap: () {
              section = section == show ? create : show;
              ButtonText = section == show ? 'Add Category' : 'Show Category';
              context.read<CategoryBloc>().add(CategoryRequestEvent(Page: 1));

              setState(() {});
              if(section == show){
                context.read<CategoryBloc>().add(CategoryRequestEvent(Page: 1));
              }
            },
            icon: Icons.add,
            text: ButtonText,
          ),
          const SizedBox(
            height: 30,
          ),
          section == show
              ? ShowCategoryScreen()
              : BlocProvider.value(
                  value: ServiceLocator.get<CategoryBloc>(),
                  child: AddCategoryScreen(),
                )
        ],
      ),
    );
  }
}
