//
//  NetworkRequest.swift
//  TopQuestionsUIKit
//
//  Created by Jesus Cruz on 25/06/21.
//

import Foundation
import UIKit

// MARK: - NetworkRequest
public class NetworkManager {
    public static let shared = NetworkManager()
    
    public init() {}
    
    // Result<error, success>
    public func fetchTopQuestions(completion: @escaping (([Question]) -> ()) ) {
        let url = APIURLResources.getQuestionsURL()
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            print(response)
            let decoder = JSONDecoder()
            var resp : [Question] = []
            
            
            
            if let secureData = data {
                
                let items = try! decoder.decode(Items.self, from: secureData)
                resp = items.items!
            }
            
            completion(resp)
        }.resume()
    }
}



// MARK: - APIURLResources
struct APIURLResources {
    static public func getQuestionsURL() -> URL {
        var components = URLComponents(string: "https://api.stackexchange.com/2.2/questions")!
        components.queryItems = [
            URLQueryItem(name: "site", value: "stackoverflow"),
            URLQueryItem(name: "order", value: "desc"),
            URLQueryItem(name: "sort", value: "votes"),
            URLQueryItem(name: "tagged", value: "swiftui"),
            URLQueryItem(name: "pagesize", value: "10")
        ]
        return components.url!
    }
    
    static func getQuestionsDetailURL(id: Int) -> URL {
        var components = URLComponents(string: "https://api.stackexchange.com/2.2/questions/\(id)")!
        components.queryItems = [
            URLQueryItem(name: "site", value: "stackoverflow"),
            URLQueryItem(name: "order", value: "desc"),
            URLQueryItem(name: "sort", value: "votes"),
            URLQueryItem(name: "tagged", value: "swiftui"),
            URLQueryItem(name: "pagesize", value: "10"),
            URLQueryItem(name: "filter", value: "!9_bDDxJY5")
        ]
        return components.url!
    }
}
