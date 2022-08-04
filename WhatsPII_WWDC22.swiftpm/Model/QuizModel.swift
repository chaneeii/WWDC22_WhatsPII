//
//  File.swift
//  
//
//  Created by Chanhee Jeong on 2022/08/04.
//

import Foundation

struct QuizModel: Identifiable {
    let id: UUID
    var category: String
    var contents: [String]
    var answers: [String]
    var attachedFile: (String,Bool)
    var attachedImage: (String,Bool)
    var solution: String
    
    init(id: UUID = UUID(), category: String, contents: [String], answers: [String], attachedFile: (String,Bool), attachedImage: (String,Bool), solution: String ) {
        self.id = id
        self.category = category
        self.contents = contents
        self.answers = answers
        self.attachedFile = attachedFile
        self.attachedImage = attachedImage
        self.solution = solution
    }
}
