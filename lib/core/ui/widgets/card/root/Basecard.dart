
class BaseCard {

  final int id;
  final String title;
  final String imageUrl;
  final String description;
  final double rate;
  final int custommerRated;
  final double distance;

  const BaseCard({
    required this.id,
    this.imageUrl="assets/images/defaults/default_posts.png",
    this.title="write post title this here",
    this.description="write post desription this here",
    this.rate=4.0,
    this.custommerRated=0,
    this.distance=2.3
  });
  
}