//
//  News.swift
//  Corona Tracker
//
//  Created by ercan on 16.03.2020.
//  Copyright © 2020 Ercan. All rights reserved.
//

struct News : Codable{
    let results: [ResultNewsData]
    let success: Bool
}

struct ResultNewsData : Codable{
    let title, summary: String
    let infoSource: String
    let sourceUrl: String
    let pubDate: Int
}
