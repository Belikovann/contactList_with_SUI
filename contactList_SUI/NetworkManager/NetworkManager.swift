//
//  NetworkManager.swift
//  contactList_SUI
//
//  Created by Аня Беликова on 29.09.2023.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
        
    func fetchUsers() async throws -> [User] {
        let (data, _) = try await URLSession.shared.data(from: Link.allUsers.url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let usersQuery = try decoder.decode(UsersQuery.self, from: data)
            return usersQuery.data
        } catch {
            throw NetworkError.decodingError
        }
    }
    
    func postUser(_ user: User) async throws -> PostUserQuery {
        var request = URLRequest(url: Link.singleUser.url)
        request.httpMethod = "POST"
        request.setValue("application.json", forHTTPHeaderField: "Content-Type")
        
        let userQuery = PostUserQuery(
            firstName: user.firstName,
            lastName: user.lastName
        )

        let jsonData = try? JSONEncoder().encode(userQuery)
        request.httpBody = jsonData
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        do {
            return try JSONDecoder().decode(PostUserQuery.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}


extension NetworkManager {
    enum Link {
        case allUsers
        case singleUser
        
        var url: URL {
            switch self {
            case .allUsers:
                return URL(string: "https://reqres.in/api/users?delay=1")!
            case .singleUser:
                return URL(string: "https://reqres.in/api/users/")!
            }
        }
    }
}

enum NetworkError: Error {
    case decodingError
    
    var title: String {
        switch self {
        case .decodingError:
            return "Can`t decode received data"
        }
    }
}
