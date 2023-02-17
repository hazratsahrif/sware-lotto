import 'package:image_picker/image_picker.dart';

class PickImage{
  String image="";
  XFile img = XFile('');
  ImagePicker picker = ImagePicker();

  Future<XFile?> getFromGallery() async {
    // Pick an image
    img = (await picker.pickImage(
      source: ImageSource.gallery,
    ))!;
    if (img.name != null) {
      print(img.path);
      return img;
    } else {
      print("error");
    }
    return null;
  }
}