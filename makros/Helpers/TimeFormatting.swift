//
//  TimeFormatting.swift
//  makros
//
//  Created by Arul on 9/2/22.
//

import Foundation

func calcTimeSince(date: Date) -> String {
    let minutes = Int(-date.timeIntervalSinceNow)/60
    let hours = minutes/60
    let days = hours/24
    
    if minutes < 2 {
        return "just now"
    } else if minutes < 60 {
        return "\(minutes) minutes ago"
    } else if minutes >= 60 && hours < 24 {
        return "\(hours) hours ago"
    } else if days == 1{
        return "\(days) day ago"
    } else {
        return "\(days) days ago"
    }
}
