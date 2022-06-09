//
//  Model.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 10/16/21.
//

import Foundation

struct Survey: Identifiable, Decodable {
    var id: Int
    var name: String
    var language: String
    var description: String
    var questions: [Questions]    
}

struct Questions: Identifiable, Decodable {
    var id: Int
    var title: String
    var rating: [String]
}
