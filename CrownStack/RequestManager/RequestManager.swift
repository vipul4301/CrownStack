//
//  RequestManager.swift
//  CrownStack
//
//  Created by Vipul Kumar on 24/07/21.
//

import Foundation
public struct RequestManager<T: Decodable> {
    let path: String
}

public enum NetworkError: Error {
    case badURL
}

extension RequestManager {
    public func asyncResourceLoading(completion: @escaping (Result<T, NetworkError>) -> ()) {
        if let path = Bundle.main.path(forResource: path, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                } catch  {
                    print(error.localizedDescription)
                    completion(.failure(.badURL))
                }
            } catch {
                // handle error
                completion(.failure(.badURL))
            }
        }
        
        
    }
}
