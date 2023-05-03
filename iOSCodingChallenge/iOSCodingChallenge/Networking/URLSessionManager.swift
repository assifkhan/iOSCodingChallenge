//
//  URLSessionManager.swift
//  iOSCodingChallenge
//
//  Created by Asif Khan on 5/3/23.
//

import Foundation

struct URLSessionManager {
    
    private init(){}
    static let shared = URLSessionManager()
    
    func fetchData<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
