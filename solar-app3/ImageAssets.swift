import SwiftUI

// 更新为使用实际图片资源而不是SF Symbols图标
struct ImageAssets {
    // 主要背景图像
    static func getBackgroundImage(for solarTerm: SolarTerm) -> some View {
        switch solarTerm.name {
        case "立春", "雨水", "惊蛰", "春分", "清明", "谷雨":
            return springBackground
        case "立夏", "小满", "芒种", "夏至", "小暑", "大暑":
            return summerBackground
        case "立秋", "处暑", "白露", "秋分", "寒露", "霜降":
            return autumnBackground
        case "立冬", "小雪", "大雪", "冬至", "小寒", "大寒":
            return winterBackground
        default:
            return springBackground
        }
    }
    
    // 获取特定季节的背景图片
    static var springBackground: some View {
        getBundleImage(named: "spring", fallbackSymbol: "leaf.fill")
    }
    
    static var summerBackground: some View {
        getBundleImage(named: "summer", fallbackSymbol: "sun.max.fill")
    }
    
    static var autumnBackground: some View {
        getBundleImage(named: "autumn", fallbackSymbol: "leaf.arrow.circlepath")
    }
    
    static var winterBackground: some View {
        getBundleImage(named: "winter", fallbackSymbol: "snow")
    }
    
    // 音乐播放器专辑图像
    static var albumCover: some View {
        getBundleImage(named: "album", fallbackSymbol: "music.note")
    }
    
    // 用户头像
    static var userAvatar: some View {
        getBundleImage(named: "avatar", fallbackSymbol: "person.crop.circle")
    }
    
    // 音乐播放器默认图像
    static var musicBackground: some View {
        albumCover
    }
    
    // 从图片目录获取图片 - 公开方法
    static func getBundleImage(named: String, fallbackSymbol: String = "photo") -> some View {
        // 首先尝试从Assets.xcassets加载图片
        if let uiImage = UIImage(named: named) {
            return Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        
        // 尝试从pictures目录加载图片
        if let picturesPath = getPicturesDirectoryPath() {
            let imagePath = "\(picturesPath)/\(named).png"
            if FileManager.default.fileExists(atPath: imagePath) {
                let url = URL(fileURLWithPath: imagePath)
                if let imageData = try? Data(contentsOf: url),
                   let uiImage = UIImage(data: imageData) {
                    return Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
        }
        
        // 尝试直接从Bundle加载
        if let path = Bundle.main.path(forResource: named, ofType: "png", inDirectory: "pictures") {
            let url = URL(fileURLWithPath: path)
            if let imageData = try? Data(contentsOf: url),
               let uiImage = UIImage(data: imageData) {
                return Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        
        // 如果所有尝试都失败，回退到系统图标
        return createFallbackImage(symbolName: fallbackSymbol)
    }
    
    // 获取pictures目录路径
    private static func getPicturesDirectoryPath() -> String? {
        // 1. 尝试从应用包中获取
        if let bundlePath = Bundle.main.resourceURL?.appendingPathComponent("pictures").path {
            if FileManager.default.fileExists(atPath: bundlePath) {
                return bundlePath
            }
        }
        
        // 2. 尝试从项目源码位置获取
        let projectPath = "/Users/zhangzhenlan/frontend-learning/my-frontend/cursor-create-application/solar-app3/solar-app3/pictures"
        if FileManager.default.fileExists(atPath: projectPath) {
            return projectPath
        }
        
        // 3. 尝试从Documents目录获取
        if let documentPath = try? FileManager.default.url(for: .documentDirectory, 
                                                          in: .userDomainMask, 
                                                          appropriateFor: nil, 
                                                          create: false).appendingPathComponent("pictures").path {
            if FileManager.default.fileExists(atPath: documentPath) {
                return documentPath
            }
        }
        
        return nil
    }
    
    // 创建一个更美观的回退图片
    private static func createFallbackImage(symbolName: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.2))
            
            Image(systemName: symbolName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(30)
                .foregroundColor(.gray)
        }
    }
} 