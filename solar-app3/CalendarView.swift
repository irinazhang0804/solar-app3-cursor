import SwiftUI

struct CalendarView: View {
    @State private var allSolarTerms = SolarTermsData.shared.getAllSolarTerms()
    @State private var currentSolarTerm = SolarTermsData.shared.getCurrentSolarTerm()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // 标题
                Text("节气日历")
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                // 列表模式显示所有节气
                VStack(spacing: 0) {
                    ForEach(allSolarTerms, id: \.name) { term in
                        TimelineItem(
                            solarTerm: term,
                            isActive: term.name == currentSolarTerm.name
                        )
                        .padding(.horizontal)
                        .background(
                            term.name == currentSolarTerm.name ? 
                                SolarColors.getSeasonColor(for: term).opacity(0.1) : Color.clear
                        )
                        .onTapGesture {
                            withAnimation {
                                currentSolarTerm = term
                            }
                        }
                        
                        if term.name != allSolarTerms.last?.name {
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 1)
                                .padding(.leading, 50)
                                .padding(.trailing)
                        }
                    }
                }
                .background(Color.white.opacity(0.9))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                .padding(.horizontal)
                
                // 当前选中节气详情
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text(currentSolarTerm.name)
                            .font(.system(size: 24, weight: .bold))
                        
                        Text(currentSolarTerm.englishName)
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                    }
                    
                    Text(currentSolarTerm.termDescription)
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                        .lineSpacing(5)
                        .padding(.top, 5)
                    
                    // 可以添加更多详情信息...
                }
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                .padding(.horizontal)
            }
            .padding(.bottom, 80) // 为底部导航留出空间
        }
    }
} 