import SwiftUI

struct TodayView: View {
    var solarTerm: SolarTerm
    @State private var imageScale: CGFloat = 1.0
    @State private var imageOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // 顶部节气标题
                VStack(alignment: .leading, spacing: 5) {
                    Text(solarTerm.name)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(SolarColors.textColor(for: colorScheme))
                    
                    Text(dateFormatter.string(from: solarTerm.date))
                        .font(.system(size: 16))
                        .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top, 20)
                
                // 今日节气卡片
                VStack(alignment: .leading, spacing: 15) {
                    Text("今日节气: \(solarTerm.name)")
                        .font(.headline)
                        .foregroundColor(SolarColors.textColor(for: colorScheme))
                    
                    Text(solarTerm.termDescription)
                        .font(.body)
                        .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                        .lineSpacing(5)
                }
                .padding()
                .background(SolarColors.cardBackground(for: colorScheme))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                .padding(.horizontal)
                
                // 节气图片 - 修改为触摸时触发动画
                ZStack(alignment: .bottom) {
                    ImageAssets.getBackgroundImage(for: solarTerm)
                        .frame(height: 200)
                        .cornerRadius(15)
                        .clipped()
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .scaleEffect(isAnimating ? 1.05 : 1.0)
                        .offset(x: isAnimating ? 5 : 0)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                isAnimating = true
                                
                                // 动画结束后重置状态
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        isAnimating = false
                                    }
                                }
                            }
                        }
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { _ in
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        isAnimating = true
                                    }
                                }
                                .onEnded { _ in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        isAnimating = false
                                    }
                                }
                        )
                    
                    // 图片下方的诗词引用
                    VStack(alignment: .leading) {
                        Text("「\(solarTerm.poetry)」")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(SolarColors.textColor(for: colorScheme))
                            .padding(.bottom, 2)
                        
                        Text("—— 节气诗句")
                            .font(.system(size: 12))
                            .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                    }
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(colorScheme == .dark ? Color.black.opacity(0.75) : Color.white.opacity(0.85))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                // 节气详情
                VStack(alignment: .leading, spacing: 15) {
                    DetailSection(title: "节气特点", content: solarTerm.climaticFeatures, colorScheme: colorScheme)
                    DetailSection(title: "农事活动", content: solarTerm.farmingActivities, colorScheme: colorScheme)
                    DetailSection(title: "民俗活动", content: solarTerm.folkCustoms, colorScheme: colorScheme)
                }
                .padding(.vertical)
                .padding(.horizontal)
            }
            .padding(.bottom, 80) // 为底部导航留出空间
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        return formatter
    }
}

struct DetailSection: View {
    var title: String
    var content: String
    var colorScheme: ColorScheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 4, height: 18)
                    .cornerRadius(2)
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(SolarColors.textColor(for: colorScheme))
            }
            
            Text(content)
                .font(.body)
                .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                .lineSpacing(5)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(SolarColors.cardBackground(for: colorScheme))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1)
    }
} 