//
//  MyCardSeaver.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 20.01.2023.
//

import Foundation

struct CartModel: Codable, Equatable {
    let product: ProductModel
    var count: Int
}

class MyCardSaver {
    
    // MARK: - Properties
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let key = "myCard"
    
    // MARK: - Functions
    func addProductToCard(product: CartModel) {
        do {
            var list = self.getProductsInCart()
            
            if !list.contains(product) {
                list.append(product)
            } else {
            
                if self.plusProduct(product: product) {
                    
                }
                
            }
            let data = try encoder.encode(list)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func getProductsInCart() -> [CartModel] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try decoder.decode([CartModel].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
    func plusProduct(product: CartModel) -> Bool  {
        do {
            var list = self.getProductsInCart()
            guard let index = list.firstIndex(where: {$0.product.title == product.product.title }) else { return false}
            
            var prod = list[index]
            list.remove(at: index)
            prod.count += 1
            list.insert(prod, at: index)
        
            let data = try encoder.encode(list)
            UserDefaults.standard.set(data, forKey: key)
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func minusProduct(product: CartModel) -> Bool  {
        do {
            var list = self.getProductsInCart()
            guard let index = list.firstIndex(where: {$0.product.title == product.product.title }) else { return false}
            
            var prod = list[index]
            
            if prod.count == 1 {
                list.remove(at: index)
            } else {
                list.remove(at: index)
                prod.count -= 1
                list.insert(prod, at: index)
            }
            let data = try encoder.encode(list)
            UserDefaults.standard.set(data, forKey: key)
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func deleteProduct(product: CartModel) -> Bool {
        do {
            var list = self.getProductsInCart()
            guard let index = list.firstIndex(where: {$0.product.title == product.product.title }) else { return false}
            list.remove(at: index)
            
            let data = try encoder.encode(list)
            UserDefaults.standard.set(data, forKey: key)
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func clearCart() {
        let products: [CartModel] = []
        do {
            let data = try encoder.encode(products)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    
}
