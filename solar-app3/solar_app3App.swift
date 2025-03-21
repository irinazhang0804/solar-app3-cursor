//
//  solar_app3App.swift
//  solar-app3
//
//  Created by 张振澜 on 2025/3/21.
//

import SwiftUI
import SwiftData

@main
struct solar_app3App: App {
    @State private var showLaunchScreen = true
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            SolarTerm.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                    .preferredColorScheme(.light) // 默认使用浅色模式
                
                // 显示启动屏幕，3秒后自动消失
                if showLaunchScreen {
                    LaunchScreen()
                        .transition(.opacity)
                        .zIndex(1)
                }
            }
            .onAppear {
                // 3秒后隐藏启动屏幕
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        showLaunchScreen = false
                    }
                }
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
