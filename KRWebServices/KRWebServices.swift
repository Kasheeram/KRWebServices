//
//  KRWebServices.swift
//  KRWebServices
//
//  Created by kashee on 31/05/24.
//

import Foundation

public class KRWebServices {
    public static let shared = KRWebServices()
    
    private init() {}
    
    public func request(url: URL, method: String, completion: @escaping (Result<Data, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}


extension KRWebServices {
    public func requestJSON(url: URL, method: String, completion: @escaping (Result<Any, Error>) -> Void) {
        request(url: url, method: method) { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    completion(.success(json))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
