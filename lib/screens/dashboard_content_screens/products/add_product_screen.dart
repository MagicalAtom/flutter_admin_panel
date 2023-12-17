import 'dart:io';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocogame/bloc/Category/category_bloc.dart';
import 'package:pocogame/bloc/Product/product_bloc.dart';
import 'package:pocogame/config/color.dart';
import 'package:pocogame/magicalUi/magic.dart';
import 'package:pocogame/widgets/CustomText.dart';
import 'package:pocogame/widgets/CustomTextField.dart';
import '../../../functions/selectFile.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  XFile? selectedFile;
  var defualtImagePath = 'assets/images/whitebackground.jpg';

  /*
  set TextField Controller
   */

  TextEditingController nameTextField = TextEditingController();
  TextEditingController DescriptionTextField = TextEditingController();
  TextEditingController priceTextField = TextEditingController();
  TextEditingController quantityTextField = TextEditingController();

  int selectedCategory = 6;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CategoryBloc>().add(CategoryRequestProductEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameTextField.dispose();
    DescriptionTextField.dispose();
    priceTextField.dispose();
    quantityTextField.dispose();
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      child: CustomTextField(
                    controller: nameTextField,
                    prefixIcon: const Icon(Icons.title),
                    title: 'Product Name',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please set name';
                      }
                      return null;
                    },
                  )),
                  const SizedBox(
                    width: 30,
                  ),
                  BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      if (state is CategoryLoadingState) {
                        return const CircularProgressIndicator(
                            color: ColorConfig.main);
                      } else if (state
                          is CategoryRequestResponseForCreatePostState) {
                        return Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, left: 5),
                                child: CustomText(
                                  text: 'Product Category',
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                height: 70,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButton<int>(
                                  alignment: AlignmentDirectional.centerStart,
                                  underline: Container(),
                                  iconSize: 30,
                                  dropdownColor: Colors.white,
                                  value: selectedCategory,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCategory = value!;
                                    });
                                  },
                                  items: state.categoriesList.fold(
                                    (failed) {
                                      return [];
                                    },
                                    (success) {
                                      return success
                                          .map<DropdownMenuItem<int>>(
                                            (item) => DropdownMenuItem<int>(
                                              value: item["id"],
                                              child: Text(item["name"]),
                                            ),
                                          )
                                          .toList();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return const Text('faild load data');
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                        controller: priceTextField,
                        prefixIcon: const Icon(Icons.monetization_on_outlined),
                        title: 'Product Price',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please set price for product';
                          }
                          return null;
                        },
                      )),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: CustomTextField(
                        controller: quantityTextField,
                        prefixIcon: const Icon(Icons.production_quantity_limits),
                        title: 'Product quantity',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please set quantity of product';
                          }
                          return null;
                        },
                      )),

                ],
              ),
              const SizedBox(height: 30,),
              Row(children: [
                Expanded(
                    child: CustomTextField(
                  controller: DescriptionTextField,
                  prefixIcon: const Icon(Icons.article),
                  title: 'Product Description',
                  isBigTextField: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please set Description for product';
                    }
                    return null;
                  },
                )),
              ]),

              const SizedBox(height: 30,),

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
                      context.read<ProductBloc>().add(ProductAddEvent(
                          name: nameTextField.text,
                          price: priceTextField.text,
                          quantity: quantityTextField.text,
                          description: DescriptionTextField.text,
                          category: selectedCategory,
                          thumbnail: selectedFile
                          ));
                      // context.read<PostBloc>().add(PostRequestEvent(Page: 1));
                      CoolAlert.show(
                        context: context,
                        width: 120,
                        type: CoolAlertType.success,
                        text: 'Successfully added a post to the blog',
                        onConfirmBtnTap: (){
                          message(context: context, text: 'Successfully added a post to the blog', style: const TextStyle(color: Colors.white));
                        }
                      );
                      nameTextField.text = '';
                      DescriptionTextField.text = '';
                      quantityTextField.text = '';
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
