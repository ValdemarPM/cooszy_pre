import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import '../models/person.dart';
import 'auth_service.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final AuthService _authService = AuthService();

  // Get current user's people collection reference
  CollectionReference<Map<String, dynamic>> get _peopleCollection {
    final userId = _authService.currentUser?.uid;
    if (userId == null) throw Exception('No authenticated user');
    return _firestore.collection('users').doc(userId).collection('people');
  }

  // Get stream of people for current user
  Stream<List<Person>> getPeopleStream() {
    return _peopleCollection
        .orderBy('lastInteraction', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Person.fromMap(doc.data(), doc.id))
          .toList();
    });
  }

  // Add new person
  Future<String> addPerson(Person person) async {
    try {
      final docRef = await _peopleCollection.add(person.toMap());
      return docRef.id;
    } catch (e) {
      throw _handleFirestoreException(e);
    }
  }

  // Update person
  Future<void> updatePerson(Person person) async {
    try {
      await _peopleCollection.doc(person.id).update(person.toMap());
    } catch (e) {
      throw _handleFirestoreException(e);
    }
  }

  // Delete person
  Future<void> deletePerson(String id) async {
    try {
      await _peopleCollection.doc(id).delete();
      // Also delete associated image if exists
      await _deleteProfileImage(id);
    } catch (e) {
      throw _handleFirestoreException(e);
    }
  }

  // Upload profile image
  Future<String> uploadProfileImage(String personId, File imageFile) async {
    try {
      final userId = _authService.currentUser?.uid;
      if (userId == null) throw Exception('No authenticated user');

      final ref = _storage.ref('users/$userId/profile_images/$personId.jpg');

      // Upload with metadata
      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'uploadedBy': userId, 'personId': personId},
      );
      await ref.putFile(imageFile, metadata);

      return await ref.getDownloadURL();
    } catch (e) {
      throw _handleStorageException(e);
    }
  }

  // Delete profile image
  Future<void> _deleteProfileImage(String personId) async {
    try {
      final userId = _authService.currentUser?.uid;
      if (userId == null) return;

      final ref = _storage.ref('users/$userId/profile_images/$personId.jpg');
      await ref.delete();
    } catch (e) {
      // Ignore if image doesn't exist
      print('Error deleting image: $e');
    }
  }

  // Helper method to handle Firestore exceptions
  String _handleFirestoreException(dynamic e) {
    if (e is FirebaseException) {
      switch (e.code) {
        case 'permission-denied':
          return 'You don\'t have permission to perform this action.';
        case 'not-found':
          return 'The requested document was not found.';
        case 'already-exists':
          return 'A document with this ID already exists.';
        default:
          return 'A database error occurred: ${e.message}';
      }
    }
    return 'An unexpected error occurred: $e';
  }

  // Helper method to handle Storage exceptions
  String _handleStorageException(dynamic e) {
    if (e is FirebaseException) {
      switch (e.code) {
        case 'unauthorized':
          return 'Not authorized to upload files.';
        case 'canceled':
          return 'Upload was canceled.';
        case 'storage/retry-limit-exceeded':
          return 'Upload failed too many times.';
        default:
          return 'A storage error occurred: ${e.message}';
      }
    }
    return 'An unexpected error occurred while uploading: $e';
  }

  // Initialize user data after registration
  Future<void> initializeUserData(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'createdAt': FieldValue.serverTimestamp(),
        'lastActive': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw _handleFirestoreException(e);
    }
  }

  // Update user's last active timestamp
  Future<void> updateUserLastActive() async {
    final userId = _authService.currentUser?.uid;
    if (userId == null) return;

    try {
      await _firestore.collection('users').doc(userId).update({
        'lastActive': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error updating last active: $e');
    }
  }
}
