////
////  MocDateService.swift
////  EcommerceConcept
////
////  Created by Артур Кондратьев on 13.01.2023.
////
//
//import Foundation
//
//class MocDateService {
//    
//    static func getDateForSelectCategory() -> [ProductType] {
//        return [
//            ProductType(name: "Phone", icon: "iphone", type: .Phones),
//            ProductType(name: "Computer", icon: "desktopcomputer", type: .Computer),
//            ProductType(name: "Health", icon: "bolt.heart", type: .Health),
//            ProductType(name: "Books", icon: "books.vertical", type: .Books),
//            ProductType(name: "PlayStation", icon: "logo.playstation", type: .PlayStation),
//            ProductType(name: "Xbox", icon: "logo.xbox", type: .Xbox),
//        ]
//    }
//    
//    static func getMocDataForHotSales() -> [HotMobileModel] {
//        return [
//            HotMobileModel(id: 1,
//                           isNew: true,
//                           title: "Iphone 14",
//                           subtitle: "Súper. Mega. Rápido.",
//                           icon: "1",
//                           isBuy: true),
//            HotMobileModel(id: 2,
//                           isNew: false,
//                           title: "Samsung Galaxy A71",
//                           subtitle: "Súper. Mega. Rápido.",
//                           icon: "2",
//                           isBuy: true),
//            HotMobileModel(id: 3,
//                           isNew: false,
//                           title: "Xiaomi Mi 11 ultra",
//                           subtitle: "Súper. Mega. Rápido.",
//                           icon: "3",
//                           isBuy: true)
//        ]
//    }
//    
//    static func getMocDataForBestSeller() -> [BestDevice] {
//        return [
//            BestDevice(id: 1,
//                       isFavorites: false,
//                       title: "Samsung Galaxy s20 Ultra",
//                       price_without_discount: 1047,
//                       discount_price: 1500,
//                       picture: "11"),
//            BestDevice(id: 2,
//                       isFavorites: true,
//                       title: "Xiaomi Mi 10 Pro",
//                       price_without_discount: 300,
//                       discount_price: 400,
//                       picture: "22"),
//            BestDevice(id: 3,
//                       isFavorites: false,
//                       title: "Samsung Note 20 Ultra",
//                       price_without_discount: 1150,
//                       discount_price: 1499,
//                       picture: "33"),
//            BestDevice(id: 4,
//                       isFavorites: true,
//                       title: "Iphone 14 Pro Max",
//                       price_without_discount: 1047,
//                       discount_price: 1500,
//                       picture: "44"),
//            BestDevice(id: 5,
//                       isFavorites: false,
//                       title: "Samsung Galaxy s20 Ultra",
//                       price_without_discount: 1047,
//                       discount_price: 1500,
//                       picture: "11"),
//            BestDevice(id: 6,
//                       isFavorites: true,
//                       title: "Xiaomi Mi 10 Pro",
//                       price_without_discount: 300,
//                       discount_price: 400,
//                       picture: "22"),
//            BestDevice(id: 7,
//                       isFavorites: true,
//                       title: "Samsung Note 20 Ultra",
//                       price_without_discount: 1150,
//                       discount_price: 1499,
//                       picture: "33"),
//            BestDevice(id: 1,
//                       isFavorites: true,
//                       title: "Iphone 14 Pro Max",
//                       price_without_discount: 1047,
//                       discount_price: 1500,
//                       picture: "44"),
//            BestDevice(id: 1,
//                       isFavorites: true,
//                       title: "Iphone 14 Pro Max",
//                       price_without_discount: 1047,
//                       discount_price: 1500,
//                       picture: "44")
//        ]
//    }
//}
