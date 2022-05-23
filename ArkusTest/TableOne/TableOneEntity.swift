//
//  TableOneEntity.swift
//  ArkusTest
//
//  Created by Mauricio Zarate on 22/05/22.
//

import Foundation

// MARK: - ArkaElement
struct ArkaElement: Codable {
    let placeID, placeName, address: String
    let category: Category
    let isOpenNow: IsOpenNow
    let latitude, longitude: Double
    let thumbnail: String
    let rating: Double
    let isPetFriendly: Bool
    let addressLine1, addressLine2, phoneNumber: String
    let site: String

    enum CodingKeys: String, CodingKey {
        case placeID = "PlaceId"
        case placeName = "PlaceName"
        case address = "Address"
        case category = "Category"
        case isOpenNow = "IsOpenNow"
        case latitude = "Latitude"
        case longitude = "Longitude"
        case thumbnail = "Thumbnail"
        case rating = "Rating"
        case isPetFriendly = "IsPetFriendly"
        case addressLine1 = "AddressLine1"
        case addressLine2 = "AddressLine2"
        case phoneNumber = "PhoneNumber"
        case site = "Site"
    }
}

enum Category: String, Codable {
    case bar = "bar"
    case cafe = "cafe"
    case liquorStore = "liquor_store"
    case mealTakeaway = "meal_takeaway"
    case restaurant = "restaurant"
    case store = "store"
}

enum IsOpenNow: String, Codable {
    case openNow = "Open now"
}

typealias Arka = [ArkaElement]

