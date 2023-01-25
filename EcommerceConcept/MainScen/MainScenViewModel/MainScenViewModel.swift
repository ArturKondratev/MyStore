//
//  MainScenViewModel.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 19.01.2023.
//

import UIKit

class MainScenViewModel {
    
    // MARK: - Observable properties
    var allCategory = Observable<[DeviceTypeModel]>([])
    var hotSales = Observable<[ProductModel]>([])
    var bestSeller = Observable<[ProductModel]>([])
    var countInCard = Observable<Int>(0)
    
    // MARK: - Properties
    weak var viewController: UIViewController?
    var appDataService: AppDataService
    let saveService = MyCardSaver()
    var selectProductType: ProductType = .Phones {
        didSet{
            loadData()
        }
    }
        
    // MARK: - Init
    init(appDataService: AppDataService) {
        self.appDataService = appDataService
    }

    //MARK: - Functions
    func didSelectCategiry(type: ProductType) {
        selectProductType = type
    }
    
    func didSelectItem(product: ProductModel) {
        let myCartVC = ProductDetailBuilder.build(product: product)
        viewController?.navigationController?.pushViewController(myCartVC, animated: true)
    }
    
    func tabCartButton() {
        let myCartVC = MyCartBuilder.build()
        viewController?.navigationController?.pushViewController(myCartVC, animated: true)
    }
    
    func mainScenViewDidLoad() {
        loadData()
        allCategory.value = appDataService.getDateForSelectCategory()
        countInCard.value = saveService.getProductsInCart().count
    }
    
    //MARK: - LoadDate
    func loadData() {
        switch selectProductType {
        case .Phones:
            let phones = appDataService.getPhones()
            hotSales.value = phones.filter({$0.hotSales == true})
            bestSeller.value = phones.filter({$0.hotSales == false})
        case .Computer:
            let computers = appDataService.getComputers()
            hotSales.value = computers.filter({ $0.hotSales == true})
            bestSeller.value = computers.filter({ $0.hotSales == false})
        case .Health:
            hotSales.value = []
            bestSeller.value = []
        case .Books:
            hotSales.value = []
            bestSeller.value = []
        case .PlayStation:
            hotSales.value = []
            bestSeller.value = []
        case .Xbox:
            hotSales.value = []
            bestSeller.value = []
        }
    }
    
}

