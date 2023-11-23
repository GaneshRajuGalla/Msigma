//
//  LaunchScreen.swift
//  Msigma
//
//  Created by Ganesh Raju Galla on 22/11/23.
//

import SwiftUI

struct LaunchScreen: View {
    
    // MARK: - Properties
    
    @State private var isLoading:Bool = true
    

    // MARK: - Body
    
    var body: some View {
        ZStack{
            if isLoading{
                splashScreenView()
            }else {
                HomeView()
            }
        }.onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                withAnimation {
                    isLoading.toggle()
                }
            }
        })
    }
}

extension LaunchScreen{
    
    // TODO: - SplashScreenView
    private func splashScreenView() -> some View{
        ZStack {
            
            // background
            Color.black
                .ignoresSafeArea()
            
            
            // image
            Image(uiImage: .msigma)
                .resizable()
                .scaledToFit()
                .frame(width: .infinity)
        }
    }
}


#Preview {
    LaunchScreen()
}
