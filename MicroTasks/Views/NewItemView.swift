//
//  NewItemView.swift
//  MicroTasks
//
//  Created by Sanskar Pal on 7/12/23.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItempresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 80)
            
            Form{
                //Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                TLButton(
                    title: "Save",
                    background: .pink
                ){
                    if viewModel.canSave{
                        viewModel.save()
                        newItempresented = false
                    }
                    else{
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented:$viewModel.showAlert){
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select the due date that is today or newer"))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItempresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
