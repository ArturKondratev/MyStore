//
//  MyCartViewModel.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 22.01.2023.
//

import Foundation


class MyCartViewModel {
    // MARK: - Observable properties
    var productInCart = Observable<[CartModel]>([])
    var totalCost = Observable<Int>(0)
    
    // MARK: - Properties
    var myCartSaver: MyCardSaver
    
    // MARK: - Init
    init(myCardSeaver: MyCardSaver) {
        self.myCartSaver = myCardSeaver
    }
    
    // MARK: - Functions
    func loadData() {
        let allProdocts = myCartSaver.getProductsInCart()
        productInCart.value = allProdocts
        
        var total = 0
        for i in allProdocts {
            total += (i.count * i.product.discounPrice)
        }
        totalCost.value = total
    }
    
    func plusProduct(product: CartModel) {
        if myCartSaver.plusProduct(product: product) {
            loadData()
        }
    }
    
    func minusProduct(product: CartModel) {
        if myCartSaver.minusProduct(product: product) {
            loadData()
        }
    }
    
    func deleteProduct(product: CartModel) {
        if myCartSaver.deleteProduct(product: product) {
            productInCart.value = myCartSaver.getProductsInCart()
        }
        loadData()
    }
}
