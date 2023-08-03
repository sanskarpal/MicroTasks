//
//  ToDoListItemViewViewModel.swift
//  MicroTasks
//
//  Created by Sanskar Pal on 7/12/23.
//

import FirebaseAuth
import Foundation
import FirebaseFirestore

class ToDoListItemViewViewModel: ObservableObject{

    init() {}
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
