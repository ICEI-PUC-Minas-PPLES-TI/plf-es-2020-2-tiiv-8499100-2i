import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:inteligenciaindustrialapp/src/app/components/custom_button_widget.dart';
import 'package:inteligenciaindustrialapp/src/app/components/custom_container.dart';
import 'package:inteligenciaindustrialapp/src/app/models/dto/forum/ForumPostDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/extensions/date_extension.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/styles/colors_style.dart';

class ForumAnswerScreen extends StatelessWidget {
  final TextEditingController controllerAnswer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          children: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  frwkNavigator.popNavigate();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.white,
                ),
                label: Text(
                  'Voltar',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          ],
        ),
        actions: [
          FlatButton(
              onPressed: _showMyDialog,
              child: Text(
                'Responder',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
      backgroundColor: ColorsStyle.background,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Observer(builder: (_) {
      if (!appConnection.isConnected || forumController.forum.isError) {
        return Center(
            child: Text(
          "Você está off-line.\nPor favor verifique sua conexão com a internet.",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ));
      }

      if (forumController.forum.isPending) {
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
      }

      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox.shrink();
              },
              itemCount: forumController.forum.getData.forumPosts.length + 1,
              padding: EdgeInsets.all(24),
              itemBuilder: (context, index) {
                return this._buildPostContainer(
                    index == 0
                        ? forumController.forum.getData.originalPost
                        : forumController.forum.getData.forumPosts[index - 1],
                    index);
              },
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      );
    });
  }

  _buildPostContainer(ForumPostDTO forumDTO, int index) {
    return Column(
      children: [
        CustomContainer(
            padding: EdgeInsets.all(15),
            onTap: () {},
            radius: 2,
            color: ColorsStyle.background,
            shadowColor: ColorsStyle.grayDark,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                forumDTO.isOriginalPost
                    ? Text(
                        forumController.forum.getData.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )
                    : SizedBox.shrink(),
                forumDTO.isOriginalPost
                    ? SizedBox(
                        height: 10,
                      )
                    : SizedBox.shrink(),
                Text(
                  '${forumDTO.isOriginalPost ? 'Por:' : 'Resposta de'} ${forumDTO.user ?? ''}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  forumDTO.body,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Postado em ${forumDTO.date.dateToString(format: 'dd/MM/yyyy')}',
                  style: TextStyle(color: ColorsStyle.gray, fontSize: 13),
                )
              ],
            )),
        Container(
          height: 30,
          width:
              index == forumController.forum.getData.forumPosts.length ? 0 : 10,
          color: ColorsStyle.blue,
        )
      ],
    );
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
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Digite sua resposta'),
                  controller: controllerAnswer,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButtonWidget(
                  radius: 8,
                  onPressed: () {
                    forumController.answerForum(
                        controllerAnswer.text,
                        userController.user.getData.uid,
                        forumController.forum.getData.id);
                    frwkNavigator.popNavigate();
                  },
                  title: Text(
                    'Responder',
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
