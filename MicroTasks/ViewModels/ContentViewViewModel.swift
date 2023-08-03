//
//  ContentViewViewModel.swift
//  MicroTasks
//
//  Created by Sanskar Pal on 7/12/23.
//

import FirebaseAuth
import Foundation


class ContentViewViewModel: ObservableObject{
    
    @Published var currentUserId: String = ""
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{[weak self] _,user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
}
