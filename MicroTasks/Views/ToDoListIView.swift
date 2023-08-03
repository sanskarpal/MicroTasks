//
//  ToDoListItemsView.swift
//  MicroTasks
//
//  Created by Sanskar Pal on 7/12/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }

    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .padding(.vertical,0.1)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                                
                        }
                }
                .listStyle(.automatic)
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    //Action
                    viewModel.showingNewItemView = true
                }label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $viewModel.showingNewItemView){
                    NewItemView(newItempresented: $viewModel.showingNewItemView)
                }
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "WKkH67hFvZdUysYs4J5QxxKGmA03")
    }
}
