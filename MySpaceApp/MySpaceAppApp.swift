//
//  MySpaceAppApp.swift
//  MySpaceApp
//
//  Created by Noman Ahmad on 10/26/21.
//

import SwiftUI

@main
struct MySpaceAppApp: App {
    var body: some Scene {
        WindowGroup {
            StarSystemList(universe: localData!)
        }
    }
}
