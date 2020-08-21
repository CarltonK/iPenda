class IntroModel {
  String title;
  String subtitile;
  String image;

  IntroModel({this.title, this.subtitile, this.image});
}

IntroModel one = IntroModel(
    image: "assets/kissclipart.png",
    title: 'Create a profile',
    subtitile: 'Register an account and provide details about you and your preferences. The more details you provide the better your matches');
IntroModel two = IntroModel(
    image: "assets/kissclipart.png",
    title: 'Make a match',
    subtitile: 'Our smart soul-mate matching algorithm is designed by leading psychiatrists to provide you most suitable matches');
IntroModel three = IntroModel(
    image: "assets/kissclipart.png",
    title: 'Spark a connection',
    subtitile: 'Connect with someone of similar interests and goals.See where ittakes you');

List<IntroModel> intros = [one, two, three];
