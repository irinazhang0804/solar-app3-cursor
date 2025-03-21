import Foundation
import UIKit

/// 用于确保应用程序可以访问到所需图片资源的工具类
class ResourceManager {
    static let shared = ResourceManager()
    
    /// 确保所有图片资源都可用
    func ensureResourcesAvailable() {
        let fileManager = FileManager.default
        let picturesDir = Bundle.main.bundlePath + "/pictures"
        
        // 创建pictures目录（如果不存在）
        if !fileManager.fileExists(atPath: picturesDir) {
            do {
                try fileManager.createDirectory(atPath: picturesDir, withIntermediateDirectories: true)
                print("Created pictures directory at: \(picturesDir)")
            } catch {
                print("Failed to create pictures directory: \(error)")
            }
        }
        
        // 图片名称数组
        let imageNames = ["spring", "summer", "autumn", "winter", "album", "avatar"]
        
        for imageName in imageNames {
            let destPath = "\(picturesDir)/\(imageName).png"
            
            // 检查图片是否已经存在
            if !fileManager.fileExists(atPath: destPath) {
                // 如果图片存在于Assets.xcassets中，则使用它
                if let image = UIImage(named: imageName) {
                    if let imageData = image.pngData() {
                        fileManager.createFile(atPath: destPath, contents: imageData)
                        print("Created \(imageName).png from asset")
                    }
                } else {
                    print("Warning: Missing resource: \(imageName).png")
                }
            }
        }
    }
} 