import 'package:centredeformation/models/addA.dart';
import 'package:centredeformation/models/addF.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'constantsF.dart';
class Store {

  final _firestore = FirebaseFirestore.instance;
  addFormation(Formation formation) {
      _firestore.collection(kformationCollection).add({
        kformationId:formation.fId,
      kformationName: formation.fTitle,
      kformationAddress: formation.fAdress,
      kformationDescription: formation.fDetails,
      kformationCategory:formation.fCategory,
      kformationvideo:formation.fVideo,
      kformationImage :formation.fImage,
       kformationPrice:formation.fPrice,

    });
  }
  addAnnonce(Annonce annonce){
    _firestore.collection(kannonceCollection).add({
      kannonceName: annonce.ATitle,
      kannonceAddress: annonce.Adress,
      kannonceDescription: annonce.ADetails,
      kannonceCategory:annonce.ACategory,
      kannonceContact:annonce.AContact,
      kannonceImage :annonce.AImage

  }
  );
  }
  Stream<QuerySnapshot>loadFormations(){
    return _firestore.collection(kformationCollection).snapshots();
  }
}

