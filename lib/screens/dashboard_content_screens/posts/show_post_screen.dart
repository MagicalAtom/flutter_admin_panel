import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocogame/data/models/Posts.dart';
import 'package:pocogame/di/admin/di.dart';
import 'package:pocogame/magicalUi/components/CustomDialog.dart';
import 'package:pocogame/magicalUi/components/snack_bar.dart';
import 'package:pocogame/screens/dashboard_content_screens/posts/edit_post_screen.dart';
import '../../../bloc/Post/post_bloc.dart';
import '../../../config/shadow.dart';
import '../../../magicalUi/responsive/size.dart';
import '../../../widgets/CustomText.dart';

class ShowPostScreen extends StatefulWidget {
  ShowPostScreen({super.key});


  @override
  State<ShowPostScreen> createState() => _ShowPostScreenState();
}

class _ShowPostScreenState extends State<ShowPostScreen> {
  int? PostLenght;
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
                  child: BlocBuilder<PostBloc,PostState>(

                    builder: (context,state) {
                      if(state is PostLoadingState){
                        return const  CircularProgressIndicator();
                      }else if(state is PostRequestResponseState){
                        return state.postList.fold((faildLoadData) => Text('داده های برنامه در دسترس نیست'),
                        (successLoadData){
                          return  DataTable(
                              columnSpacing: 30,
                              columns: [
                                DataColumn(
                                    label: CustomText(
                                      text: 'Post id',
                                    )),
                                DataColumn(
                                    label: CustomText(
                                      text: 'post Name',
                                    )),
                                DataColumn(
                                    label: CustomText(
                                      text: 'date',
                                    )),
                                DataColumn(
                                    label: CustomText(
                                      text: 'actions',
                                    )),
                              ],
                              rows: List.generate(successLoadData.length, (index) {
                                  PostLenght = successLoadData.length;
                                  PageCount = successLoadData[1].pageCount;
                                return DataRow(cells: [
                                  DataCell(Text(successLoadData[index].id)),
                                  DataCell(Text(successLoadData[index].title)),
                                  DataCell(Text(successLoadData[index].date)),
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
                      context.read<PostBloc>().add(PostRequestEvent(Page: 1));
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
                              context.read<PostBloc>().add(PostRequestEvent(Page: PageCounter));
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
                              context.read<PostBloc>().add(PostRequestEvent(Page: PageCounter));
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
Widget deleteButton(Post post,BuildContext context){
  return IconButton(
      onPressed: () {
        CoolAlert.show(
          context: context,
            width: 120,
            type: CoolAlertType.confirm,
          onConfirmBtnTap: (){
            context.read<PostBloc>().add(PostDeleteEvent(post: int.parse(post.id)));
            context.read<PostBloc>().add(PostRequestEvent(Page: 1));
            message(context: context, text: 'Post Deleted', style: TextStyle(color: Colors.white));

          }
        );
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
        size: 25,
      ));
}


Widget editButton(Post post,BuildContext context){
  return IconButton(
      onPressed: () {
        CustomDialog(
            context: context,
            content: EditPostScreen(post: post),
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