//
//  WiahlistViewModel.swift
//  App864
//
//  Created by IGOR on 23/08/2024.
//

import SwiftUI
import CoreData

final class WiahlistViewModel: ObservableObject {
    
    @AppStorage("total") var total: Int = 0
    
    @AppStorage("wishs") var wishs: Int = 0
    @AppStorage("ip") var ip: Int = 0
    
    @Published var avPhotos: [String] = ["av"]

    @AppStorage("PPhoto") var PPhoto: String = ""
    @AppStorage("PName") var PName: String = ""
    @Published var selPPhoto = ""
    @Published var enterName = ""
    
    @Published var wPhotos: [String] = ["p1"]
    @Published var currentWPhoto = ""
    
    @Published var types: [String] = ["Wishlist", "Already purchased"]
    @Published var currentType = "Wishlist"
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var wName: String = ""
    @Published var wPhoto: String = ""
    @Published var wCost: String = ""

    @Published var wishes: [WishModel] = []
    @Published var selectedWish: WishModel?
    
    func addWish() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "WishModel", into: context) as! WishModel

        loan.wName = wName
        loan.wPhoto = wPhoto
        loan.wCost = wCost

        CoreDataStack.shared.saveContext()
    }

    func fetchWishs() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<WishModel>(entityName: "WishModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.wishes = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.wishes = []
        }
    }
    
    @AppStorage("already") var already: [String] = []
    
    func isHas(model: WishModel) -> Bool {
        
            return already.contains(model.wName ?? "")

    }
    
    func favoritesManager(model: WishModel) {
                    
            if already.contains(model.wName ?? "") {
                
                if let indexer = already.firstIndex(of: model.wName ?? "") {
                    
                    already.remove(at: indexer)
                }
                
            } else {
                
                already.append(model.wName ?? "")
            }
    }
    
    func getFilteredPodcasts2() -> [WishModel] {
        
        return wishes.filter{!already.contains($0.wName ?? "")}
    }
    
    func getFilteredPodcasts() -> [WishModel] {
        
        return wishes.filter{already.contains($0.wName ?? "")}
    }
    
    func favoritesManager(_ audio: WishModel) {
        
        guard let title = audio.wName else { return }
        
        if already.contains(title) {
            
            if let indexer = already.firstIndex(of: title) {
                
                already.remove(at: indexer)
            }
            
        } else {
            
            already.append(title)
        }
    }
    
    func isFavorited(_ audio: WishModel) -> Bool {
        
        guard let title = audio.wName else { return false }
        
        return already.contains(title) ? true : false
    }
}
