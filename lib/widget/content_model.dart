class OnbordingContent {
  final String title;
  final String image;
  final String desc;

  OnbordingContent(
      {required this.title, required this.image, required this.desc});
}

List<OnbordingContent> contents = [
  OnbordingContent(
      title: "Looking for a delightful dining\nexperience near you?",
      image: "images/screen1.png",
      desc: "Get food delivery to your door step"),
  OnbordingContent(
      title: "Reserve your table now\nto guarantee",
      image: "images/screen2.png",
      desc: "Get food delivery to your door step"),
  OnbordingContent(
      title: "Order your favorite food for\npickup and enjoy",
      image: "images/screen3.png",
      desc: "Get food pickup from your door step"),
];
