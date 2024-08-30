//
//  NotesViewModel.swift
//  App864
//
//  Created by IGOR on 24/08/2024.
//

import SwiftUI
import CoreData

final class NotesViewModel: ObservableObject {
    
    @AppStorage("wishs") var wishs: Int = 0
    @AppStorage("ip") var ip: Int = 0
    
    @Published var avPhotos: [String] = ["av"]

    @AppStorage("PPhoto") var PPhoto: String = ""
    @AppStorage("PName") var PName: String = ""
    @Published var selPPhoto = ""
    @Published var enterName = ""
    
    @Published var wPhotos: [String] = ["p1"]
    @Published var currentWPhoto = ""
    
    @Published var notPhotos: [String] = ["1", "2", "3"]
    @Published var currentNotPhoto = ""
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var notPhoto: String = ""
    @Published var notName: String = ""
    @Published var notST: String = ""
    @Published var notTxt: String = ""

    @Published var notes: [NotesModel] = []
    @Published var selectedNote: NotesModel?
    
    func addNote() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "NotesModel", into: context) as! NotesModel

        loan.notPhoto = notPhoto
        loan.notName = notName
        loan.notST = notST
        loan.notTxt = notTxt

        CoreDataStack.shared.saveContext()
    }

    func fetchNotes() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NotesModel>(entityName: "NotesModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.notes = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.notes = []
        }
    }
}
