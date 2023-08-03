//
//  LoginViewViewModel.swift
//  MicroTasks
//
//  Created by Sanskar Pal on 7/12/23.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login(){
        guard validate() else{
            return
        }
        
        //Try login
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = "Please Fill In All Fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".")else{
            errorMessage = "Please Enter Valid Email."
            
            return false
        }
        
        return true
    }
    
}
