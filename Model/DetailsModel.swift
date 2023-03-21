//
//  DetailsModel.swift
//  FoodProject
//
//  Created by Mehmet Said Dede on 14.02.2023.
//

import Foundation

struct Details: Codable {
    let category, foodName: String?
    let foodImage: URL?
    let foodDetail: [FoodDetail]?
    let foodTitle: String?
    let foodIngredients: [String]?
    let foodHowDoTitle: String?
    let foodHowDoDetail: [String]?

    enum CodingKeys: String, CodingKey {
        case category
        case foodName = "food_name"
        case foodImage = "food_image"
        case foodDetail = "food_detail"
        case foodTitle = "food_title"
        case foodIngredients = "food_ingredients"
        case foodHowDoTitle = "food_how_do_title"
        case foodHowDoDetail = "food_how_do_detail"
    }
}

enum FoodDetail: String, Codable {
    case empty = "- "
    case the0Kişilik = "0 kişilik"
    case the10Dakika = "10 dakika "
    case the10Kişilik = "10 kişilik"
    case the10Saat = "10 saat "
    case the11Dakika = "11 dakika "
    case the12Dakika = "12 dakika "
    case the12Kişilik = "12 kişilik"
    case the14Kişilik = "14 kişilik"
    case the15Dakika = "15 dakika "
    case the15Kişilik = "15 kişilik"
    case the16Kişilik = "16 kişilik"
    case the17Dakika = "17 dakika "
    case the18Dakika = "18 dakika "
    case the18Kişilik = "18 kişilik"
    case the19Dakika = "19 dakika "
    case the1Dakika = "1 dakika "
    case the1Kişilik = "1 kişilik"
    case the1Saat = "1 saat "
    case the1Saat10Dakika = "1 saat 10 dakika "
    case the1Saat15Dakika = "1 saat 15 dakika "
    case the1Saat20Dakika = "1 saat 20 dakika "
    case the1Saat25Dakika = "1 saat 25 dakika "
    case the1Saat30Dakika = "1 saat 30 dakika "
    case the1Saat40Dakika = "1 saat 40 dakika "
    case the1Saat50Dakika = "1 saat 50 dakika "
    case the1Saat5Dakika = "1 saat 5 dakika "
    case the20Dakika = "20 dakika "
    case the20Kişilik = "20 kişilik"
    case the22Dakika = "22 dakika "
    case the24Kişilik = "24 kişilik"
    case the25Dakika = "25 dakika "
    case the25Kişilik = "25 kişilik"
    case the2Dakika = "2 dakika "
    case the2Kişilik = "2 kişilik"
    case the2Saat = "2 saat "
    case the2Saat10Dakika = "2 saat 10 dakika "
    case the2Saat20Dakika = "2 saat 20 dakika "
    case the2Saat30Dakika = "2 saat 30 dakika "
    case the30Dakika = "30 dakika "
    case the35Dakika = "35 dakika "
    case the37Dakika = "37 dakika "
    case the3Dakika = "3 dakika "
    case the3Kişilik = "3 kişilik"
    case the3Saat = "3 saat "
    case the3Saat20Dakika = "3 saat 20 dakika "
    case the3Saat30Dakika = "3 saat 30 dakika "
    case the40Dakika = "40 dakika "
    case the44Dakika = "44 dakika "
    case the45Dakika = "45 dakika "
    case the46Dakika = "46 dakika "
    case the48Dakika = "48 dakika "
    case the4Dakika = "4 dakika "
    case the4Kişilik = "4 kişilik"
    case the4Saat = "4 saat "
    case the4Saat30Dakika = "4 saat 30 dakika "
    case the50Dakika = "50 dakika "
    case the55Dakika = "55 dakika "
    case the56Dakika = "56 dakika "
    case the5Dakika = "5 dakika "
    case the5Kişilik = "5 kişilik"
    case the60Kişilik = "60 kişilik"
    case the6Dakika = "6 dakika "
    case the6Kişilik = "6 kişilik"
    case the6Saat = "6 saat "
    case the7Dakika = "7 dakika "
    case the7Kişilik = "7 kişilik"
    case the8Dakika = "8 dakika "
    case the8Kişilik = "8 kişilik"
    case the98Kişilik = "98 kişilik"
    case the9Dakika = "9 dakika "
    case the9Kişilik = "9 kişilik"
}

