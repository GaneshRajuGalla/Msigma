//
//  HomeView.swift
//  Msigma
//
//  Created by Ganesh Raju Galla on 22/11/23.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedIndex:Int = 0
    private let columns:[GridItem] = Array(repeating: .init(.flexible(),spacing: 14,alignment: .center), count: 2)
    
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Image(.homeBg)
                        .resizable()
                        .scaledToFit()
                        
                    Spacer()
                }
                .ignoresSafeArea()
                
                homeContainer()
            }
        }
    }
}


extension HomeView{
    
    // TODO: - Home Container
    
    private func homeContainer() -> some View{
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading,spacing: 20){
                // 1 headreView
                headerView()
                
                // queries
                queriesCarousel()
                
                // resumSessionView
                resumSessionView()
                
                // exploreCoursesView
                exploreCourcesView()
                
                // featureSubjects
                featuredSubjectsView()
                
                // topCrashCourseView
                topCrashCourseView()
                
                // liveSessionsView
                liveSessionsView()
            }
            .padding()
            //.padding([.leading,.trailing],16)
        }
    }
    
    
    // TODO: - HeadreView
    
    private func headerView() -> some View{
        HStack(alignment: .top){
            headerTextView()
            headreIconsView()
        }
    }
    
    // TODO: - HeaderTextView
    
    private func headerTextView() -> some View{
        VStack(alignment: .leading,spacing: 4){
            // name
            Text(verbatim: .heySwet)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(._2_F_2_F_2_F)
            
            // descption
            Text(verbatim: .letsLearnSomething)
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(._555555)
        }
    }
    
    
    // TODO: - HeadreIconsView
    
    private func headreIconsView() -> some View{
        HStack(spacing: 16){
            Image(.search)
                .resizable()
                .scaledToFit()
            
            Image(.notification)
                .resizable()
                .scaledToFit()
        }
        .frame(height: 40)
    }
    
    
    // TODO: - QueriesCarousel
    
    private func queriesCarousel() -> some View{
        VStack(spacing: 6, content: {
            
            // TabView
            TabView(selection: $selectedIndex,
                    content:  {
                ForEach(0..<3) { index in
                    queryView()
                        .tag(index)
                }
            })
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 132)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            
            // pageView
            HStack{
                ForEach(0..<3){ index in
                    Capsule()
                        .fill(selectedIndex == index ? ._878787 : .D_9_D_9_D_9)
                        .frame(width: 26,height: 3)
                }
            }
        })
        
    }
    
    
    // TODO: - queryView
    
    private func queryView() -> some View{
        Rectangle()
            .fill(.FFDCAB)
        
        // image overlay
            .overlay(alignment: .trailing, content: {
                VStack(content: {
                    Image(.queryBg)
                        .resizable()
                        .scaledToFit()
                    Spacer()
                })
                
            })
        
        //  query overlay
            .overlay(alignment: .leading) {
                VStack(alignment: .leading,spacing: 4){
                    
                    // query header
                    Text(verbatim: .haveAnyQueries)
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundStyle(._70450_D)
                    
                    // description
                    
                    Text(verbatim: .queryCategory)
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundStyle(._70450_D)
                    
                    // Button
                    
                    Button(action: {
                        
                    }, label: {
                        Text(verbatim: .callNow)
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.EA_9626)
                            .clipShape(RoundedRectangle(cornerRadius: 33))
                    })
                }
                .padding()
            }
    }
    
    
    // TODO: - ResumSessionView
    
    private func resumSessionView() -> some View{
        VStack(alignment: .leading,spacing: 16){
            
            // Title
            Text(verbatim: .resumeFromLeft)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundStyle(._2_F_2_F_2_F)
            
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .shadow(radius: 10,x: 0,y: 4)
                .frame(height: 94)
            
                .overlay(alignment: .trailing) {
                    resumeTitleView()
                }
        }
    }
    
    // TODO: - ResumeInfoView
    
    private func resumeTitleView() -> some View{
        HStack{
            VStack(alignment: .leading,spacing: 4){
                
                // Title
                Text(verbatim: .resumeTitle)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(._2_F_2_F_2_F)
                
                // subTitle
                Text(verbatim: .resumeSubTitle)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundStyle(._2_F_2_F_2_F)
                
                // time
                Text(verbatim: .timeleft)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.EA_9626)
            }
            .padding()
            
            Spacer()
            
            // resumeImage
            Image(.resume)
                .resizable()
                .scaledToFit()
        }
    }
    
    private func exploreCourcesView() -> some View{
        VStack(alignment: .leading,spacing: 16){
            
            // sectionTitleView
            sectionTitleView(title:.exploreCourses)
            
            // courseGrid
            courseGrid()
        }
    }
    
    // TODO: - Explore Cources
    
    private func sectionTitleView(title:String) -> some View{
        // section View
        HStack{
            
            // title
            Text(verbatim:title)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundStyle(._2_F_2_F_2_F)
            
            Spacer()
            
            Button {
                // navigate to see all
            } label: {
                HStack(spacing: 9){
                    
                    // See All
                    Text(verbatim: .seeAll)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(._666666)
                    
                    Image(.rightArrow)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 5,height: 10)
                }
            }
        }
    }
    
    // TODO: - CourseGrid
    
    private func courseGrid() -> some View{
        LazyVGrid(columns: columns,spacing: 14){
            ForEach(viewModel.courceData,id: \.id){ cource in
                NavigationLink {
                    CourseView(courceTitle: cource.courceTitle)
                } label: {
                    courseView(cource: cource)
                        .frame(height: 130)
                }
            }
        }
    }
    
    // TODO: - CourseView
    
    private func courseView(cource:CourceModel) -> some View{
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .shadow(radius: 10)
            .overlay {
                VStack(alignment: .leading,spacing: 6){
                    HStack(spacing: 6){
                        
                        // image
                        Image(cource.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40,height: 40)
                        
                        // title
                        Text(cource.courceTitle)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(._0_A_5580)
                        
                    }
                    
                    // enrolled
                    Label(
                        title: {
                            Text("\(cource.enrollCount) enrolled")
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundStyle(._2587_BE)
                        },icon: {
                            Image(.person)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10,height: 10)
                        }
                    )
                }
                .padding()
            }
    }
    
    // TODO: - FeaturedSubjectsView
    
    private func featuredSubjectsView() -> some View{
        VStack(alignment: .leading,spacing: 16){
            // sectionTitleView
            sectionTitleView(title:.featuredSubjects)
            
            // featureSubjectsScrollView
            featureSubjectsScrollView()
        }
    }
    
    // TODO: - CrashCourceScrollView
    
    private func featureSubjectsScrollView() -> some View{
        ScrollView(.horizontal,showsIndicators: false){
            HStack(alignment: .center,spacing: 20) {
                ForEach(0..<10){ index in
                    subjectView()
                        .frame(width: 153)
                }
            }
        }
    }
    
    // TODO: - SubjectView
    
    private func subjectView() -> some View{
        VStack(alignment: .leading,spacing: 8){
            
            // Image
            Image(.subject)
                .resizable()
                .scaledToFit()
                .frame(height: 159)
            
            // subject
            Text("B.TECH • ECE")
                .font(.caption)
                .fontWeight(.regular)
                .foregroundStyle(._888888)
            
            // titleView
            Text("Digital Signal Processing")
                .font(.title2)
                .fontWeight(.bold)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .foregroundStyle(._2_F_2_F_2_F)
            
            // tutorName
            Text("By Hari Krishna")
                .font(.caption)
                .fontWeight(.regular)
              
                .foregroundStyle(._888888)
            
            // price
            HStack{
                Text("₹749")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(._2_F_2_F_2_F)
                
                Text("₹1299")
                    .font(.callout)
                    .fontWeight(.regular)
                    .strikethrough()
                    .foregroundStyle(._888888)
            }
        }
    }
    
    // TODO: - TopCrashCourseView
    
    private func topCrashCourseView() -> some View{
        VStack(alignment: .leading,spacing: 16){
            // sectionTitleView
            sectionTitleView(title:.topCrashCource)
            
            // courseGrid
            topCrashCourcesScrollView()
        }
    }
    
    // TODO: - TopCrashCourcesScrollView
    
    private func topCrashCourcesScrollView() -> some View{
        ScrollView(.horizontal,showsIndicators: false){
            HStack(alignment: .center,spacing: 20) {
                ForEach(0..<10){ index in
                    topCourseView()
                        .frame(width: 300)
                        .frame(height: 145)
                }
            }
        }
    }
    
    // TODO: - TopCourseView
    
    private func topCourseView() -> some View{
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.F_3_F_1_FF)
            .overlay(alignment: .trailing) {
                Image(.topCourseShadow)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .overlay(alignment: .center) {
                HStack{
                    VStack(alignment: .leading,spacing: 13){
                        Text("GATE 2022 Crash Course")
                            .font(.title3)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(._251_C_65)
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Know More")
                                .font(.footnote)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 33).foregroundColor(._251_C_65))
                        })
                    }
                    
                    Spacer()
                    
                    Image(.universitylogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 66,height: 71)
                        .background(.clear)
                }
                .padding()
            }
    }
    
    // TODO: - LiveSessionsView
    
    private func  liveSessionsView() -> some View{
        VStack(alignment: .leading,spacing: 16){
            // sectionTitleView
            sectionTitleView(title:.liveSessions)
            
            // courseGrid
            liveSessionsScrollView()
        }
    }
    
    // TODO: - liveSessionsScrollView
    
    private func liveSessionsScrollView() -> some View{
        ScrollView(.horizontal,showsIndicators: false){
            HStack(alignment: .center,spacing: 20) {
                ForEach(0..<10){ index in
                    liveSessionView()
                        .frame(width: 278)
                        .frame(height: 191)
                }
            }
        }
    }
    
    // TODO: - LiveSessionView
    
    private func liveSessionView() -> some View{
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.FFF_2_E_1)
            .overlay(content: {
                VStack(alignment: .leading){
                    Image(.liveSession)
                        .overlay(alignment: .bottomLeading, content: {
                            Label(
                                title: {
                                    Text("View Now")
                                        .font(.headline)
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                },icon: {
                                    Image(.vector)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 12,height: 12)
                                }
                            )
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.EA_9626))
                            .padding([.leading,.trailing,.bottom],10)
                        })
                        
                    
                    VStack(alignment: .leading){
                        Text("NEET Crash Course - Final")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(._2_F_2_F_2_F)
                        
                        Text("Touch to Electromagnetic, Induction, Inductance")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundStyle(._2_F_2_F_2_F)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.leading)
                }
            })
    }
}

#Preview {
    HomeView()
}
