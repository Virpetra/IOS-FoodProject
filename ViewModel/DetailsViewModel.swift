//
//  DetailsViewModel.swift
//  FoodProject
//
//  Created by Mehmet Said Dede on 13.02.2023.
//

import Foundation


class DetailsListModel : ObservableObject {
    
    @Published var detailsList = [DetailsViewModel]()
    
    
    let localeservice2 = Localservice2()
    
    func downloadDetails() async {
        
        do {
            let detailss = try await localeservice2.download(SecondContants.secondPaths.secondBaseUrl)
            DispatchQueue.main.async {
                self.detailsList = detailss.map(DetailsViewModel.init)
            }
        }catch {
            print(error)
        }
    }
}

struct DetailsViewModel {
    
    let details : Details
    
    
    var category : String? {
        details.category
    }
    var foodname : String? {
        details.foodName
    }
    var foodImage : URL? {
        details.foodImage
    }
    var fooddetail : [FoodDetail]? {
       details.foodDetail
    }
    var foodtitle : String? {
        details.foodTitle
    }
    var foodıngredients : [String]? {
        details.foodIngredients
    }
    var foodhowdotitle : String? {
        details.foodHowDoTitle
    }
    var foodhowdodetail : [String]? {
        details.foodHowDoDetail
    }
}
    


