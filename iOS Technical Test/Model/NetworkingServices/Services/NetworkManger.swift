//
//  NetworkManger.swift
//  iOS Technical Test
//
//  Created by Rezk on 18/06/2023.
//

import Foundation

protocol NetworkManagerProtocol {
    static func fetchData<T: Decodable>(apiLink: String, completionHandler: @escaping (T?) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    
    static func fetchData<T: Decodable>(apiLink: String, completionHandler: @escaping (T?) -> Void) {
        guard let url = URL(string: apiLink) else {
            completionHandler(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                completionHandler(nil)
                return
            }
            
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(result)
                } catch {
                    print("Error decoding data: \(error)")
                    completionHandler(nil)
                }
            }
        }.resume()
    }
    
}
