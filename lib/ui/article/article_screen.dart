import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_jccapi/ui/article/article_controller.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleController>(
      init: ArticleController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("List Artikel", style: TextStyle(
              color: Colors.white
            )),
            backgroundColor: Colors.blue,
            actions: [
              IconButton(onPressed: (){
                controller.logout();
              }, icon: Icon(Icons.logout))
            ],
          ),
          body: controller.articleModel != null ? ListView.builder(
              itemCount: controller.articleModel!.data!.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(controller.articleModel?.data?[index].title ?? '-'),
                subtitle: Text(controller.articleModel?.data?[index].author ?? '-'),
                leading: SizedBox(
                    width: 80,
                    child: Image.network(controller.articleModel?.data?[index].image ?? '' , fit: BoxFit.cover,)
                ),
                onTap: ()=> Get.toNamed("/detail", arguments: {
                  "id" : controller.articleModel?.data?[index].id
                }),
              )
          ) : Center(child: CircularProgressIndicator.adaptive()),
          floatingActionButton: FloatingActionButton(
            onPressed: ()=>Get.toNamed('/create'),
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
          ),
        );
      }
    );
  }
}
