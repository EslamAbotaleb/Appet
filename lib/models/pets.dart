class Pets {
  final String? tag;
  final String? name;
  final String? type;
  final String? image;

  const Pets({this.tag, this.name, this.type, this.image});
}

List<Pets> pets = [
  const Pets(
    tag: "1",
    name: "Pets One",
    type: "dog",
    image: "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  ),
  const Pets(
    tag: "2",
    name: "Pets two",
    type: "cat",
    image:
        "https://www.thesprucepets.com/thmb/QDw4vt7XXQejL2IRztKeRLow6hA=/2776x1561/smart/filters:no_upscale()/cat-talk-eyes-553942-hero-df606397b6ff47b19f3ab98589c3e2ce.jpg",
  ),
  const Pets(
    tag: "3",
    name: "Pets three",
    type: "dog",
    image:
        "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  ),
  const Pets(
    tag: "4",
    name: "Pets four",
    type: "cat",
    image:
        "https://www.thesprucepets.com/thmb/QDw4vt7XXQejL2IRztKeRLow6hA=/2776x1561/smart/filters:no_upscale()/cat-talk-eyes-553942-hero-df606397b6ff47b19f3ab98589c3e2ce.jpg",
  ),
];
