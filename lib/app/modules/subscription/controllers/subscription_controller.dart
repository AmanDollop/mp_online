import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  //TODO: Implement SubscriptionController

  List<Map<String,String>> subscriptionList=[
    {
      "name":"Start Plan",
      "description":"Free service up to a maximum of 10 publications, with a quantity limit per article"
      "of 1. You will not be able to see the clients' contact details nor will theirs be visible.",
      "amount":"\$ 5.00"
    },
    {
      "name":"Basic Plan",
      "description":"Free service up to a maximum of 10 publications, with a quantity limit per article"
          "of 1. You will not be able to see the clients' contact details nor will theirs be visible.",
      "amount":"\$ 10.00"
    }
    , {
      "name":"Advance Plan",
      "description":"Free service up to a maximum of 10 publications, with a quantity limit per article"
          "of 1. You will not be able to see the clients' contact details nor will theirs be visible.",
      "amount":"\$ 20.00"
    },
    {
      "name":"Enterprise plan",
      "description":"Free service up to a maximum of 10 publications, with a quantity limit per article"
          "of 1. You will not be able to see the clients' contact details nor will theirs be visible.",
      "amount":"\$ 50.00"
    }
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
