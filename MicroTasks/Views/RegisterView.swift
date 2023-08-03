//
//  RegisterView.swift
//  MicroTasks
//
//  Created by Sanskar Pal on 7/12/23.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start Organizing ToDo's", angle: -15, background: .orange)
            
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                TLButton(title: "Create Account", background: .green){
                    viewModel.register()
                }
                .padding(20)
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
