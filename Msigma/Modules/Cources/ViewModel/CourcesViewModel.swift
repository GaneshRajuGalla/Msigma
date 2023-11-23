//
//  CourcesViewModel.swift
//  Msigma
//
//  Created by Ganesh Raju Galla on 23/11/23.
//

import Foundation

class CourcesViewModel: ObservableObject{
    
    // MARK: - Properties
    
    var courceTitle:String
    @Published var searchText:String = ""
    @Published var branches: [Branch]?
    var searchBranches:[Branch]?
    
    // MARK: - Init
    
    init(courceTitle: String) {
        self.courceTitle = courceTitle
    }
    
    
    // MARK: - Methods
    
    // while searching update data
    func updateBranches(searchText:String) {
        if !searchText.isEmpty{
            let filteredBranches = branches?.compactMap { branch in
                let titleQuery = branch.name?.range(of: searchText,options: .caseInsensitive) != nil
                let shortQuery = branch.short?.range(of: searchText,options: .caseInsensitive) != nil
                return (titleQuery || shortQuery) ? branch : nil
            }
            branches = filteredBranches
        } else {
            branches = searchBranches
        }
    }
    
    
    @MainActor
    func getBranches() async{
        do{
            let cources:Courses = try await APICleint.sendRequest(endpoint: .cources(courceName: courceTitle.convertToLowerCaseAbbreviation()))
            branches = cources.branches
            searchBranches = cources.branches
        }catch{
            print("Error: \(error.localizedDescription)")
        }
    }
}
