class ImageDiagramModel {
  String id;
  String build;
  String className;
  String nameroom;
  String imgName;

  ImageDiagramModel(
      {this.id, this.build, this.className, this.nameroom, this.imgName});

  ImageDiagramModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    build = json['build'];
    className = json['className'];
    nameroom = json['nameroom'];
    imgName = json['img_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['build'] = this.build;
    data['className'] = this.className;
    data['nameroom'] = this.nameroom;
    data['img_name'] = this.imgName;
    return data;
  }
}

