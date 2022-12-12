//
//  Message.swift
//  CollapsedBar
//
//  Created by Edgard Vargas on 8/12/22.
//

import SwiftUI

struct Message: Identifiable {
    var id = UUID().uuidString
    var message: String
    var userName: String
    var tintColor: Color
}

var allMessages: [Message] = [

    Message(message: "Lets go dota", userName: "iJustine", tintColor: .pink),
    Message(message: "Bur dota sucks", userName: "iOscar", tintColor: .green),
    Message(message: "Yeah i prefer wow", userName: "iDiego", tintColor: .blue),
    Message(message: "How you dare to said that", userName: "iJustine", tintColor: .pink),
    Message(message: "Comme on dont be mad", userName: "iLuis", tintColor: .red),
    Message(message: "Play what ever you want and stop complaining", userName: "iEdgard", tintColor: .yellow),
    Message(message: "hahahahaha xD", userName: "iRenzo", tintColor: .orange),
    Message(message: "Lets go dota", userName: "iJustine", tintColor: .pink),
    Message(message: "Bur dota sucks", userName: "iOscar", tintColor: .green),
    Message(message: "Yeah i prefer wow", userName: "iDiego", tintColor: .blue),
    Message(message: "How you dare to said that", userName: "iJustine", tintColor: .pink),
    Message(message: "Comme on dont be mad", userName: "iLuis", tintColor: .red),
    Message(message: "Play what ever you want and stop complaining", userName: "iEdgard", tintColor: .yellow),
    Message(message: "hahahahaha xD", userName: "iRenzo", tintColor: .orange),
    Message(message: "Lets go dota", userName: "iJustine", tintColor: .pink),
    Message(message: "Bur dota sucks", userName: "iOscar", tintColor: .green),
    Message(message: "Yeah i prefer wow", userName: "iDiego", tintColor: .blue),
    Message(message: "How you dare to said that", userName: "iJustine", tintColor: .pink),
    Message(message: "Comme on dont be mad", userName: "iLuis", tintColor: .red),
    Message(message: "Play what ever you want and stop complaining", userName: "iEdgard", tintColor: .yellow),
    Message(message: "hahahahaha xD", userName: "iRenzo", tintColor: .orange),
    Message(message: "Lets go dota", userName: "iJustine", tintColor: .pink),
    Message(message: "Bur dota sucks", userName: "iOscar", tintColor: .green),
    Message(message: "Yeah i prefer wow", userName: "iDiego", tintColor: .blue),
    Message(message: "How you dare to said that", userName: "iJustine", tintColor: .pink),
    Message(message: "Comme on dont be mad", userName: "iLuis", tintColor: .red),
    Message(message: "I am going to play outside xD", userName: "iEdgard", tintColor: .yellow),
    Message(message: "hahahahaha xD", userName: "iRenzo", tintColor: .orange)

]
