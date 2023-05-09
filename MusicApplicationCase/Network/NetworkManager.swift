//
//  NetworkManager.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 9.05.2023.
//

import Foundation

struct NetworkManager {
    static let shared = NetworkManager()
}

func getNetworkManager<E:Codable>(url:String?,completion:@escaping(Result<E,Error>)->()){
    guard let url = URL(string: url ?? "") else {return}
    let session = URLSession.shared
    session.dataTask(with: URLRequest(url: url)) {data, response, error in}
    if let data = data {
        do{
            let decoded = try JSONDecoder().decode(E.self, from: data)
            completion(.success(decoded))
        }
        catch{
            print(String(describing: error))
            print(error.localizedDescription)
        }
    }
    if let error = error {
        completion(.failure(error))
    }
}
    .resume()



    
    
