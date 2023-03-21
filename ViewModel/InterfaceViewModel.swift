//
//  InterfaceViewModel.swift
//  FoodProject
//
//  Created by Mehmet Said Dede on 10.02.2023.
//

import Foundation


class InterfaceListModel : ObservableObject {
    
    @Published var interfaceList = [InterfaceViewModel]()
    
    let localeservice = Localservice()
    
    func downloadInterfaces() async {
        
        do {
            let interfaces = try await localeservice.download(Contants.Paths.baseUrl)
            DispatchQueue.main.async {
                self.interfaceList = interfaces.map(InterfaceViewModel.init)
                
            }
        }catch {
            print(error)
        }
    }
}


struct InterfaceViewModel {
    
    let interface : Interface
    
    var category : String {
        interface.category
    }
    
    var image : URL {
        interface.image
    }
    
    var id : Int {
        interface.id
    }
}


