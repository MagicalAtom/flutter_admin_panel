abstract class SwiftRequestInterFace {


Future get({required String path,queryParam});
Future post({required String path,required data});
Future delete({required path,required id});
}