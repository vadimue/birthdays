//
//  PersonListService.swift
//  Birthdays
//
//  Created by Vadym Brusko on 15.07.2022.
//

import Foundation

enum NetworkError: Error {
    case somethingWentWrong
}

protocol PersonListServiceProtocol {
    func fetchPersons(completionHandler: @escaping ((Result<PersonList, Error>) -> Void))
}

class PersonListService: PersonListServiceProtocol {
    func fetchPersons(completionHandler: @escaping ((Result<PersonList, Error>) -> Void)) {
        guard let url = URL(string: "https://randomuser.me/api/?results=100&seed=chalkboard&inc=name,dob") else {
            completionHandler(.failure(NetworkError.somethingWentWrong))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, error, response in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(.failure(NetworkError.somethingWentWrong))
                }
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(.iso8601Custom)
                let response = try decoder.decode(PersonList.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(response))
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            }
        }
        task.resume()
    }
}
