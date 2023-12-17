import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocogame/bloc/Category/category_bloc.dart';
import 'package:pocogame/data/models/Category.dart';
import 'package:pocogame/di/admin/di.dart';
import 'package:pocogame/magicalUi/components/CustomDialog.dart';
import 'package:pocogame/magicalUi/components/snack_bar.dart';
import 'package:pocogame/screens/dashboard_content_screens/categories/edit_category_screen.dart';
import '../../../config/shadow.dart';
import '../../../magicalUi/responsive/size.dart';
import '../../../widgets/CustomText.dart';

class ShowCategoryScreen extends StatefulWidget {
  ShowCategoryScreen({super.key});


  @override
  State<ShowCategoryScreen> createState() => _ShowCategoryScreenState();
}

class _ShowCategoryScreenState extends State<ShowCategoryScreen> {
  int? CategoryLenght;
  int PageCounter = 1;
  int? PageCount;
  @override
  Widget build(BuildContext context) {

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                height: 500,
                width: width(context) - 500,
                decoration: BoxDecoration(
                    boxShadow: [boxShadow],
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: SingleChildScrollView(
                  child: BlocBuilder<CategoryBloc,CategoryState>(

                    builder: (context,state) {
                      if(state is CategoryLoadingState){
                        return const  CircularProgressIndicator();
                      }else if(state is CategoryRequestResponseState){
                        return state.categoryList.fold((faildLoadData) => Text('داده های برنامه در دسترس نیست'),
                        (successLoadData){
                          return  DataTable(
                              columnSpacing: 30,
                              columns: [
                                DataColumn(
                                    label: CustomText(
                                      text: 'Category id',
                                    )),
                                DataColumn(
                                    label: CustomText(
                                      text: 'Category Name',
                                    )),

                                DataColumn(
                                    label: CustomText(
                                      text: 'actions',
                                    )),
                              ],
                              rows: List.generate(successLoadData.length, (index) {
                                  CategoryLenght = successLoadData.length;
                                  PageCount = successLoadData[1].pageCount;
                                return DataRow(cells: [
                                  DataCell(Text(successLoadData[index].id)),
                                  DataCell(Text(successLoadData[index].title)),
                                  DataCell(Row(
                                    children: [
                                      deleteButton(successLoadData[index], context),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                    editButton(successLoadData[index],context)
                                    ],
                                  )),
                                ]);
                              }));
                        });
                      }
                      context.read<CategoryBloc>().add(CategoryRequestEvent(Page: 1));
                      return const CircularProgressIndicator();
                    }
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: width(context) - 500,
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    )),
                child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              PageCounter =   PageCounter < 1 ? 1 : PageCounter -1;
                              context.read<CategoryBloc>().add(CategoryRequestEvent(Page: PageCounter));
                            },
                            icon: const Icon(
                              Icons.chevron_left,
                              color: Colors.black,
                              size: 31,
                            )),

                        const SizedBox(
                          width: 120,
                        ),
                        IconButton(
                            onPressed: () {
                            PageCounter =   PageCounter < PageCount! ? PageCounter + 1 : 1;
                            /*
                            تعداد صفحات هر رکورد رو داخل شمارنده صفحه نگهداری کردم
                            گفتم اگه تعداد صفحه ای که کاربر درخواست کرده کمتر از تعداد کل صفحات است
                            بیا یکی اضافه کن درغیر این صورت برگرد دوباره صفحه اول
                             */
                              context.read<CategoryBloc>().add(CategoryRequestEvent(Page: PageCounter));
                            },
                            icon: const Icon(
                              Icons.chevron_right,
                              color: Colors.black,
                              size: 31,
                            )),
                      ],
                ),
              ),
            )
          ],
        );

  }
}
Widget deleteButton(Category Category,BuildContext context){
  return IconButton(
      onPressed: () {
        CoolAlert.show(
          context: context,
            width: 120,
            type: CoolAlertType.confirm,
          onConfirmBtnTap: (){
            context.read<CategoryBloc>().add(CategoryDeleteEvent(Category: int.parse(Category.id)));
            context.read<CategoryBloc>().add(CategoryRequestEvent(Page: 1));
            message(context: context, text: 'Category Deleted', style: TextStyle(color: Colors.white));

          }
        );
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
        size: 25,
      ));
}


Widget editButton(Category category,BuildContext context){
  return IconButton(
      onPressed: () {
        CustomDialog(
            context: context,
            content: EditCategoryScreen(category: category),
            size: {
              'width':600,
              'height':730,
        }
        );
      },
      icon: const Icon(
        Icons.edit,
        color: Colors.black,
        size: 25,
      ));
}