//
//  SelectViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 17.01.2023.
//

import UIKit

class SelectViewController: UIViewController {

    // MARK: - Private Properties
    private var selectView: SelectView {
        return self.view as! SelectView
    }
    
    // MARK: - Init
    init(product: ProductModel) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        self.view = SelectView()
        view.backgroundColor = .mainBackgroundColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
