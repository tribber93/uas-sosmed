import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uas_sosmed/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserCredential? _userCredential;
  FirebaseAuth auth = FirebaseAuth.instance;
  late TextEditingController searchFriendsController, statusController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    searchFriendsController = TextEditingController();
    statusController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchFriendsController.dispose();
    statusController.dispose();
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    print(googleUser!.email);
    // Once signed in, return the UserCredential
    await auth
        .signInWithCredential(credential)
        .then((value) => _userCredential = value);

    //firebase
    CollectionReference users = firestore.collection('users');

    final cekUsers = await users.doc(googleUser.email).get();
    if (!cekUsers.exists) {
      users.doc(googleUser.email).set({
        'uid': _userCredential!.user!.uid,
        'name': googleUser.displayName,
        'email': googleUser.email,
        'photo': googleUser.photoUrl,
        'status_id': [],
        'createdAt': _userCredential!.user!.metadata.creationTime.toString(),
        'lastLoginAt':
            _userCredential!.user!.metadata.lastSignInTime.toString(),
        // 'list_cari':,
      }).then((value) async {
        try {
          String temp = '';
          for (var i = 0; i < googleUser.displayName!.length; i++) {
            temp = temp + googleUser.displayName![i];
            users.doc(googleUser.email).set({
              await 'list_cari': FieldValue.arrayUnion([temp.toUpperCase()])
            }, SetOptions(merge: true));
          }
        } catch (e) {
          print(e);
        }
      });
    } else {
      users.doc(googleUser.email).update({
        'lastLoginAt': _userCredential!.user!.metadata.lastSignInTime,
      });
    }

    //menambahkan collection friends ketika login
    CollectionReference friends = firestore.collection('friends');
    final cekFriends = await friends.doc(auth.currentUser!.email).get();

    if (!cekFriends.exists) {
      await friends.doc(auth.currentUser!.email).set({
        'emailMe': auth.currentUser!.email,
        'emailFriends': [],
      });
    }
    Get.offAllNamed(Routes.HOME);
  }

  Future logout() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  //Mencari teman
  var kataCari = [].obs;
  var hasilPencarian = [].obs;
  void searchFriends(String keyword) async {
    CollectionReference users = firestore.collection('users');

    if (keyword.isNotEmpty) {
      final hasilQuery = await users
          .where('list_cari', arrayContains: keyword.toUpperCase())
          .get();

      if (hasilQuery.docs.isNotEmpty) {
        for (var i = 0; i < hasilQuery.docs.length; i++) {
          kataCari.add(hasilQuery.docs[i].data() as Map<String, dynamic>);
        }
      }

      if (kataCari.isNotEmpty) {
        hasilPencarian.value = [];
        kataCari.forEach((element) {
          print(element);
          hasilPencarian.add(element);
        });
        kataCari.clear();
      }
    } else {
      kataCari.value = [];
      hasilPencarian.value = [];
    }
    kataCari.refresh();
    hasilPencarian.refresh();
  }

  void addFriends(String _emailFriends) async {
    CollectionReference friends = firestore.collection('friends');

    final cekFriends = await friends.doc(auth.currentUser!.email).get();
    //cek data friends ada atau tidak
    if (cekFriends.data() == null) {
      await friends.doc(auth.currentUser!.email).update({
        'emailFriends': [_emailFriends],
      }).whenComplete(
          () => Get.snackbar('Friends', 'Friends successfully added'));
    } else {
      await friends.doc(auth.currentUser!.email).set({
        'emailFriends': FieldValue.arrayUnion([_emailFriends]),
      }, SetOptions(merge: true)).whenComplete(
          () => Get.snackbar('Friends', 'Friends successfully added'));
    }
    kataCari.clear();
    hasilPencarian.clear();
    searchFriendsController.clear();
    Get.back();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamFriends() {
    return firestore
        .collection('friends')
        .doc(auth.currentUser!.email)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUsers(String email) {
    return firestore.collection('users').doc(email).snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamStatus(String statusId) {
    return firestore.collection('status').doc(statusId).snapshots();
  }

  Future<void> sendStatus({
    String? status,
    String? type,
    String? docId,
  }) async {
    print(status);
    print(type);
    print(docId);
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    CollectionReference statusColl = firestore.collection('status');
    CollectionReference usersColl = firestore.collection('users');
    var statusId = DateTime.now().toIso8601String();
    if (type == 'Create') {
      await statusColl.doc(statusId).set({
        'status': status,
        'like': 0,
        'jumlah_komentar': 0,
        'created_by': auth.currentUser!.email,
        'createdAt': DateTime.now(),
      }).whenComplete(() async {
        await usersColl.doc(auth.currentUser!.email).set({
          'status_id': FieldValue.arrayUnion([statusId])
        }, SetOptions(merge: true));
        Get.back();
        Get.snackbar('Status', 'Successfully ${type}ed');
      }).catchError((error) {
        Get.snackbar('Status', 'Failed to $type');
      });
    } else {
      await statusColl.doc(docId).update({
        'status': status,
      }).whenComplete(() async {
        // await usersColl.doc(authCon.auth.currentUser!.email).set({
        //   'status_id': FieldValue.arrayUnion([statusId])
        // }, SetOptions(merge: true));
        Get.back();
        Get.snackbar('Status', 'Successfully ${type}d');
      }).catchError((error) {
        Get.snackbar('Status', 'Failed to $type');
      });
    }
  }
}
