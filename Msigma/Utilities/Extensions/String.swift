//
//  String.swift
//  Msigma
//
//  Created by Ganesh Raju Galla on 22/11/23.
//

import Foundation

extension String{
    public func asUrl() throws -> URL{
        guard let url = URL(string: self) else {
            throw NetworkErros.invalidUrl
        }
        return url
    }
}

extension String {
    func convertToLowerCaseAbbreviation() -> String {
        return self.lowercased().replacingOccurrences(of: ".", with: "")
    }
}


extension String{
    static let heySwet = "Hey Shwet!"
    static let letsLearnSomething = "Let’s learn something new today"
    static let haveAnyQueries = "Have any queries?"
    static let queryCategory = "Talk to an academic counsellor for free"
    static let callNow = "Call now"
    static let resumeFromLeft = "Resume from where you left"
    static let resumeTitle = "Z Transform using EQN I"
    static let resumeSubTitle = "Digital Signal Processing"
    static let timeleft = "9mins left"
    static let exploreCourses = "Explore courses"
    static let seeAll = "seeAll"
    static let searchText = "Search course, program"
    static let findYourBranch = "Find your branch"
    static let topCrashCource = "Top crash courses"
    static let featuredSubjects = "Featured subjects"
    static let liveSessions = "Live sessions"
}
