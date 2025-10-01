import 'package:get/get.dart';
import 'package:rent_app/pages/home/state.dart';

class HomeController extends GetxController{

    final state = HomeState();

  @override
  void onReady() {
    super.onReady();
  }

    final List<String> tabs = ['House','Apartment','Hotel','Villa','Coffee','Tea','Store','Flat'];

    final RxInt selectedIndex = 0.obs;

    Map<String, List<Map<String, String>>> dummyData = {
      'House': List.generate(8, (index) => {
        'image': 'https://picsum.photos/600/400',
        'title': 'House - Item $index',
        'subtitle': 'House is beautiful'
      }),
      'Apartment': List.generate(10, (index) => {
        'image': 'https://picsum.photos/600/400',
        'title': 'Apartment - Item $index',
        'subtitle': 'Apartment is beautiful'
      }),
      'Hotel': List.generate(10, (index) => {
        'image': 'https://picsum.photos/600/400',
        'title': 'Hotel - Item $index',
        'subtitle': 'Hotel is beautiful'
      }),
      'Villa': List.generate(10, (index) => {
        'image': 'https://picsum.photos/600/400',
        'title': 'Villa - Item $index',
        'subtitle': 'Villa is beautiful'
      }),
      'Coffee': List.generate(10, (index) => {
        'image': 'https://picsum.photos/600/400',
        'title': 'Coffee - Item $index',
        'subtitle': 'Coffee is beautiful'
      }),

      'Tea': List.generate(10, (index) => {
        'image': 'https://picsum.photos/600/400',
        'title': 'Tea - Item $index',
        'subtitle': 'Tea is beautiful'
      }),

      'Store': List.generate(10, (index) => {
        'image': 'https://picsum.photos/600/400',
        'title': 'Store - Item $index',
        'subtitle': 'Store is beautiful'
      }),

      'Flat': List.generate(10, (index) => {
        'image': 'https://picsum.photos/600/400',
        'title': 'Flat - Item $index',
        'subtitle': 'Flat is beautiful'
      }),

      // 'Coffee': List.generate(10, (index) => {
      //   'image': 'https://via.placeholder.com/150',
      //   'title': 'Tab 5 - Item $index',
      // }),
    };

    void changeTab(int index) {
      selectedIndex.value = index;
    }


}