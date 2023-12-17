import 'dart:io';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocogame/bloc/Category/category_bloc.dart';
import 'package:pocogame/config/color.dart';
import 'package:pocogame/magicalUi/magic.dart';
import 'package:pocogame/widgets/CustomText.dart';
import 'package:pocogame/widgets/CustomTextField.dart';
import '../../../functions/selectFile.dart';

class AddCategoryScreen extends StatefulWidget {
  AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final _formKey = GlobalKey<FormState>();
  XFile? selectedFile;
  var defualtImagePath = 'assets/images/whitebackground.jpg';

  /*
  set TextField Controller
   */

  TextEditingController titleTextField = TextEditingController();
  TextEditingController DescriptionTextField = TextEditingController();
  TextEditingController DateTextField = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleTextField.dispose();
    DescriptionTextField.dispose();
    DateTextField.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorConfig.main,
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    controller: titleTextField,
                    prefixIcon: const Icon(Icons.title),
                    title: 'Category Title',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please set title';
                      }
                      return null;
                    },
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        selectedFile = await pickImageFromGallery();
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        height: 130,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: selectedFile != null
                                  ? CustomFileImage(File(selectedFile!.path))
                                      .imageProvider
                                  : const AssetImage(
                                      'assets/images/whitebackground.jpg'),
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.upload,
                              size: 25,
                              color: Colors.grey,
                            ),
                            const Spacer(),
                            Center(
                              child: CustomText(
                                text: 'Upload Thumbnail',
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<CategoryBloc>().add(CategoryAddEvent(
                          title: titleTextField.text, thumbnail: selectedFile));
                      context
                          .read<CategoryBloc>()
                          .add(CategoryRequestEvent(Page: 1));
                      CoolAlert.show(
                          context: context,
                          width: 120,
                          type: CoolAlertType.success,
                          text: 'Successfully added a Category to the blog',
                          onConfirmBtnTap: () {
                            message(
                                context: context,
                                text:
                                    'Successfully added a Category to the shop',
                                style: const TextStyle(color: Colors.white));
                          });
                      titleTextField.text = '';
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(180, 55)),
                  child: CustomText(
                    text: 'Submit',
                  ))
            ],
          ),
        ));
  }
}
