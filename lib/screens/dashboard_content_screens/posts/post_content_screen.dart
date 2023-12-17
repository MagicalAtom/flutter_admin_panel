import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocogame/bloc/Post/post_bloc.dart';
import 'package:pocogame/di/admin/di.dart';
import 'package:pocogame/widgets/CustomButton.dart';
import 'package:pocogame/widgets/CustomText.dart';
import 'add_post_screen.dart';
import 'post_screen_section.dart';
import 'show_post_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostRequestEvent(Page: 1));
  }

  PostScreenSection section = PostScreenSection.show;
  PostScreenSection create = PostScreenSection.create;
  PostScreenSection show = PostScreenSection.show;
  PostScreenSection edit = PostScreenSection.edit;
  String ButtonText = "Add Post";

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
              ButtonText = section == show ? 'Add Post' : 'Show Post';
              context.read<PostBloc>().add(PostRequestEvent(Page: 1));

              setState(() {});
              if(section == show){
                context.read<PostBloc>().add(PostRequestEvent(Page: 1));
              }
            },
            icon: Icons.add,
            text: ButtonText,
          ),
          const SizedBox(
            height: 30,
          ),
          section == show
              ? ShowPostScreen()
              : BlocProvider.value(
                  value: ServiceLocator.get<PostBloc>(),
                  child: AddPostScreen(),
                )
        ],
      ),
    );
  }
}
