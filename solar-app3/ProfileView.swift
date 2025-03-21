import SwiftUI

struct ProfileView: View {
    @State private var enableNotification = true
    @State private var enableDarkMode = false
    @State private var autoPlayMusic = true
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                // 头部信息
                HStack {
                    Text("账户设置")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                // 用户信息卡片
                VStack(spacing: 15) {
                    // 头像和用户名
                    HStack {
                        ImageAssets.userAvatar
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("熊大大")
                                .font(.system(size: 18, weight: .bold))
                            
                            Text("节气达人 Lv.3")
                                .font(.system(size: 14))
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                .padding(.horizontal)
                
                // 设置选项
                VStack(spacing: 0) {
                    // 设置标题
                    HStack {
                        Text("应用设置")
                            .font(.headline)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    
                    // 设置项
                    VStack(spacing: 0) {
                        settingsToggle(title: "节气提醒", icon: "bell", isOn: $enableNotification)
                        
                        Divider()
                            .padding(.leading, 50)
                        
                        settingsToggle(title: "深色模式", icon: "moon", isOn: $enableDarkMode)
                        
                        Divider()
                            .padding(.leading, 50)
                        
                        settingsToggle(title: "自动播放", icon: "play", isOn: $autoPlayMusic)
                    }
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                    .padding(.horizontal)
                }
                
                // 关于应用
                VStack(spacing: 0) {
                    // 关于标题
                    HStack {
                        Text("关于应用")
                            .font(.headline)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                    
                    // 关于项
                    VStack(spacing: 0) {
                        settingsRow(title: "关于节气", icon: "info.circle")
                        
                        Divider()
                            .padding(.leading, 50)
                        
                        settingsRow(title: "评价应用", icon: "star")
                        
                        Divider()
                            .padding(.leading, 50)
                        
                        settingsRow(title: "分享应用", icon: "square.and.arrow.up")
                        
                        Divider()
                            .padding(.leading, 50)
                        
                        settingsRow(title: "隐私政策", icon: "hand.raised")
                    }
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                    .padding(.horizontal)
                }
                
                // 版本信息
                Text("版本 1.0.0")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                    .padding(.top, 20)
            }
            .padding(.bottom, 80) // 为底部导航留出空间
        }
    }
    
    private func settingsToggle(title: String, icon: String, isOn: Binding<Bool>) -> some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 18))
                .frame(width: 30, height: 30)
                .foregroundColor(.primary)
            
            Text(title)
                .font(.system(size: 16))
            
            Spacer()
            
            Toggle("", isOn: isOn)
                .labelsHidden()
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .contentShape(Rectangle())
    }
    
    private func settingsRow(title: String, icon: String) -> some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 18))
                .frame(width: 30, height: 30)
                .foregroundColor(.primary)
            
            Text(title)
                .font(.system(size: 16))
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .contentShape(Rectangle())
    }
} 