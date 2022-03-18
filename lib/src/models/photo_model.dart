import 'dart:convert';

PhotoModel photoModelFromMap(String str) => PhotoModel.fromMap(json.decode(str));

String photoModelToMap(PhotoModel data) => json.encode(data.toMap());

class PhotoModel {
    PhotoModel({
        required this.id,
        required this.width,
        required this.height,
        required this.color,
        required this.blurHash,
        required this.description,
        required this.altDescription,
        required this.urls,
        required this.links,
        required this.categories,
        required this.likes,
        required this.likedByUser,
        required this.currentUserCollections,
        required this.sponsorship,
        required this.user,
        required this.views,
    });

    String? id;
    int? width;
    int? height;
    String? color;
    String? blurHash;
    String? description;
    dynamic altDescription;
    Urls urls;
    PhotoModelLinks links;
    List<dynamic>? categories;
    int? likes;
    bool? likedByUser;
    List<dynamic>? currentUserCollections;
    dynamic sponsorship;
    User? user;
    int? views;

    factory PhotoModel.fromMap(Map<String, dynamic> json) => PhotoModel(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        urls: Urls.fromMap(json["urls"]),
        links: PhotoModelLinks.fromMap(json["links"]),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"],
        user: User.fromMap(json["user"]),
        views: json["views"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "urls": urls.toMap(),
        "links": links.toMap(),
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": List<dynamic>.from(currentUserCollections!.map((x) => x)),
        "sponsorship": sponsorship,
        "user": user?.toMap(),
        "views": views,
    };
}

class PhotoModelLinks {
    PhotoModelLinks({
        required this.self,
        required this.html,
        required this.download,
        required this.downloadLocation,
    });

    String? self;
    String? html;
    String download;
    String downloadLocation;

    factory PhotoModelLinks.fromMap(Map<String, dynamic> json) => PhotoModelLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
    );

    Map<String, dynamic> toMap() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
    };
}

class Architecture {
    Architecture({
        required this.status,
        required this.approvedOn,
    });

    String? status;
    DateTime? approvedOn;

    factory Architecture.fromMap(Map<String, dynamic> json) => Architecture(
        status: json["status"],
        approvedOn: DateTime.parse(json["approved_on"]),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "approved_on": approvedOn?.toIso8601String(),
    };
}

class Interiors {
    Interiors({
        required this.status,
    });

    String? status;

    factory Interiors.fromMap(Map<String, dynamic> json) => Interiors(
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "status": status,
    };
}

class Urls {
    Urls({
        required this.full,
    });

    String full;

    factory Urls.fromMap(Map<String, dynamic> json) => Urls(
        full: json["full"],
    );

    Map<String, dynamic> toMap() => {
        "full": full,
    };
}

class User {
    User({
        required this.id,
        required this.updatedAt,
        required this.username,
        required this.name,
        required this.firstName,
        required this.lastName,
        required this.twitterUsername,
        required this.portfolioUrl,
        required this.bio,
        required this.location,
        required this.links,
        required this.profileImage,
        required this.instagramUsername,
        required this.totalCollections,
        required this.totalLikes,
        required this.totalPhotos,
        required this.acceptedTos,
        required this.forHire,
        required this.social,
    });

    String? id;
    DateTime? updatedAt;
    String? username;
    String? name;
    String? firstName;
    String? lastName;
    String? twitterUsername;
    String? portfolioUrl;
    String? bio;
    String? location;
    UserLinks? links;
    ProfileImage? profileImage;
    String? instagramUsername;
    int? totalCollections;
    int? totalLikes;
    int? totalPhotos;
    bool? acceptedTos;
    bool? forHire;
    Social? social;

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        twitterUsername: json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
        bio: json["bio"],
        location: json["location"],
        links: UserLinks.fromMap(json["links"]),
        profileImage: ProfileImage.fromMap(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: Social.fromMap(json["social"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "updated_at": updatedAt?.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "twitter_username": twitterUsername,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "links": links?.toMap(),
        "profile_image": profileImage?.toMap(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social?.toMap(),
    };
}

class UserLinks {
    UserLinks({
        required this.self,
        required this.html,
        required this.photos,
        required this.likes,
        required this.portfolio,
        required this.following,
        required this.followers,
    });

    String? self;
    String? html;
    String? photos;
    String? likes;
    String? portfolio;
    String? following;
    String? followers;

    factory UserLinks.fromMap(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
    );

    Map<String, dynamic> toMap() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
    };
}

class ProfileImage {
    ProfileImage({
        required this.medium,
    });

    String medium;

    factory ProfileImage.fromMap(Map<String, dynamic> json) => ProfileImage(
        medium: json["medium"],
    );

    Map<String, dynamic> toMap() => {
        "medium": medium,
    };
}

class Social {
    Social({
        required this.instagramUsername,
        required this.portfolioUrl,
        required this.twitterUsername,
        required this.paypalEmail,
    });

    String? instagramUsername;
    String? portfolioUrl;
    String? twitterUsername;
    dynamic paypalEmail;

    factory Social.fromMap(Map<String, dynamic> json) => Social(
        instagramUsername: json["instagram_username"],
        portfolioUrl: json["portfolio_url"],
        twitterUsername: json["twitter_username"],
        paypalEmail: json["paypal_email"],
    );

    Map<String, dynamic> toMap() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
        "twitter_username": twitterUsername,
        "paypal_email": paypalEmail,
    };
}
