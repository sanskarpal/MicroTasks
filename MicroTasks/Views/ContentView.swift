//
//  ContentView.swift
//  MicroTasks
//
//  Created by Sanskar Pal on 7/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewViewModel()
    
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            //signed in
            accountView
        }else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
