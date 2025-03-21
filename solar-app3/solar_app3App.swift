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
    @AppStorage("isDarkMode") private var isDarkMode = false
    
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
                    .preferredColorScheme(isDarkMode ? .dark : .light)
                
                // 显示启动屏幕，3秒后自动消失
                if showLaunchScreen {
                    LaunchScreen()
                        .transition(.opacity)
                        .zIndex(1)
                }
            }
            .onAppear {
                // 设置应用界面风格
                setAppAppearance()
                
                // 确保资源可用
                ResourceManager.shared.ensureResourcesAvailable()
                
                // 复制pictures目录中的图片资源到应用可访问的位置
                copyPicturesIfNeeded()
                
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
    
    // 设置应用外观
    private func setAppAppearance() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
    }
    
    // 将pictures目录中的图片复制到应用包中
    private func copyPicturesIfNeeded() {
        let fileManager = FileManager.default
        
        // 获取应用程序包中的pictures目录路径
        guard let bundleURL = Bundle.main.resourceURL else { return }
        let targetDirectoryURL = bundleURL.appendingPathComponent("pictures")
        
        // 创建目标目录（如果不存在）
        if !fileManager.fileExists(atPath: targetDirectoryURL.path) {
            do {
                try fileManager.createDirectory(at: targetDirectoryURL, withIntermediateDirectories: true)
            } catch {
                print("Error creating pictures directory: \(error)")
                return
            }
        }
        
        // 复制图片文件
        let sourceDirectory = "/Users/zhangzhenlan/frontend-learning/my-frontend/cursor-create-application/solar-app3/solar-app3/pictures"
        
        // 图片文件名
        let imageNames = ["spring.png", "summer.png", "autumn.png", "winter.png", "album.png", "avatar.png"]
        
        for imageName in imageNames {
            let sourceURL = URL(fileURLWithPath: "\(sourceDirectory)/\(imageName)")
            let targetURL = targetDirectoryURL.appendingPathComponent(imageName)
            
            if !fileManager.fileExists(atPath: targetURL.path) {
                do {
                    if fileManager.fileExists(atPath: sourceURL.path) {
                        try fileManager.copyItem(at: sourceURL, to: targetURL)
                        print("Successfully copied \(imageName)")
                    } else {
                        print("Source image does not exist: \(sourceURL.path)")
                    }
                } catch {
                    print("Error copying \(imageName): \(error)")
                }
            }
        }
    }
}
