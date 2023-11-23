//
//  Cources.swift
//  Msigma
//
//  Created by Ganesh Raju Galla on 23/11/23.
//

import Foundation

// MARK: - Courses
struct Courses: Codable {
    let status: String?
    let branches: [Branch]?
}

// MARK: - Branch
struct Branch: Codable {
    var id: Int
    let name, short: String?
}
