//
//  ContentView.swift
//  solar-app3
//
//  Created by 张振澜 on 2025/3/21.
//

import SwiftUI
import SwiftData

enum Tab {
    case today, calendar, music, profile
}

struct ContentView: View {
    @State private var selectedTab: Tab = .today
    @State private var currentSolarTerm: SolarTerm = SolarTermsData.shared.getCurrentSolarTerm()
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ZStack {
            // 背景色根据当前节气变化
            SolarColors.getSeasonColor(for: currentSolarTerm)
                .opacity(isDarkMode ? 0.05 : 0.15)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // 内容区域
                TabView(selection: $selectedTab) {
                    TodayView(solarTerm: currentSolarTerm)
                        .tag(Tab.today)
                    
                    CalendarView()
                        .tag(Tab.calendar)
                    
                    MusicView(solarTerm: currentSolarTerm)
                        .tag(Tab.music)
                    
                    ProfileView()
                        .tag(Tab.profile)
                }
                
                // 底部导航
                HStack {
                    NavButton(
                        title: "今日",
                        systemImage: "sun.max",
                        isActive: selectedTab == .today,
                        action: { selectedTab = .today }
                    )
                    
                    NavButton(
                        title: "日历",
                        systemImage: "calendar",
                        isActive: selectedTab == .calendar,
                        action: { selectedTab = .calendar }
                    )
                    
                    NavButton(
                        title: "音乐",
                        systemImage: "music.note",
                        isActive: selectedTab == .music,
                        action: { selectedTab = .music }
                    )
                    
                    NavButton(
                        title: "我的",
                        systemImage: "person",
                        isActive: selectedTab == .profile,
                        action: { selectedTab = .profile }
                    )
                }
                .padding(.vertical, 10)
                .background(
                    colorScheme == .dark ? 
                        SolarColors.darkModeBackground.opacity(0.9) : 
                        Color.white
                )
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -2)
                .padding(.horizontal)
                .padding(.bottom, 5)
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .onChange(of: selectedTab) { newTab in
            if newTab == .today {
                // 刷新当前节气数据
                currentSolarTerm = SolarTermsData.shared.getCurrentSolarTerm()
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: SolarTerm.self, inMemory: true)
}
