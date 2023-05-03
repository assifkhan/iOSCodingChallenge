//
//  CharactersResponseModel.swift
//  iOSCodingChallenge
//
//  Created by Asif Khan on 5/3/23.
//

import Foundation

// MARK: - CharactersResponseModel
struct CharactersResponseModel: Decodable {
    let heading:String
    let relatedTopics: [RelatedTopic]

    enum CodingKeys: String, CodingKey {
        case relatedTopics = "RelatedTopics"
        case heading = "Heading"
    }
}

// MARK: - RelatedTopic
struct RelatedTopic: Decodable {
    let firstURL: String
    let icon: Icon
    let result, text: String

    enum CodingKeys: String, CodingKey {
        case firstURL = "FirstURL"
        case icon = "Icon"
        case result = "Result"
        case text = "Text"
    }
}

// MARK: - Icon
struct Icon: Decodable {
    let height, url, width: String

    enum CodingKeys: String, CodingKey {
        case height = "Height"
        case url = "URL"
        case width = "Width"
    }
}
