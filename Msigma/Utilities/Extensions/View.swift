//
//  View.swift
//  Msigma
//
//  Created by Ganesh Raju Galla on 23/11/23.
//

import Foundation
import SwiftUI

extension View{
    
    // TODO: - WithCustomSearchView
    
    func withCustomSearchView() -> some View{
        self.modifier(SearchBarView())
    }
}
