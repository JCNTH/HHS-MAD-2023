//
//  HHS_MAD_2023App.swift
//  HHS MAD 2023
//
//  Created by Julian NTH on 1/28/23.
//

// hello

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main

struct HHS_MAD_2023App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct Previews_HHS_MAD_2023App_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
