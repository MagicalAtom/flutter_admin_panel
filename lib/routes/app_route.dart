import 'package:pocogame/magicalUi/router/route.dart';
import 'package:pocogame/screens/dashboard_content_screens/posts/add_post_screen.dart';
import 'package:pocogame/screens/dashboard_content_screens/posts/show_post_screen.dart';
import 'package:pocogame/screens/dashboard_screen.dart';



List<Route> appRoute = [
  Route(name: 'dashboard', widget: Dashboard(), route: '/home'),
  Route(name:'add-Post',widget: AddPostScreen(),route: '/new-post'),

];
