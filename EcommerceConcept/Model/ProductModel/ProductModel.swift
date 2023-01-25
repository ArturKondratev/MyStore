//
//  PhonesModel.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 19.01.2023.
//

import Foundation

enum ProductType: Codable, Equatable {
    case Phones
    case Computer
    case Health
    case Books
    case PlayStation
    case Xbox
}

struct ProductModel: Codable, Equatable {
    var type: ProductType
    var id: Int
    var title: String
    var subtitle: String
    var picture: [String]
    var isNew: Bool
    var hotSales: Bool
    var isFavorites: Bool
    var rating: Float
    var discounPrice: Int
    var priceWithoutPrice: Int
}

struct DeviceTypeModel {
    let name: String
    let icon: String
    let type: ProductType
}
