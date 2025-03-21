import SwiftUI

// 由于没有实际的图片资产，这个结构体提供SF Symbols图标作为替代
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
    
    // 季节背景
    static var springBackground: some View {
        ZStack {
            Color(hex: "F0FFE6")
            
            Image(systemName: "leaf.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(Color(hex: "B4E134").opacity(0.3))
                .offset(x: 120, y: -100)
            
            Image(systemName: "drop.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundColor(Color(hex: "B4E134").opacity(0.3))
                .offset(x: -120, y: 100)
        }
    }
    
    static var summerBackground: some View {
        ZStack {
            Color(hex: "E6F9FF")
            
            Image(systemName: "sun.max.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(Color(hex: "1CA0E3").opacity(0.3))
                .offset(x: 120, y: -100)
            
            Image(systemName: "cloud.sun.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .foregroundColor(Color(hex: "1CA0E3").opacity(0.3))
                .offset(x: -120, y: 100)
        }
    }
    
    static var autumnBackground: some View {
        ZStack {
            Color(hex: "FFF6E6")
            
            Image(systemName: "leaf.arrow.triangle.circlepath")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(Color(hex: "F78C35").opacity(0.3))
                .offset(x: 120, y: -100)
            
            Image(systemName: "wind")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .foregroundColor(Color(hex: "F78C35").opacity(0.3))
                .offset(x: -120, y: 100)
        }
    }
    
    static var winterBackground: some View {
        ZStack {
            Color(hex: "E6EEFF")
            
            Image(systemName: "snow")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(Color(hex: "2E618A").opacity(0.3))
                .offset(x: 120, y: -100)
            
            Image(systemName: "thermometer.snowflake")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .foregroundColor(Color(hex: "2E618A").opacity(0.3))
                .offset(x: -120, y: 100)
        }
    }
    
    // 音乐播放器默认图像
    static var musicBackground: some View {
        ZStack {
            Color(hex: "F5F5F5")
            
            Image(systemName: "music.note")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .foregroundColor(.gray.opacity(0.3))
        }
    }
} 