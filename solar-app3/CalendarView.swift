import SwiftUI

struct CalendarView: View {
    @State private var allSolarTerms = SolarTermsData.shared.getAllSolarTerms()
    @State private var currentSolarTerm = SolarTermsData.shared.getCurrentSolarTerm()
    @State private var showDetail = false
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // 标题
                HStack {
                    Text("节气日历")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(SolarColors.textColor(for: colorScheme))
                    
                    Spacer()
                    
                    Text("2024年")
                        .font(.system(size: 16))
                        .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(colorScheme == .dark ? Color.gray.opacity(0.3) : Color.secondary.opacity(0.1))
                        .cornerRadius(8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top, 20)
                
                // 春季节气
                SeasonHeader(title: "春季节气", colorScheme: colorScheme)
                    .padding(.horizontal)
                    .padding(.top, 5)
                
                // 列表模式显示春季节气
                VStack(spacing: 0) {
                    // 获取春季节气 - 立春、雨水、惊蛰、春分、清明、谷雨
                    ForEach(getSolarTerms(for: "spring"), id: \.name) { term in
                        createTimelineItem(term)
                    }
                }
                .background(SolarColors.cardBackground(for: colorScheme))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                .padding(.horizontal)
                
                // 夏季节气
                SeasonHeader(title: "夏季节气", colorScheme: colorScheme)
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                VStack(spacing: 0) {
                    // 获取夏季节气 - 立夏、小满、芒种、夏至、小暑、大暑
                    ForEach(getSolarTerms(for: "summer"), id: \.name) { term in
                        createTimelineItem(term)
                    }
                }
                .background(SolarColors.cardBackground(for: colorScheme))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                .padding(.horizontal)
                
                // 秋季节气
                SeasonHeader(title: "秋季节气", colorScheme: colorScheme)
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                VStack(spacing: 0) {
                    // 获取秋季节气 - 立秋、处暑、白露、秋分、寒露、霜降
                    ForEach(getSolarTerms(for: "autumn"), id: \.name) { term in
                        createTimelineItem(term)
                    }
                }
                .background(SolarColors.cardBackground(for: colorScheme))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                .padding(.horizontal)
                
                // 冬季节气
                SeasonHeader(title: "冬季节气", colorScheme: colorScheme)
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                VStack(spacing: 0) {
                    // 获取冬季节气 - 立冬、小雪、大雪、冬至、小寒、大寒
                    ForEach(getSolarTerms(for: "winter"), id: \.name) { term in
                        createTimelineItem(term)
                    }
                }
                .background(SolarColors.cardBackground(for: colorScheme))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                .padding(.horizontal)
                
                // 当前选中节气详情
                if showDetail {
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text(currentSolarTerm.name)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(SolarColors.textColor(for: colorScheme))
                            
                            Text(currentSolarTerm.englishName)
                                .font(.system(size: 16))
                                .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                            
                            Spacer()
                            
                            Button(action: {
                                withAnimation {
                                    showDetail = false
                                }
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                                    .font(.system(size: 20))
                            }
                        }
                        
                        Text(currentSolarTerm.termDescription)
                            .font(.system(size: 16))
                            .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                            .lineSpacing(5)
                            .padding(.top, 5)
                        
                        Divider()
                            .padding(.vertical, 5)
                        
                        // 添加图片
                        ImageAssets.getBackgroundImage(for: currentSolarTerm)
                            .frame(height: 150)
                            .cornerRadius(10)
                            .clipped()
                    }
                    .padding()
                    .background(SolarColors.cardBackground(for: colorScheme))
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                    .padding(.horizontal)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .padding(.bottom, 80) // 为底部导航留出空间
        }
    }
    
    // 获取特定季节的节气
    private func getSolarTerms(for season: String) -> [SolarTerm] {
        switch season {
        case "spring":
            // 春季: 立春、雨水、惊蛰、春分、清明、谷雨
            return allSolarTerms.filter { 
                ["立春", "雨水", "惊蛰", "春分", "清明", "谷雨"].contains($0.name) 
            }.sorted { term1, term2 in
                let order = ["立春", "雨水", "惊蛰", "春分", "清明", "谷雨"]
                let index1 = order.firstIndex(of: term1.name) ?? 0
                let index2 = order.firstIndex(of: term2.name) ?? 0
                return index1 < index2
            }
            
        case "summer":
            // 夏季: 立夏、小满、芒种、夏至、小暑、大暑
            return allSolarTerms.filter { 
                ["立夏", "小满", "芒种", "夏至", "小暑", "大暑"].contains($0.name) 
            }.sorted { term1, term2 in
                let order = ["立夏", "小满", "芒种", "夏至", "小暑", "大暑"]
                let index1 = order.firstIndex(of: term1.name) ?? 0
                let index2 = order.firstIndex(of: term2.name) ?? 0
                return index1 < index2
            }
            
        case "autumn":
            // 秋季: 立秋、处暑、白露、秋分、寒露、霜降
            return allSolarTerms.filter { 
                ["立秋", "处暑", "白露", "秋分", "寒露", "霜降"].contains($0.name) 
            }.sorted { term1, term2 in
                let order = ["立秋", "处暑", "白露", "秋分", "寒露", "霜降"]
                let index1 = order.firstIndex(of: term1.name) ?? 0
                let index2 = order.firstIndex(of: term2.name) ?? 0
                return index1 < index2
            }
            
        case "winter":
            // 冬季: 立冬、小雪、大雪、冬至、小寒、大寒
            return allSolarTerms.filter { 
                ["立冬", "小雪", "大雪", "冬至", "小寒", "大寒"].contains($0.name) 
            }.sorted { term1, term2 in
                let order = ["立冬", "小雪", "大雪", "冬至", "小寒", "大寒"]
                let index1 = order.firstIndex(of: term1.name) ?? 0
                let index2 = order.firstIndex(of: term2.name) ?? 0
                return index1 < index2
            }
            
        default:
            return []
        }
    }
    
    private func createTimelineItem(_ term: SolarTerm) -> some View {
        TimelineItem(
            solarTerm: term,
            isActive: term.name == currentSolarTerm.name,
            colorScheme: colorScheme
        )
        .padding(.horizontal)
        .background(
            term.name == currentSolarTerm.name ? 
                SolarColors.getSeasonColor(for: term).opacity(colorScheme == .dark ? 0.3 : 0.1) : Color.clear
        )
        .onTapGesture {
            withAnimation(.spring()) {
                currentSolarTerm = term
                showDetail = true
            }
        }
    }
}

// 季节分隔标题
struct SeasonHeader: View {
    var title: String
    var colorScheme: ColorScheme
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
            
            Spacer()
        }
    }
} 