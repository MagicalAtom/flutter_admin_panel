import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:pocogame/bloc/Post/post_bloc.dart';
import 'package:pocogame/config/color.dart';
import 'package:pocogame/functions/navigation.dart';
import 'package:pocogame/magicalUi/components/snack_bar.dart';
import 'package:pocogame/widgets/CustomText.dart';
import 'package:pocogame/widgets/CustomTextField.dart';

import '../../../data/models/Posts.dart';

class EditPostScreen extends StatelessWidget {
  EditPostScreen({super.key, required this.post});

  Post post;

  @override
  Widget build(BuildContext context) {
    TextEditingController titleTextField =
    TextEditingController(text: post.title);
    TextEditingController DateTextField =
    TextEditingController(text: post.date);
    TextEditingController DescriptionTextField =
    TextEditingController(text: post.text);

    return Scaffold(
      backgroundColor: ColorConfig.second,
      body: Container(

        margin: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Edit Text',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            EditTextField(
                controller: titleTextField,
                prefixIconField: const Icon(Icons.title),
                text: 'title'),
            const SizedBox(
              height: 20,
            ),
            EditTextField(
                controller: DateTextField,
                prefixIconField: const Icon(Icons.date_range),
                text: 'date'),
            const SizedBox(
              height: 20,
            ),
            EditTextField(
              controller: DescriptionTextField,
              prefixIconField: const Icon(Icons.article),
              text: 'Description',
              bigTextField: true,
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {
                    back(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blue, width: 3),
                    padding: const EdgeInsets.all(17),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<PostBloc>().add(PostUpdateEvent(
                        title: titleTextField.text,
                        text: DescriptionTextField.text,
                        date: DateTextField.text,
                        id: post.id
                    ));
                    context.read<PostBloc>().add(PostRequestEvent(Page: 1));
                    message(context: context, text: 'Post updated', style: const TextStyle(color: Colors.white));
                    back(context);

                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.all(18)
                  ),
                  child: const Text(
                    'Send',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class EditTextField extends StatelessWidget {
  EditTextField({super.key,
    required this.controller,
    required this.prefixIconField,
    this.bigTextField = false,
    required this.text});

  TextEditingController controller;
  Icon prefixIconField;
  bool bigTextField;
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: CustomText(
            text: text,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            height: bigTextField ? 240 : 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              maxLines: bigTextField ? 1000 : 1,
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  prefixIcon: prefixIconField,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 23, horizontal: 14)),
            ))
      ],
    );
  }
}
