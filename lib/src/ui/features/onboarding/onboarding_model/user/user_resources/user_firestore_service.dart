import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../user.dart';

class UserFirestoreService {
  final String collectionName = 'User';

  Future<User?> getUserById({
    required String userId,
  }) async {
    print('UserFirestoreService: getUserById Function');
    User? user;
    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .where(
            'id',
            isEqualTo: userId,
          )
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (final doc in querySnapshot.docs) {
          print('userFound');

          Map<String, dynamic> userMap = {
            'id': doc['id'],
            'role': doc['role'],
            'phoneNumber': doc['phoneNumber'],
            'phoneNumberRoleKey': doc['phoneNumberRoleKey'],
          };
          if (doc['role'] == 'Customer') {
            userMap.addEntries(
              {
                'fullName': doc['fullName'],
                'email': doc['email'],
              }.entries,
            );
          }
          if (doc['role'] == 'Driver') {
            userMap.addEntries(
              {
                'fullName': doc['fullName'],
              }.entries,
            );
          }

          user = User.fromJson(userMap);
        }
      });
      return user;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<User?> userExists({
    required String email,
  }) async {
    print('UserFirestoreService: userExists Function');
    User? user;
    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .where('email', isEqualTo: email)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (final doc in querySnapshot.docs) {
          debugPrint('userFound');

          Map<String, dynamic> userMap = {
            'id': doc['id'],
            'fullName': doc['fullName'],
            'email': doc['email'],
            'password': doc['password'],
          };

          user = User.fromJson(userMap);
        }
      });
      return user;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<User?> loginUser({
    required String phoneNumber,
    required String userRole,
  }) async {
    print('UserFirestoreService: loginUser Function');
    User? user;
    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .where('phoneNumberRoleKey', isEqualTo: phoneNumber + userRole)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (final doc in querySnapshot.docs) {
          print('userFound');

          Map<String, dynamic> userMap = {
            'id': doc['id'],
            'role': doc['role'],
            'phoneNumber': doc['phoneNumber'],
            'phoneNumberRoleKey': doc['phoneNumberRoleKey'],
          };
          if (userRole == 'Customer') {
            userMap.addEntries(
              {
                'fullName': doc['fullName'],
                'email': doc['email'],
              }.entries,
            );
          }
          if (userRole == 'Driver') {
            userMap.addEntries(
              {
                'fullName': doc['fullName'],
              }.entries,
            );
          }

          user = User.fromJson(userMap);
        }
      });
      return user;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<User?> addUser({
    required String fullName,
    required String email,
    required String password,
  }) async {
    debugPrint('UserFirestoreService: addUser Function');
    User? user;
    try {
      final String userId = const Uuid().v1();

      try {
        final Map<String, dynamic> userMap = {
          'id': userId,
          'fullName': fullName,
          'email': email,
          'password': password
        };

        await FirebaseFirestore.instance
            .collection(collectionName)
            .doc(userId)
            .set(userMap)
            .catchError((e) {
          debugPrint(e);
          throw e.toString();
        });
        user = User.fromJson(userMap);
        return user;
      } catch (e) {
        throw e.toString();
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
