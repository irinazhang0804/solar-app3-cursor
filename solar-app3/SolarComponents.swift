import SwiftUI

// 定义应用使用的自定义颜色
struct SolarColors {
    static let springGreen = Color(hex: "B4E134")
    static let summerBlue = Color(hex: "1CA0E3")
    static let autumnOrange = Color(hex: "F78C35")
    static let winterBlue = Color(hex: "2E618A")
    
    // 深色模式专用颜色
    static let darkModeText = Color(hex: "E8E8E8")
    static let darkModeBackground = Color(hex: "121212")
    static let darkModeSecondary = Color(hex: "B0B0B0")
    static let darkModeCardBackground = Color(hex: "1E1E1E")
    static let darkModeSurfaceBackground = Color(hex: "242424")
    
    static func getSeasonColor(for term: SolarTerm) -> Color {
        return Color(hex: term.seasonColor)
    }
    
    // 获取基于深色模式状态的文本颜色
    static func textColor(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .dark ? darkModeText : .primary
    }
    
    // 获取基于深色模式状态的次要文本颜色
    static func secondaryTextColor(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .dark ? darkModeSecondary : .secondary
    }
    
    // 获取基于深色模式状态的卡片背景色
    static func cardBackground(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .dark ? darkModeCardBackground : .white.opacity(0.9)
    }
    
    // 获取基于深色模式状态的表面背景色
    static func surfaceBackground(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .dark ? darkModeSurfaceBackground : .white.opacity(0.9)
    }
}

// 扩展Color以支持十六进制颜色代码
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// 节气卡片
struct SolarTermCard: View {
    var solarTerm: SolarTerm
    var showFullContent: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text(solarTerm.name)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.primary)
                
                Text(dateFormatter.string(from: solarTerm.date))
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            .padding(.bottom, 5)
            
            if showFullContent {
                VStack(alignment: .leading, spacing: 15) {
                    Text("今日节气: \(solarTerm.name)")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(solarTerm.termDescription)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineSpacing(5)
                }
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(10)
            }
            
            if !showFullContent {
                ImageAssets.getBackgroundImage(for: solarTerm)
                    .frame(height: 160)
                    .cornerRadius(10)
                    .clipped()
            }
            
            HStack {
                Text("「\(solarTerm.poetry.prefix(20))...」")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding(.top, 5)
        }
        .padding(15)
        .background(Color.white.opacity(0.95))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        return formatter
    }
}

// 底部导航按钮
struct NavButton: View {
    let title: String
    let systemImage: String
    let isActive: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: systemImage)
                    .font(.system(size: 20))
                    .foregroundColor(isActive ? .green : .gray)
                
                Text(title)
                    .font(.system(size: 12))
                    .foregroundColor(isActive ? .green : .gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

// 节气时间线项
struct TimelineItem: View {
    var solarTerm: SolarTerm
    var isActive: Bool
    var colorScheme: ColorScheme
    
    var body: some View {
        HStack(spacing: 15) {
            // 时间线指示器
            VStack {
                Circle()
                    .fill(isActive ? SolarColors.getSeasonColor(for: solarTerm) : Color.gray.opacity(0.5))
                    .frame(width: isActive ? 16 : 12, height: isActive ? 16 : 12)
                    .shadow(color: isActive ? SolarColors.getSeasonColor(for: solarTerm).opacity(0.5) : .clear, radius: 4)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(solarTerm.name)
                    .font(.system(size: 16, weight: isActive ? .bold : .medium))
                    .foregroundColor(isActive ? SolarColors.textColor(for: colorScheme) : SolarColors.secondaryTextColor(for: colorScheme))
                
                Text(dateFormatter.string(from: solarTerm.date))
                    .font(.system(size: 12))
                    .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
            }
            
            Spacer()
            
            // 添加右侧箭头指示
            Image(systemName: "chevron.right")
                .font(.system(size: 14))
                .foregroundColor(isActive ? SolarColors.getSeasonColor(for: solarTerm) : .gray.opacity(0.5))
        }
        .padding(.vertical, 12)
        .contentShape(Rectangle()) // 扩大点击区域
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        return formatter
    }
} 