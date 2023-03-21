//
//  DetailsView.swift
//  FoodProject
//
//  Created by Mehmet Said Dede on 13.02.2023.
//

import SwiftUI

struct DetailsView: View {
    
    var category: String
    
    @ObservedObject var detailsListViewModel : DetailsListModel
    
    init(category: String) {
        self.category = category
        self.detailsListViewModel = DetailsListModel()
        
    }
    
    
    var body: some View {
        
        ScrollView{
            ForEach(detailsListViewModel.detailsList.filter( { $0.category == category} ), id: \.foodname) { detail in
                NavigationLink(destination: ExplanationView(foodName: detail.foodname ?? ""),
                    label: {
                        ZStack{
                            AsyncImage(url: detail.foodImage) { image in
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
                            Text((detail.foodname ?? ""))
                                .font(.largeTitle)
                                .offset(y: UIScreen.main.bounds.height * 0.09)
                                .foregroundColor(.white)
                        }
                    })
            }
            .task {
                await detailsListViewModel.downloadDetails()
            }
            .navigationTitle(category)
        }
    }
}



struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(category: "Akşam Yemeği")
    }
}
 


