//
//  Topic.swift
//  Week01
//
//  Created by MD Abir Hasan Zoha on 9/25/21.
//

import Foundation

class Topic: Codable{
    let title: String
    let timeInSec: Int
    let summary: String
    let keyPoints: [String]
    let imageName: String
    let difficulty: Difficulty
    private(set) var progress: Float
    
    init(
        title: String,
        timeInSec: Int,
        summary: String,
        keyPoints: [String],
        imageName: String,
        difficulty: Difficulty,
        progress: Float
    ){
        self.title = title
        self.timeInSec = timeInSec
        self.summary = summary
        self.keyPoints = keyPoints
        self.imageName = imageName
        self.difficulty = difficulty
        self.progress = progress
    }
    
    func setProgress(progress: Float){
        self.progress = progress
    }
}

enum Difficulty: String, Codable{
    case easy = "Easy"
    case intermediate = "Intermediate"
    case hard = "Hard"
}
