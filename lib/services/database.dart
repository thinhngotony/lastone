import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trailerfilm_app/model/profile.dart';


class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //final CollectionReference favoriteMovies = FirebaseFirestore.instance.collection('favorite_movies');
  //final CollectionReference userProfiles = FirebaseFirestore.instance.collection('personal');
  final CollectionReference Personal = FirebaseFirestore.instance.collection('personal');
  Future updateFavoriteMovies(String movie_id) async{
    return Personal.doc(uid).collection('favorite').doc(movie_id.toString()).set({
      //'movie_id': movie_id,
    });
  }
  Future updateUserProfile(String name, String email,String phone) async{
    return await Personal.doc(uid).collection('profiles').doc('0').set({
      'name': name,
      'email': email,
      'phone':phone,
    });
  }
  // Future updateUserProfile(String name, String email,String phone) async{
  //   return await userProfiles.doc(uid).set({
  //     'name': name,
  //     'email': email,
  //     'phone':phone,
  //   });
  // }
  Future deleteUserProfile() async {
    return await Personal.doc(uid).collection('profiles').doc('0').update({

    });
  }

  Future deleteFavoriteMovies(String movie_id) async {
    return await Personal.doc(uid).collection('favorite').doc(movie_id.toString()).delete();
  }

  Stream<DocumentSnapshot> get getProfileSnapshot{
    return Personal.doc(uid).collection('profile').doc('0').snapshots();
  }
  CollectionReference get getFavoriteSnapshot{
    return Personal.doc(uid).collection('favorite');
  }
 // String listFavorite(QuerySnapshot snapshot){
 //    return snapshot.docs.map((uid){
 //      return uid.data('favorite').map(data{
 //        return data.toString();
 //      });
 //    });
 //  }
   Profile getProfile(DocumentSnapshot snapshot){
      return Profile(
        name: snapshot.get('name'),
        email: snapshot.get('email'),
        phone: snapshot.get('phone'),
      );
  }
  List<String> getFavorite(CollectionReference collectionReference){
    List<String> favo;
    favo.add(collectionReference.id);
    return favo;
  }
}