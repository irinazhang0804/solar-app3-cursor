import SwiftUI

struct ProfileView: View {
    @State private var enableNotification = true
    @State private var enableDarkMode = false
    @State private var autoPlayMusic = true
    @State private var showAboutInfo = false
    @State private var showAppRatingSheet = false
    @State private var showShareSheet = false
    @State private var showPrivacyPolicy = false
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                // 头部信息
                HStack {
                    Text("账户设置")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(SolarColors.textColor(for: colorScheme))
                    
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
                                .foregroundColor(SolarColors.textColor(for: colorScheme))
                            
                            Text("节气达人 Lv.3")
                                .font(.system(size: 14))
                                .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                    }
                }
                .padding()
                .background(SolarColors.cardBackground(for: colorScheme))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                .padding(.horizontal)
                
                // 设置选项
                VStack(spacing: 0) {
                    // 设置标题
                    HStack {
                        Text("应用设置")
                            .font(.headline)
                            .foregroundColor(SolarColors.textColor(for: colorScheme))
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    
                    // 设置项
                    VStack(spacing: 0) {
                        settingsToggle(title: "节气提醒", icon: "bell", isOn: $enableNotification)
                        
                        Divider()
                            .padding(.leading, 50)
                        
                        settingsToggle(title: "深色模式", icon: "moon", isOn: $isDarkMode)
                            .onChange(of: isDarkMode) { newValue in
                                setAppearance(to: newValue)
                            }
                        
                        Divider()
                            .padding(.leading, 50)
                        
                        settingsToggle(title: "自动播放", icon: "play", isOn: $autoPlayMusic)
                    }
                    .background(SolarColors.cardBackground(for: colorScheme))
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
                            .foregroundColor(SolarColors.textColor(for: colorScheme))
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                    
                    // 关于项
                    VStack(spacing: 0) {
                        settingsRow(title: "关于节气", icon: "info.circle")
                            .onTapGesture {
                                showAboutInfo = true
                            }
                        
                        Divider()
                            .padding(.leading, 50)
                        
                        settingsRow(title: "评价应用", icon: "star")
                            .onTapGesture {
                                showAppRatingSheet = true
                            }
                        
                        Divider()
                            .padding(.leading, 50)
                        
                        settingsRow(title: "分享应用", icon: "square.and.arrow.up")
                            .onTapGesture {
                                showShareSheet = true
                            }
                        
                        Divider()
                            .padding(.leading, 50)
                        
                        settingsRow(title: "隐私政策", icon: "hand.raised")
                            .onTapGesture {
                                showPrivacyPolicy = true
                            }
                    }
                    .background(SolarColors.cardBackground(for: colorScheme))
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                    .padding(.horizontal)
                }
                
                // 版本信息
                Text("版本 1.0.0")
                    .font(.system(size: 14))
                    .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                    .padding(.top, 20)
            }
            .padding(.bottom, 80) // 为底部导航留出空间
            
            // 各类弹窗
            .sheet(isPresented: $showAboutInfo) {
                AboutAppView()
            }
            .sheet(isPresented: $showAppRatingSheet) {
                AppRatingView()
            }
            .sheet(isPresented: $showShareSheet) {
                AppShareView()
            }
            .sheet(isPresented: $showPrivacyPolicy) {
                PrivacyPolicyView()
            }
        }
    }
    
    private func setAppearance(to darkMode: Bool) {
        // 根据深色模式切换应用外观
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.overrideUserInterfaceStyle = darkMode ? .dark : .light
    }
    
    private func settingsToggle(title: String, icon: String, isOn: Binding<Bool>) -> some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 18))
                .frame(width: 30, height: 30)
                .foregroundColor(SolarColors.textColor(for: colorScheme))
            
            Text(title)
                .font(.system(size: 16))
                .foregroundColor(SolarColors.textColor(for: colorScheme))
            
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
                .foregroundColor(SolarColors.textColor(for: colorScheme))
            
            Text(title)
                .font(.system(size: 16))
                .foregroundColor(SolarColors.textColor(for: colorScheme))
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .contentShape(Rectangle())
    }
}

// 关于应用页面
struct AboutAppView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("二十四节气")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(SolarColors.textColor(for: colorScheme))
                        .padding(.top)
                    
                    Text("二十四节气是中国古代订立的一种用来指导农事的补充历法，是中国传统文化的瑰宝。它将一年划分为二十四个节气，描述了一年中气候、物候等方面的变化规律。")
                        .foregroundColor(SolarColors.textColor(for: colorScheme))
                        .lineSpacing(6)
                    
                    Text("1、春季节气")
                        .font(.headline)
                        .foregroundColor(SolarColors.textColor(for: colorScheme))
                        .padding(.top, 5)
                    Text("立春、雨水、惊蛰、春分、清明、谷雨")
                        .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                    
                    Text("2、夏季节气")
                        .font(.headline)
                        .foregroundColor(SolarColors.textColor(for: colorScheme))
                        .padding(.top, 5)
                    Text("立夏、小满、芒种、夏至、小暑、大暑")
                        .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                    
                    Text("3、秋季节气")
                        .font(.headline)
                        .foregroundColor(SolarColors.textColor(for: colorScheme))
                        .padding(.top, 5)
                    Text("立秋、处暑、白露、秋分、寒露、霜降")
                        .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                    
                    Text("4、冬季节气")
                        .font(.headline)
                        .foregroundColor(SolarColors.textColor(for: colorScheme))
                        .padding(.top, 5)
                    Text("立冬、小雪、大雪、冬至、小寒、大寒")
                        .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                    
                    Text("2016年11月30日，二十四节气被联合国教科文组织列入人类非物质文化遗产代表作名录。")
                        .foregroundColor(SolarColors.textColor(for: colorScheme))
                        .padding(.top, 10)
                        .lineSpacing(6)
                    
                    Spacer()
                }
                .padding()
            }
            .background(colorScheme == .dark ? SolarColors.darkModeBackground : Color.white)
            .navigationBarTitle("关于节气", displayMode: .inline)
            .navigationBarItems(trailing: Button("关闭") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

// 评价应用页面
struct AppRatingView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var rating: Int = 0
    @State private var feedback: String = ""
    @State private var hasSubmitted = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if !hasSubmitted {
                    Text("请评价节气应用")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(SolarColors.textColor(for: colorScheme))
                        .padding(.top, 30)
                    
                    Text("您的反馈对我们至关重要")
                        .font(.system(size: 16))
                        .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                    
                    // 星级评分
                    HStack(spacing: 12) {
                        ForEach(1...5, id: \.self) { star in
                            Image(systemName: star <= rating ? "star.fill" : "star")
                                .font(.system(size: 30))
                                .foregroundColor(star <= rating ? .yellow : .gray)
                                .onTapGesture {
                                    rating = star
                                }
                        }
                    }
                    .padding(.vertical, 20)
                    
                    // 反馈文本框
                    VStack(alignment: .leading) {
                        Text("您的反馈建议:")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(SolarColors.textColor(for: colorScheme))
                            .padding(.bottom, 8)
                        
                        TextEditor(text: $feedback)
                            .frame(height: 150)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                    }
                    .padding(.horizontal)
                    
                    // 提交按钮
                    Button(action: {
                        // 提交评分和反馈的逻辑
                        hasSubmitted = true
                    }) {
                        Text("提交反馈")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .background(rating > 0 ? Color.green : Color.gray)
                            .cornerRadius(10)
                    }
                    .disabled(rating == 0)
                    .padding(.horizontal)
                    .padding(.top, 30)
                } else {
                    // 提交成功后的界面
                    VStack(spacing: 20) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.green)
                            .padding(.top, 40)
                        
                        Text("感谢您的反馈！")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(SolarColors.textColor(for: colorScheme))
                        
                        Text("您的意见对我们改进应用非常重要")
                            .font(.system(size: 16))
                            .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                            .multilineTextAlignment(.center)
                        
                        Button("返回") {
                            presentationMode.wrappedValue.dismiss()
                        }
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(width: 200)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.top, 30)
                    }
                    .padding()
                }
                
                Spacer()
            }
            .padding()
            .background(colorScheme == .dark ? SolarColors.darkModeBackground : Color.white)
            .navigationBarTitle("评价应用", displayMode: .inline)
            .navigationBarItems(trailing: Button("关闭") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

// 分享应用页面
struct AppShareView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var isSharePresented = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                Text("分享二十四节气应用")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(SolarColors.textColor(for: colorScheme))
                    .padding(.top, 30)
                
                Text("将这款应用分享给你的朋友和家人")
                    .font(.system(size: 16))
                    .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                    .multilineTextAlignment(.center)
                
                // 应用图标
                ZStack {
                    Circle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [.blue, .green]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                        .frame(width: 120, height: 120)
                    
                    Image(systemName: "leaf.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.white)
                }
                .padding(.vertical, 30)
                
                // 分享渠道
                VStack(spacing: 15) {
                    Text("选择分享方式")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(SolarColors.textColor(for: colorScheme))
                    
                    HStack(spacing: 30) {
                        shareButton(icon: "message.fill", color: .green, text: "消息")
                        shareButton(icon: "link", color: .blue, text: "复制链接")
                        shareButton(icon: "square.and.arrow.up", color: .orange, text: "更多")
                            .onTapGesture {
                                isSharePresented = true
                            }
                    }
                    .padding(.top, 10)
                }
                .padding()
                .background(SolarColors.cardBackground(for: colorScheme))
                .cornerRadius(15)
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .background(colorScheme == .dark ? SolarColors.darkModeBackground : Color.white)
            .navigationBarTitle("分享应用", displayMode: .inline)
            .navigationBarItems(trailing: Button("关闭") {
                presentationMode.wrappedValue.dismiss()
            })
            .sheet(isPresented: $isSharePresented) {
                // 系统分享表单
                if let appURL = URL(string: "https://apps.apple.com/app/id1234567890") {
                    ActivityViewController(activityItems: ["二十四节气应用 - 了解传统节气文化", appURL])
                }
            }
        }
    }
    
    // 分享按钮组件
    private func shareButton(icon: String, color: Color, text: String) -> some View {
        VStack {
            ZStack {
                Circle()
                    .fill(color)
                    .frame(width: 50, height: 50)
                
                Image(systemName: icon)
                    .font(.system(size: 22))
                    .foregroundColor(.white)
            }
            
            Text(text)
                .font(.system(size: 14))
                .foregroundColor(SolarColors.textColor(for: colorScheme))
        }
        .contentShape(Rectangle())
    }
}

// 用于支持系统分享功能的UIViewControllerRepresentable
struct ActivityViewController: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities
        )
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

// 隐私政策页面
struct PrivacyPolicyView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text("隐私政策")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(SolarColors.textColor(for: colorScheme))
                        .padding(.top)
                    
                    Group {
                        Text("隐私声明")
                            .font(.headline)
                            .foregroundColor(SolarColors.textColor(for: colorScheme))
                            .padding(.top, 10)
                        
                        Text("我们重视您的隐私。本隐私政策说明了我们如何收集、使用、披露、转移和存储您的信息。请花一点时间熟悉我们的隐私惯例，如有任何问题，请随时联系我们。")
                            .foregroundColor(SolarColors.textColor(for: colorScheme))
                            .lineSpacing(6)
                        
                        Text("信息收集与使用")
                            .font(.headline)
                            .foregroundColor(SolarColors.textColor(for: colorScheme))
                            .padding(.top, 10)
                        
                        Text("二十四节气应用收集的信息仅用于提供并改进我们的服务。除非在本隐私政策中描述，否则我们不会使用或分享您的信息。\n\n我们可能收集的个人数据包括：设备信息、位置数据（仅用于提供本地节气信息）和使用统计数据。")
                            .foregroundColor(SolarColors.textColor(for: colorScheme))
                            .lineSpacing(6)
                        
                        Text("数据安全")
                            .font(.headline)
                            .foregroundColor(SolarColors.textColor(for: colorScheme))
                            .padding(.top, 10)
                        
                        Text("我们重视您的信任，所以我们使用商业上可接受的方式来保护您的个人信息。但请记住，没有任何一种互联网传输方法或电子存储方法是100%安全的。")
                            .foregroundColor(SolarColors.textColor(for: colorScheme))
                            .lineSpacing(6)
                        
                        Text("第三方服务")
                            .font(.headline)
                            .foregroundColor(SolarColors.textColor(for: colorScheme))
                            .padding(.top, 10)
                        
                        Text("我们可能使用第三方服务来帮助分析用户如何使用我们的应用。这些第三方可能收集您的信息，但仅用于执行与我们的应用相关的任务。")
                            .foregroundColor(SolarColors.textColor(for: colorScheme))
                            .lineSpacing(6)
                        
                        Text("更新")
                            .font(.headline)
                            .foregroundColor(SolarColors.textColor(for: colorScheme))
                            .padding(.top, 10)
                        
                        Text("我们可能会不时更新我们的隐私政策。因此，建议您定期查看此页面了解任何更改。我们会通过在此页面上发布新的隐私政策来通知您任何更改。")
                            .foregroundColor(SolarColors.textColor(for: colorScheme))
                            .lineSpacing(6)
                    }
                    
                    Text("联系我们")
                        .font(.headline)
                        .foregroundColor(SolarColors.textColor(for: colorScheme))
                        .padding(.top, 10)
                    
                    Text("如果您对我们的隐私政策有任何疑问或建议，请随时联系我们：\nsupport@solar24.com")
                        .foregroundColor(SolarColors.textColor(for: colorScheme))
                        .lineSpacing(6)
                    
                    Text("最后更新: 2024年3月")
                        .font(.system(size: 14))
                        .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                        .padding(.top, 30)
                    
                    Spacer()
                }
                .padding()
            }
            .background(colorScheme == .dark ? SolarColors.darkModeBackground : Color.white)
            .navigationBarTitle("隐私政策", displayMode: .inline)
            .navigationBarItems(trailing: Button("关闭") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
} 