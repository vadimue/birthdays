//
//  Person.swift
//  Birthdays
//
//  Created by Vadym Brusko on 15.07.2022.
//

import Foundation

struct PersonList: Codable {
    var results: [Person]
}

struct Person: Codable {
    let name: Name
    let dob: Dob
}

struct Dob: Codable {
    let date: Date
    let age: Int
}

struct Name: Codable {
    let title, first, last: String
}

extension Name {
    var full: String? {
        return "\(first) \(last)"
    }
    
    var initials: String? {
        if let first = first.first, let last = last.first {
            return "\(first)\(last)"
        } else {
            return nil
        }
    }
}

extension Dob {
    var dateString: String? {
        DateFormatter.ddMMyyyy.string(from: date)
    }
}
