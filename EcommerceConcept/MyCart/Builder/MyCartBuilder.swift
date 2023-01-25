//
//  MyCartBuilder.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 22.01.2023.
//

import UIKit

class MyCartBuilder {
    static func build() -> UIViewController {
        let myCardSeaver = MyCardSaver()
        let viewModel = MyCartViewModel(myCardSeaver: myCardSeaver)
        let viewController = MyCartViewController(viewModel: viewModel)
        return viewController
    }
}
