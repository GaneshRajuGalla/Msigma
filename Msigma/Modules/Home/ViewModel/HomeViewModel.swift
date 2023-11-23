//
//  HomeViewModel.swift
//  Msigma
//
//  Created by Ganesh Raju Galla on 23/11/23.
//

import Foundation

class HomeViewModel:ObservableObject{
    
    // MARK: - Properties
    
    @Published var courceData:[CourceModel] = CourceModel.getData()
    
    // MARK: - Methods
    
}
