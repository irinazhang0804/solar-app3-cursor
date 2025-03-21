import SwiftUI

struct MusicData: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let duration: String
    let imageName: String
}

struct MusicView: View {
    var solarTerm: SolarTerm
    @State private var isPlaying = false
    @State private var currentTrack: MusicData?
    @State private var progress: CGFloat = 0.3
    
    // 示例音乐数据
    private let musicList = [
        MusicData(title: "春江花月夜", artist: "古曲", duration: "5:30", imageName: "music_cover1"),
        MusicData(title: "高山流水", artist: "古曲", duration: "4:15", imageName: "music_cover2"),
        MusicData(title: "梅花三弄", artist: "古曲", duration: "3:45", imageName: "music_cover3"),
        MusicData(title: "二泉映月", artist: "阿炳", duration: "6:20", imageName: "music_cover4"),
        MusicData(title: "十面埋伏", artist: "古曲", duration: "7:10", imageName: "music_cover5")
    ]
    
    var body: some View {
        ZStack {
            // 背景
            LinearGradient(
                gradient: Gradient(colors: [
                    SolarColors.getSeasonColor(for: solarTerm),
                    SolarColors.getSeasonColor(for: solarTerm).opacity(0.5)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .opacity(0.2)
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // 标题
                Text("\(solarTerm.name)节气音乐")
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                // 当前播放
                if let track = currentTrack {
                    playerView(track: track)
                } else {
                    // 默认显示月亮图片
                    ZStack {
                        ImageAssets.musicBackground
                            .frame(height: 200)
                            .cornerRadius(15)
                            .padding(.horizontal)
                        
                        Text("点击歌曲开始播放")
                            .font(.headline)
                            .padding(10)
                            .background(Color.black.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                
                // 音乐列表
                VStack(alignment: .leading, spacing: 5) {
                    Text("推荐音乐")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(musicList) { music in
                                musicRow(music: music)
                                
                                if music.id != musicList.last?.id {
                                    Divider()
                                        .padding(.leading, 70)
                                }
                            }
                        }
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(15)
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
            .padding(.bottom, 80) // 为底部导航留出空间
        }
    }
    
    private func musicRow(music: MusicData) -> some View {
        HStack(spacing: 15) {
            // 音乐封面
            Circle()
                .fill(SolarColors.getSeasonColor(for: solarTerm).opacity(0.3))
                .frame(width: 50, height: 50)
                .overlay(
                    Image(systemName: "music.note")
                        .foregroundColor(SolarColors.getSeasonColor(for: solarTerm))
                )
            
            VStack(alignment: .leading, spacing: 5) {
                Text(music.title)
                    .font(.system(size: 16, weight: .medium))
                
                Text(music.artist)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(music.duration)
                .font(.system(size: 14))
                .foregroundColor(.secondary)
            
            Button(action: {
                withAnimation {
                    if currentTrack?.title == music.title {
                        isPlaying.toggle()
                    } else {
                        currentTrack = music
                        isPlaying = true
                    }
                }
            }) {
                Image(systemName: (currentTrack?.title == music.title && isPlaying) ? "pause.circle" : "play.circle")
                    .font(.system(size: 24))
                    .foregroundColor(SolarColors.getSeasonColor(for: solarTerm))
            }
        }
        .padding()
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                currentTrack = music
                isPlaying = true
            }
        }
    }
    
    private func playerView(track: MusicData) -> some View {
        VStack(spacing: 20) {
            // 封面图
            ZStack {
                Circle()
                    .fill(SolarColors.getSeasonColor(for: solarTerm).opacity(0.2))
                    .frame(width: 180, height: 180)
                
                Circle()
                    .stroke(SolarColors.getSeasonColor(for: solarTerm), lineWidth: 2)
                    .frame(width: 150, height: 150)
                
                Image(systemName: "music.note")
                    .font(.system(size: 40))
                    .foregroundColor(SolarColors.getSeasonColor(for: solarTerm))
            }
            .padding(.top)
            
            // 歌曲信息
            VStack(spacing: 8) {
                Text(track.title)
                    .font(.system(size: 22, weight: .bold))
                
                Text(track.artist)
                    .font(.system(size: 16))
                    .foregroundColor(.secondary)
            }
            
            // 进度条
            VStack(spacing: 8) {
                Slider(value: $progress)
                    .accentColor(SolarColors.getSeasonColor(for: solarTerm))
                
                HStack {
                    Text(formattedProgress)
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text(track.duration)
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal)
            
            // 播放控制
            HStack(spacing: 40) {
                Button(action: {}) {
                    Image(systemName: "backward.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.primary)
                }
                
                Button(action: { isPlaying.toggle() }) {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(SolarColors.getSeasonColor(for: solarTerm))
                }
                
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.primary)
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.9))
        .cornerRadius(20)
        .padding(.horizontal)
    }
    
    private var formattedProgress: String {
        let minutes = Int(progress * 5.5) / 60
        let seconds = Int(progress * 5.5) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
} 