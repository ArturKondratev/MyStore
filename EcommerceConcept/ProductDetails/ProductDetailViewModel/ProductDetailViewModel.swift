//
//  ProductDetailViewModel.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 22.01.2023.
//

import UIKit

class ProductDetailViewModel {
    
    // MARK: - Observable properties
   // var productInCart = Observable<[CartModel]>([])
    
    // MARK: - Properties
    var myCartSeaver: MyCardSaver
    weak var viewController: UIViewController?
    
    //MARK: - Init
    init(myCardSeaver: MyCardSaver) {
        self.myCartSeaver = myCardSeaver
    }
    
    //MARK: - Functions
    func addToCartToProduct(_ model: ProductModel) {
        let saveModel = CartModel(product: model, count: 1)
        myCartSeaver.addProductToCard(product: saveModel)
    }
    
    func tabCartButton() {
        let myCartVC = MyCartBuilder.build()
        viewController?.navigationController?.pushViewController(myCartVC, animated: true)
    }
    
}
