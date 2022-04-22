//
//  SettingsSection.swift
//  ImageRecognition
//
//  Created by javon maxwell on 2022-04-20.
//


//protocol choices which cell has a switch
protocol SectionType: CustomStringConvertible{
    var containSwitch: Bool {get}
}


//main emun for section choice
enum SettingsSection: Int, CaseIterable, CustomStringConvertible{
    //swift auto assigns  count on causes starting at 0
    case social
    case communications
    
    var description: String{
        switch self{
        case.social: return "social"
        case.communications: return "cummunications"
        }
    }
}


//main emun for section choice
enum SocialSection: Int, CaseIterable, CustomStringConvertible, SectionType{
    //switch protocal
    var containSwitch: Bool{
        switch self{
        case.theme: return true
        case.logOut: return true
        }
    }
    
    case theme
    case logOut
    
    var description: String{
        switch self{
        case.theme: return "change theme"
        case.logOut: return "sign out"
        }
    }
}
    
    //main emun for section choice
enum CommunicationSection: Int, CaseIterable, CustomStringConvertible, SectionType{
    var containSwitch: Bool{
        switch self{
        case.reportCrashes: return true
        case.notifications: return true
        }
    }

    case notifications
    case reportCrashes
    
    var description: String{
        switch self{
        case.notifications: return "notifications"
        case.reportCrashes: return "reprt crashes"
        }
    }
}
