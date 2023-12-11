import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocogame/data/models/Posts.dart';
import 'package:pocogame/di/admin/di.dart';
import '../../../bloc/Post/post_bloc.dart';
import '../../../config/shadow.dart';
import '../../../magicalUi/responsive/size.dart';
import '../../../widgets/CustomText.dart';

class ShowPostScreen extends StatefulWidget {
  ShowPostScreen({super.key, required this.state});

  PostRequestResponseState state;

  @override
  State<ShowPostScreen> createState() => _ShowPostScreenState();
}

class _ShowPostScreenState extends State<ShowPostScreen> {
  int pagecounter = 1;

  @override
  Widget build(BuildContext context) {
    if (widget.state is PostLoadingState) {
      return CircularProgressIndicator();
    } else {
      return widget.state.postList.fold((faildLoadData) {
        return const Text(
            'داده های برنامه در حال حاظر در دسترس نیست با برنامه نویس در ارتباط باشید');
      }, (successLoadData) {
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
                  child: DataTable(
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
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                    size: 25,
                                  )),
                            ],
                          )),
                        ]);
                      })),
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
                child: BlocBuilder<PostBloc,PostState>(
                  bloc: ServiceLocator.get<PostBloc>(),
                  builder: (context,state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.chevron_left,
                              color: Colors.black,
                              size: 31,
                            )),
                        SizedBox(
                          width: 120,
                        ),
                        IconButton(
                            onPressed: () {
                              context.read<PostBloc>().add(PostRequestEvent(Page: pagecounter++));
                            },
                            icon: const Icon(
                              Icons.chevron_right,
                              color: Colors.black,
                              size: 31,
                            )),
                      ],
                    );
                  }
                ),
              ),
            )
          ],
        );
      });
    }
  }
}
Widget deleteButton(Post post,BuildContext context){
  return IconButton(
      onPressed: () {
        context.read<PostBloc>().add(PostDeleteEvent(post: post));
        context.read<PostBloc>().add(PostRequestEvent(Page: 1));
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
        size: 25,
      ));
}