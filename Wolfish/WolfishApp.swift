//
//  WolfishApp.swift
//  Wolfish
//
//  Created by Petre Vane on 26/11/2020.
//

import SwiftUI

@main
struct WolfishApp: App {
    let persistenceController = PersistenceController.shared
    let order = OrderDataFlow()

    var body: some Scene {
        WindowGroup {
            WTabView().environmentObject(order)
//            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
