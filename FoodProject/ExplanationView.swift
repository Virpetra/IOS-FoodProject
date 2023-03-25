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
                    .frame(width: UIScreen.main.bounds.width * 0.91, height: UIScreen.main.bounds.height * 0.275)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 3))
                    .shadow(radius: 20)
                    .padding()
                    Text(explanation.foodname ?? "")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding(.bottom, 10)
                    HStack{
                        Image(systemName: "person.2.fill")
                        Text(explanation.fooddetail?[0].rawValue ?? "")
                        Image(systemName: "clock.fill")
                        Text(explanation.fooddetail?[1].rawValue ?? "")
                        Image(systemName: "stopwatch.fill")
                        Text(explanation.fooddetail?[2].rawValue ?? "")
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
