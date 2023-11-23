//
//  CourseView.swift
//  Msigma
//
//  Created by Ganesh Raju Galla on 23/11/23.
//

import SwiftUI

struct CourseView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel:CourcesViewModel
    private let columns:[GridItem] = Array(repeating: .init(.flexible(),spacing: 14,alignment: .center), count: 2)
    @Environment(\.dismiss) var dismiss
    
    
    // MARK: - Init
    
    init(courceTitle: String) {
        self._viewModel = StateObject(wrappedValue: CourcesViewModel(courceTitle: courceTitle))
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack{
            VStack{
                Image(.coursesBg)
                    .resizable()
                    .scaledToFit()
                    
                Spacer()
            }
            .ignoresSafeArea()
            
            courcesView()
        }
        .task {
            await viewModel.getBranches()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(.backBtn)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(Color.white)
                }
            }
        }
    }
}

extension CourseView{
    
    // TODO:  CourcesView
    
    private func courcesView() -> some View{
        VStack(spacing: 20){
            
            // serachBar
            searchBar()
                .padding()
            
            // branchesGrid
            branchesGrid()
        }
//        .padding()
    }
    
    // TODO: - SearchBar
    
    private func searchBar() -> some View{
        VStack(alignment: .leading,spacing: 24){
            VStack(alignment: .leading,spacing: 7){
                Text("All \(viewModel.courceTitle) Courses")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                Text(verbatim: .findYourBranch)
                    .font(.callout)
                    .fontWeight(.regular)
                    .foregroundStyle(.white)
            }
            
            TextField(String.searchText, text: $viewModel.searchText)
                .withCustomSearchView()
                .onChange(of: viewModel.searchText, perform: { value in
                    viewModel.updateBranches(searchText: value)
                })
                .padding([.leading,.trailing])
        }
    }
    
    // TODO: - BranchesGrid
    
    private func branchesGrid() -> some View {
        ScrollView(showsIndicators: false){
            LazyVGrid(columns: columns, spacing: 14) {
                if let branches = viewModel.branches {
                    ForEach(branches, id: \.id) { branch in
                        branchItem(branch: branch)
                            .frame(height: 130)
                    }
                }
            }
            .padding()
        }
    }
    
   

    
    // TODO: - CourceItem
    
    private func branchItem(branch:Branch) -> some View{
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .shadow(radius: 10,x: 0,y: 4)
            .overlay {
                VStack(alignment: .leading,spacing: 8){
                  
                    HStack(spacing: 0){
                        // image
                        Image(.gate)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 38,height: 38)
                        
                        // title
                        Text(branch.name ?? "")
                            .fontWeight(.bold)
                            .foregroundStyle(._0_A_5580)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    // short
                    Text(branch.short ?? "")
                        .font(.caption)
                        .fontWeight(.regular)
                        .foregroundStyle(._2_F_2_F_2_F)
                }
                .padding()
            }
    }
}

#Preview {
    CourseView(courceTitle: "btech")
}
