//
//  LoginView.swift
//  MicroTasks
//
//  Created by Sanskar Pal on 7/12/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                
                //Header
                HeaderView(title: "To Do List", subtitle: "Get Things Done", angle: 15, background: .pink
                )
                
                //Login Form
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                        
                    }
                    
                    TextField("Email Adress", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    TLButton(title: "Log In", background: .blue){
                        viewModel.login()
                    }
                        .padding(20)
                }
                .offset(y: -50)
                
                //Create Account
                VStack{
                    Text("New around here?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                .padding(.bottom)
                Spacer()
                
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
