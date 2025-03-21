import SwiftUI

struct LaunchScreen: View {
    @State private var isAnimating = false
    @State private var opacity = 0.0
    
    var body: some View {
        ZStack {
            // 背景渐变
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: "B4E134").opacity(0.7),
                    Color(hex: "1CA0E3").opacity(0.7),
                    Color(hex: "F78C35").opacity(0.7),
                    Color(hex: "2E618A").opacity(0.7)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            // 内容
            VStack(spacing: 30) {
                // 应用图标
                ZStack {
                    Circle()
                        .fill(Color.white.opacity(0.9))
                        .frame(width: 120, height: 120)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                    
                    // 使用SF Symbols作为应用图标
                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color(hex: "F78C35"))
                }
                .scaleEffect(isAnimating ? 1.1 : 1.0)
                .opacity(opacity)
                
                // 应用名称
                Text("24节气")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                    .opacity(opacity)
                
                // 副标题
                Text("传统文化的智慧之旅")
                    .font(.system(size: 18))
                    .foregroundColor(.white.opacity(0.9))
                    .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 1)
                    .opacity(opacity)
            }
        }
        .onAppear {
            // 启动动画
            withAnimation(Animation.easeInOut(duration: 1.5)) {
                opacity = 1.0
            }
            
            // 图标呼吸动画
            withAnimation(Animation.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
        }
    }
} 