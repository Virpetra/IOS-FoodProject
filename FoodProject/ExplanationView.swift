//
//  ExplanationView.swift
//  FoodProject
//
//  Created by Mehmet Said Dede on 19.02.2023.
//

import SwiftUI

struct ExplanationView: View {
    
    var foodName: String
    @ObservedObject var detailsListViewModel: DetailsListModel
    
    init(foodName: String) {
        self.foodName = foodName
        self.detailsListViewModel = DetailsListModel()
    }
        
    var body: some View {
        ScrollView {
            if let explanation = detailsListViewModel.detailsList.filter({ $0.foodname == foodName }).first {
                VStack {
                    AsyncImage(url: explanation.foodImage) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: .infinity, height: UIScreen.main.bounds.height * 0.275)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 3))
                    .shadow(radius: 20)
                    .padding()
                    Text(explanation.foodname ?? "")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding(.bottom, 10)
                    HStack{
                        Text(explanation.fooddetail?.map { $0.rawValue }.joined(separator: "  ") ?? "")
                    }
                    .padding(.bottom, 10)
                    VStack{
                            Text(explanation.foodtitle ?? "")
                                .foregroundColor(.blue)
                                .font(.title3)
                                .bold()
                        Spacer()
                        
                        if let ingredients = explanation.foodıngredients {
                            VStack(alignment: .center, spacing: 5) {
                                ForEach(ingredients, id: \.self) { ingredient in
                                    Text(ingredient)
                                        .font(.body)
                                }
                            }
                        }
                        Text(explanation.foodhowdotitle ?? "")
                            .foregroundColor(.blue)
                            .font(.title3)
                            .bold()
                        
                        if let foodHowDoDetail = explanation.foodhowdodetail {
                            VStack(alignment: .leading, spacing: 5) {
                                ForEach(foodHowDoDetail, id: \.self) { howdodetail in
                                    Text(howdodetail)
                                        .padding(10)
                                }
                            }
                        }
                    }
                }
            }
        }.task {
            await detailsListViewModel.downloadDetails()
        }
    }
}
    
    struct ExplanationView_Previews: PreviewProvider {
        static var previews: some View {
            ExplanationView(foodName: "Kemik Suyu Çorbası")
        }
    }
