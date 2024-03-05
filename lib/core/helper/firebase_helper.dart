// // import 'package:get_it/get_it.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // void setupLocator() {
// //   final getIt = GetIt.instance;

// //   getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
// //   getIt.registerSingleton<FirebaseHelper>(FirebaseHelper(getIt<FirebaseFirestore>()));
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class FirebaseHelper {
//   final FirebaseFirestore _firestore;

//   FirebaseHelper(this._firestore);

//   // Get a single document reference from Firestore
//   DocumentReference? getDocumentReference(
//       String collectionPath, String documentId) {
//     try {
//       DocumentReference snapshot =
//           _firestore.collection(collectionPath).doc(documentId);
//       return snapshot;
//     } catch (e) {
//       debugPrint("Error getting document: $e");
//       return null;
//     }
//   }

//   // Get a single document from Firestore as Future
//   Future<DocumentSnapshot?> getDocument(
//       String collectionPath, String documentId) async {
//     try {
//       DocumentSnapshot snapshot =
//           await _firestore.collection(collectionPath).doc(documentId).get();
//       return snapshot;
//     } catch (e) {
//       debugPrint("Error getting document: $e");
//       return null;
//     }
//   }

//   // Get a single document from Firestore as Stream
//   Stream<DocumentSnapshot<Map<String, dynamic>>>? getDocumentAsStream(
//       String collectionPath, String documentId) {
//     try {
//       return _firestore.collection(collectionPath).doc(documentId).snapshots();
//     } catch (e) {
//       debugPrint("Error getting document: $e");
//       return null;
//     }
//   }

//   // Get all documents in a collection from Firestore
//   Future<List<DocumentSnapshot>> getAllDocuments(String collectionPath) async {
//     try {
//       QuerySnapshot querySnapshot =
//           await _firestore.collection(collectionPath).get();
//       return querySnapshot.docs;
//     } catch (e) {
//       debugPrint("Error getting documents: $e");
//       return [];
//     }
//   }

//   // Get documents with pagination from Firestore
//   Future<List<DocumentSnapshot>> getDocumentsWithPagination(
//       String collectionPath, int limit, DocumentSnapshot? lastDocument) async {
//     try {
//       Query query = _firestore
//           .collection(collectionPath)
//           .orderBy("createdAt")
//           .limit(limit);
//       if (lastDocument != null) {
//         query = query.startAfterDocument(lastDocument);
//       }
//       QuerySnapshot querySnapshot = await query.get();
//       return querySnapshot.docs;
//     } catch (e) {
//       debugPrint("Error getting documents with pagination: $e");
//       return [];
//     }
//   }

//   // Create a new document to Firestore
//   Future<void> createDocument(
//       String collectionPath, String docID, Map<String, dynamic> data) async {
//     try {
//       await _firestore.collection(collectionPath).doc(docID).set(data);
//     } catch (e) {
//       debugPrint("Error adding document: $e");
//     }
//   }

//   // Add a new document to Firestore
//   Future<void> addDocument(
//     String collectionPath,
//     Map<String, dynamic> data,
//   ) async {
//     try {
//       await _firestore.collection(collectionPath).add(data);
//     } catch (e) {
//       debugPrint("Error adding document: $e");
//     }
//   }

//   // Update an existing document in Firestore
//   Future<void> updateDocument(String collectionPath, String documentId,
//       Map<String, dynamic> data) async {
//     try {
//       await _firestore.collection(collectionPath).doc(documentId).update(data);
//     } catch (e) {
//       debugPrint("Error updating document: $e");
//     }
//   }

//   // Delete a document from Firestore
//   Future<void> deleteDocument(String collectionPath, String documentId) async {
//     try {
//       await _firestore.collection(collectionPath).doc(documentId).delete();
//     } catch (e) {
//       debugPrint("Error deleting document: $e");
//     }
//   }
// }
