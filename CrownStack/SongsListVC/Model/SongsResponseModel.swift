//
//  SongsResponseModel.swift
//  CrownStack
//
//  Created by Vipul Kumar on 24/07/21.
//

import Foundation

struct SongsResponseModel : Codable {
    let resultCount : Int?
    let results : [ResultsModel]?

    enum CodingKeys: String, CodingKey {

        case resultCount = "resultCount"
        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        resultCount = try values.decodeIfPresent(Int.self, forKey: .resultCount)
        results = try values.decodeIfPresent([ResultsModel].self, forKey: .results)
    }

}
