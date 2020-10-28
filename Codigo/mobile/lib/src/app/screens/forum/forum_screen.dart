import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:inteligenciaindustrialapp/src/app/components/custom_button_widget.dart';
import 'package:inteligenciaindustrialapp/src/app/components/custom_container.dart';
import 'package:inteligenciaindustrialapp/src/app/models/dto/forum/ForumDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/extensions/date_extension.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/styles/colors_style.dart';

import 'forum_answer_screen.dart';

class ForumScreen extends StatefulWidget {
  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => homeController.setActionCreateForum(_showMyDialog));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (!appConnection.isConnected || forumController.forums.isError) {
          return Center(
              child: Text(
            "Você está off-line.\nPor favor verifique sua conexão com a internet.",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ));
        }

        if (forumController.forums.isPending) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: <Widget>[
                  CustomContainer(
                    radius: 2,
                    height: 100,
                    useSkeleton: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomContainer(
                    radius: 2,
                    height: 100,
                    useSkeleton: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomContainer(
                    radius: 2,
                    height: 100,
                    useSkeleton: true,
                  ),
                ],
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: forumController.forums.getData.length,
                  padding: EdgeInsets.all(24),
                  itemBuilder: (context, index) {
                    return this._buildPostContainer(
                        forumController.forums.getData[index]);
                  },
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          );
        }
      },
    );
  }

  _buildPostContainer(ForumDTO forumDTO) {
    num answers = forumDTO.forumPosts?.length ?? 0;

    return CustomContainer(
        padding: EdgeInsets.all(15),
        onTap: () {
          forumController.forum.setDone(forumDTO);
          forumController.sendStatistic(forumDTO.id.toString());
          frwkNavigator.navigate(ForumAnswerScreen(), modal: true);
        },
        radius: 2,
        color: ColorsStyle.background,
        shadowColor: ColorsStyle.grayDark,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              forumDTO.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  forumDTO.originalPost != null &&
                          forumDTO.originalPost.date != null
                      ? 'Criado em ${forumDTO.originalPost.date?.dateToString(format: 'dd/MM/yyyy') ?? ''}'
                      : '',
                  style: TextStyle(color: ColorsStyle.gray, fontSize: 13),
                ),
                Text(
                  '$answers resposta${answers == 1 ? '' : 's'}',
                  style: TextStyle(color: ColorsStyle.gray, fontSize: 13),
                )
              ],
            )
          ],
        ));
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: frwkNavigator.currentContext,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:
              EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  decoration:
                      InputDecoration.collapsed(hintText: 'Título do fórum'),
                  controller: titleController,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  decoration:
                      InputDecoration.collapsed(hintText: 'Post do fórum'),
                  controller: bodyController,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButtonWidget(
                  radius: 8,
                  onPressed: () {
                    forumController.createForum(titleController.text,
                        bodyController.text, userController.user.getData.uid);
                    frwkNavigator.popNavigate();
                  },
                  title: Text(
                    'Criar fórum',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  height: 42,
                  backgroundColor: ColorsStyle.blue,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
