//
//  SearchBarController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 08.01.2023.
//

import UIKit

class SearchBarViewController: UIViewController, UITextFieldDelegate, SearchBarViewDelegete {
    
    // MARK: - Private Properties
    private var searchBarView: SearchBarView {
        return self.view as! SearchBarView }
    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        self.view = SearchBarView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarView.delegete = self
        searchBarView.textField.delegate = self
    }
    
    //MARK: - SearchBarViewDelegete
    func serchBattonAction() {
        defer {
            self.searchBarView.textField.resignFirstResponder()
        }
        if let text = searchBarView.textField.text {
            print(text)
        }
    }
    
    //MARK: - UItextFieldDelegates
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.searchBarView.textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = searchBarView.textField.text {
            print(text)
        }
        self.searchBarView.textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_: UITextField) {
        
    }
}
