//
//  MicroTasksApp.swift
//  MicroTasks
//
//  Created by Sanskar Pal on 7/12/23.
//
import FirebaseCore
import SwiftUI

@main
struct MicroTasksApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
