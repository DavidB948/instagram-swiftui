//
//  InstagramSwiftUIApp.swift
//  InstagramSwiftUI
//


import SwiftUI
import Firebase

@main
struct InstagramSwiftUIApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
