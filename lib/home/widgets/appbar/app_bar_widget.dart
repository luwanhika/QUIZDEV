import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/core.dart';
import '../../../shared/models/user_model.dart';
import '../../home_controller.dart';
import '../score_card/score_card_widget.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  static final controller = HomeController();

  AppBarWidget({this.user})
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  width: double.maxFinite,
                  decoration: BoxDecoration(gradient: AppGradients.linear),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Hello ${user.name} ',
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                                // text: user.name,
                                style: AppTextStyles.titleBold),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final _picker = ImagePicker();
                          var result = await _picker.pickImage(
                              source: ImageSource.gallery);
                          if (result != null) {
                            user?.photoUrl = result.path;
                            await controller.saveUser(user);
                          } 
                          
                          //Ajeitar forma de atualizar a imagem na hora
                        },
                        child: Container(
                          height: 58,
                          width: 58,
                          child: user?.photoUrl == null
                              ? Icon(Icons.person)
                              : null,
                          decoration: BoxDecoration(
                              color: user?.photoUrl == null
                                  ? Colors.grey[100]
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              image: user?.photoUrl != null
                                  ? DecorationImage(
                                      image: FileImage(File(user.photoUrl)),
                                      fit: BoxFit.cover,
                                    )
                                  : null),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: ScoreCardWidget(percent: user.score / 100),
                ),
              ],
            ),
          ),
        );
}
