//
//  NetworkService.swift
//  ExamBattlebucks
//
//  Created by selegic mac 01 on 03/10/25.
//

import SwiftUI

class NetworkService {
    static let shared = NetworkService()
    
    func fetchUsers(completion: @escaping (Result<[Model], Error>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let users = try JSONDecoder().decode([Model].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
