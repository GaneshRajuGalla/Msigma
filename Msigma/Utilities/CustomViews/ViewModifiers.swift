//
//  ViewModifiers.swift
//  Msigma
//
//  Created by Ganesh Raju Galla on 23/11/23.
//

import Foundation
import Foundation
import SwiftUI

// TODO: - SearchBarView

struct SearchBarView: ViewModifier{
    
    // MARK: - Body
    
    func body(content: Content) -> some View {
        content
            .padding(.leading, 40)
            .font(.callout)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .shadow(radius: 10, x: 0, y: 5)
            .tint(.black)
            .overlay(
                Image(.searchNew)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.leading,14),
                alignment: .leading
            )
    }
}
