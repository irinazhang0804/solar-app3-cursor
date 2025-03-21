import SwiftUI

struct TodayView: View {
    var solarTerm: SolarTerm
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // 顶部节气标题
                VStack(alignment: .leading, spacing: 5) {
                    Text(solarTerm.name)
                        .font(.system(size: 32, weight: .bold))
                    
                    Text(dateFormatter.string(from: solarTerm.date))
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top, 20)
                
                // 今日节气卡片
                VStack(alignment: .leading, spacing: 15) {
                    Text("今日节气: \(solarTerm.name)")
                        .font(.headline)
                    
                    Text(solarTerm.termDescription)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineSpacing(5)
                }
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                .padding(.horizontal)
                
                // 节气图片
                ZStack(alignment: .bottom) {
                    ImageAssets.getBackgroundImage(for: solarTerm)
                        .frame(height: 200)
                        .cornerRadius(15)
                        .clipped()
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                    
                    // 图片下方的诗词引用
                    VStack(alignment: .leading) {
                        Text("「\(solarTerm.poetry)」")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.primary)
                            .padding(.bottom, 2)
                        
                        Text("—— 节气诗句")
                            .font(.system(size: 12))
                            .foregroundColor(.secondary)
                    }
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white.opacity(0.85))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                // 节气详情
                VStack(alignment: .leading, spacing: 15) {
                    DetailSection(title: "节气特点", content: solarTerm.climaticFeatures)
                    DetailSection(title: "农事活动", content: solarTerm.farmingActivities)
                    DetailSection(title: "民俗活动", content: solarTerm.folkCustoms)
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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 4, height: 18)
                    .cornerRadius(2)
                
                Text(title)
                    .font(.headline)
            }
            
            Text(content)
                .font(.body)
                .foregroundColor(.secondary)
                .lineSpacing(5)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white.opacity(0.9))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1)
    }
} 