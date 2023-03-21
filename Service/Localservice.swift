//
//  Localservice.swift
//  FoodProject
//
//  Created by Mehmet Said Dede on 10.02.2023.
//

import Foundation

class Localservice {
    
    func download(_ resource: String) async throws -> [Interface] {
        
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
         fatalError("Resource not found")
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        
        return try JSONDecoder().decode([Interface].self, from: data)
        
    }
}

class Localservice2 {
    
    func download(_ resource: String) async throws -> [Details] {
        
        guard let path2 = Bundle.main.path(forResource: resource, ofType: "json") else {
         fatalError("Resource not found")
        }
        
        let data = try Data(contentsOf: URL(filePath: path2))
        
        return try JSONDecoder().decode([Details].self, from: data)
        
    }
}

class Localservice3 {
    
    func download(_ resource: String) async throws -> [Details] {
        guard let path2 = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Resource not found")
        }
        let data = try Data(contentsOf: URL(filePath: path2))
        let details = try JSONDecoder().decode([Details].self, from: data)
        let akşamYemeğiDetails = details.filter { $0.category == "Akşam Yemeği" }
        return akşamYemeğiDetails
    }
}





