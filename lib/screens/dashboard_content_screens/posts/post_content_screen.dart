import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocogame/bloc/Post/post_bloc.dart';
import 'package:pocogame/di/admin/di.dart';
import 'package:pocogame/magicalUi/magic.dart';
import 'package:pocogame/widgets/CustomText.dart';
import '../../../config/shadow.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(PostRequestEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              BlocProvider.value(
                value: ServiceLocator.get<PostBloc>(),
                child: route(context: context, name: 'add-Post',navigate: true),
              );
            },
            label: CustomText(
              text: 'Add Post',
            ),
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: const Size(200, 60)),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<PostBloc, PostState>(
            bloc: ServiceLocator.get<PostBloc>(),
            builder: (context, state) {
              if (state is PostLoadingState) {
                return CircularProgressIndicator();
              } else if (state is PostRequestResponseState) {
                return state.postList.fold((faildLoadData) {
                  return const Text(
                      'داده های برنامه در حال حاظر در دسترس نیست با برنامه نویس در ارتباط باشید');
                }, (successLoadData) {
                  return Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                      height: 500,
                      width: width(context) - 500,
                      decoration: BoxDecoration(
                          boxShadow: [boxShadow],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: SingleChildScrollView(
                        child: DataTable(
                            columnSpacing: 30,
                            columns: [
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
                            rows:
                                List.generate(successLoadData.length, (index) {
                              return DataRow(cells: [
                                DataCell(Text(successLoadData[index].title)),
                                DataCell(Text(successLoadData[index].date)),
                                DataCell(Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 25,
                                        )),
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
                  );
                });
              }

              return const Text('');
            },
          ),
        ],
      ),
    );
  }
}
