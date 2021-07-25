//
//  Results.swift
//  CrownStack
//
//  Created by Vipul Kumar on 24/07/21.
//

import Foundation
struct ResultsModel : Codable {
    let wrapperType : String?
    let artistId : Int?
    let collectionId : Int?
    let artistName : String?
    let collectionName : String?
    let collectionCensoredName : String?
    let artistViewUrl : String?
    let collectionViewUrl : String?
    let artworkUrl60 : String?
    let artworkUrl100 : String?
    let collectionPrice : Double?
    let collectionExplicitness : String?
    let trackCount : Int?
    let copyright : String?
    let country : String?
    let currency : String?
    let releaseDate : String?
    let primaryGenreName : String?
    let previewUrl : String?
    let description : String?
    let trackTimeMillis: Int?

    enum CodingKeys: String, CodingKey {

        case wrapperType = "wrapperType"
        case artistId = "artistId"
        case collectionId = "collectionId"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case collectionCensoredName = "collectionCensoredName"
        case artistViewUrl = "artistViewUrl"
        case collectionViewUrl = "collectionViewUrl"
        case artworkUrl60 = "artworkUrl60"
        case artworkUrl100 = "artworkUrl100"
        case collectionPrice = "collectionPrice"
        case collectionExplicitness = "collectionExplicitness"
        case trackCount = "trackCount"
        case copyright = "copyright"
        case country = "country"
        case currency = "currency"
        case releaseDate = "releaseDate"
        case primaryGenreName = "primaryGenreName"
        case previewUrl = "previewUrl"
        case description = "description"
        case trackTimeMillis = "trackTimeMillis"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        wrapperType = try values.decodeIfPresent(String.self, forKey: .wrapperType)
        artistId = try values.decodeIfPresent(Int.self, forKey: .artistId)
        collectionId = try values.decodeIfPresent(Int.self, forKey: .collectionId)
        artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
        collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName)
        collectionCensoredName = try values.decodeIfPresent(String.self, forKey: .collectionCensoredName)
        artistViewUrl = try values.decodeIfPresent(String.self, forKey: .artistViewUrl)
        collectionViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionViewUrl)
        artworkUrl60 = try values.decodeIfPresent(String.self, forKey: .artworkUrl60)
        artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
        collectionPrice = try values.decodeIfPresent(Double.self, forKey: .collectionPrice)
        collectionExplicitness = try values.decodeIfPresent(String.self, forKey: .collectionExplicitness)
        trackCount = try values.decodeIfPresent(Int.self, forKey: .trackCount)
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
        previewUrl = try values.decodeIfPresent(String.self, forKey: .previewUrl)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        trackTimeMillis = try values.decodeIfPresent(Int.self, forKey: .trackTimeMillis)
    }

}
