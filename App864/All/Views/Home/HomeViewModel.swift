//
//  HomeViewModel.swift
//  App864
//
//  Created by IGOR on 23/08/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @AppStorage("total") var total: Int = 0
    
    @AppStorage("wishs") var wishs: Int = 0
    @AppStorage("ip") var ip: Int = 0
    
    @Published var desPhotos: [String] = ["car", "car2", "house"]
    @Published var currentDesPhoto = ""
    
    @Published var avPhotos: [String] = ["av"]

    @AppStorage("PPhoto") var PPhoto: String = ""
    @AppStorage("PName") var PName: String = ""
    @Published var selPPhoto = ""
    @Published var enterName = ""

    @Published var isAdd: Bool = false
    @Published var isAddGift: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var desName: String = ""
    @Published var desPhoto: String = ""
    @Published var desAcc: String = ""
    @Published var desCost: String = ""
    @Published var desCom: String = ""

    @Published var desires: [DesireModel] = []
    @Published var selectedDesire: DesireModel?
    
    func addDesire() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "DesireModel", into: context) as! DesireModel

        loan.desName = desName
        loan.desPhoto = desPhoto
        loan.desAcc = desAcc
        loan.desCost = desCost
        loan.desCom = desCom

        CoreDataStack.shared.saveContext()
    }

    func fetchDesires() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<DesireModel>(entityName: "DesireModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.desires = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.desires = []
        }
    }
}
