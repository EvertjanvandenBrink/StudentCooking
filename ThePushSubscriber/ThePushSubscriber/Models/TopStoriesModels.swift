//
//  TopStoriesModels.swift
//  ThePushSubscriber
//
//  Created by Evertjan van den Brink on 14/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import Foundation

// To parse the JSON, add this file to your project and do:
//
//   let topStories = try? newJSONDecoder().decode(TopStories.self, from: jsonData)
struct HNResult: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let author, title, description: String
    let url: String
    let urlToImage: String
    let publishedAt: Date
    let content: String
}

struct Source: Codable {
    let id: JSONNull?
    let name: String
}

// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
