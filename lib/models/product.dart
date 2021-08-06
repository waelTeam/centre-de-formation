class Product {
  final int id;
  final String title, description, image;

  Product({this.id,  this.title, this.description, this.image});
}

// list of products
// for our demo
List<Product> products = [
  Product(
    id: 1,

    title: "Mobile Developer",
    image: "assets/images/prof1.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 4,

    title: "Web Developer",
    image: "assets/images/prof2.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 9,

    title: "Designer",
    image: "assets/images/prof3.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 9,
    title: "Data Scientist",
    image: "assets/images/prof4.png",
    description:
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
];
