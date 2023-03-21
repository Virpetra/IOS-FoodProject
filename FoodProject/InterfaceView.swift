//
//  ContentView.swift
//  FoodProject
//
//  Created by Mehmet Said Dede on 10.02.2023.
//

import SwiftUI

struct InterfaceView: View {
    
    
    @ObservedObject var interfaceListViewModel : InterfaceListModel
    @State private var searchText = ""
    
    init(){
        self.interfaceListViewModel = InterfaceListModel()
    }
    
    var filteredInterfaces : [InterfaceViewModel] {
        if searchText.isEmpty {
            return interfaceListViewModel.interfaceList
        }else {
            return interfaceListViewModel.interfaceList.filter { $0.category.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    TextField("Yemek Ara...", text: $searchText)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 10)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 24))
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                .padding()
                            
                ScrollView{
                    ForEach(filteredInterfaces,id: \.category) { interface in
                        NavigationLink(destination: DetailsView(category: interface.category)){
                            
                            ZStack{
                                AsyncImage(url: interface.image) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    
                                }placeholder: {
                                    Color.gray
                                }
                                .frame(width: .infinity,height: UIScreen.main.bounds.height * 0.275)
                                .clipShape(RoundedRectangle(cornerRadius: 20,style: .continuous))
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black,lineWidth: 3))
                                .shadow(radius: 20)
                                .padding()
                                Text(interface.category)
                                    .font(.largeTitle)
                                    .offset(y: UIScreen.main.bounds.height * 0.09)
                                    .foregroundColor(.white)
                                
                            }
                        }
                        
                    }
                }
                .task {
                    await interfaceListViewModel.downloadInterfaces()
                }.navigationTitle("Yemek Tarifleri")
                
                
            }
            
        }
        
    }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            InterfaceView()
        }
    }
}
    
    
    

