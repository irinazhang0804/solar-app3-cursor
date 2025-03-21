import SwiftUI
import AVKit

struct MusicData: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let duration: String
    let imageName: String
    let externalURL: String // 添加外部音频URL
}

// 音乐播放管理器
class MusicPlayer: ObservableObject {
    static let shared = MusicPlayer()
    
    @Published var isPlaying = false
    @Published var currentTrack: MusicData?
    @Published var progress: Double = 0
    @Published var player: AVPlayer?
    private var timeObserver: Any?
    
    func play(track: MusicData) {
        if let url = URL(string: track.externalURL) {
            // 创建新的播放器
            let newPlayer = AVPlayer(url: url)
            
            // 移除旧的时间观察者
            if let player = self.player, let timeObserver = self.timeObserver {
                player.removeTimeObserver(timeObserver)
            }
            
            // 设置新的播放器
            self.player = newPlayer
            self.currentTrack = track
            self.isPlaying = true
            
            // 添加时间观察器来更新进度
            self.timeObserver = self.player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1), queue: .main) { [weak self] time in
                guard let self = self, let duration = self.player?.currentItem?.duration.seconds, !duration.isNaN else { return }
                self.progress = time.seconds / duration
            }
            
            // 开始播放
            self.player?.play()
        }
    }
    
    func togglePlayPause() {
        isPlaying.toggle()
        if isPlaying {
            player?.play()
        } else {
            player?.pause()
        }
    }
    
    func stop() {
        isPlaying = false
        player?.pause()
        player = nil
        currentTrack = nil
        progress = 0
    }
    
    // 清理资源
    func cleanup() {
        if let player = self.player, let timeObserver = self.timeObserver {
            player.removeTimeObserver(timeObserver)
        }
    }
    
    // 析构函数
    deinit {
        cleanup()
    }
}

struct MusicView: View {
    var solarTerm: SolarTerm
    @StateObject private var musicPlayer = MusicPlayer.shared
    @State private var currentIndex = 0
    @State private var showErrorAlert = false
    @State private var errorMessage = ""
    @Environment(\.colorScheme) private var colorScheme
    
    // 示例音乐数据(使用外部音频URL)
    private let musicList = [
        MusicData(title: "春江花月夜", artist: "古曲", duration: "5:30", imageName: "album", 
                 externalURL: "https://freepd.com/music/Chinese%20Teahouse.mp3"),
        MusicData(title: "高山流水", artist: "古曲", duration: "4:15", imageName: "album", 
                 externalURL: "https://freepd.com/music/Eastern%20Thought.mp3"),
        MusicData(title: "梅花三弄", artist: "古曲", duration: "3:45", imageName: "album", 
                 externalURL: "https://freepd.com/music/Gaining%20Perspective.mp3"),
        MusicData(title: "二泉映月", artist: "阿炳", duration: "6:20", imageName: "album", 
                 externalURL: "https://freepd.com/music/Pastoral%20Meditation.mp3"),
        MusicData(title: "十面埋伏", artist: "古曲", duration: "7:10", imageName: "album", 
                 externalURL: "https://freepd.com/music/Tranquility%20Base.mp3")
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
                    .foregroundColor(SolarColors.textColor(for: colorScheme))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                // 当前播放
                if let track = musicPlayer.currentTrack {
                    playerView(track: track)
                } else {
                    // 默认显示专辑图片
                    ZStack {
                        ImageAssets.albumCover
                            .frame(height: 200)
                            .cornerRadius(15)
                            .padding(.horizontal)
                        
                        Text("点击歌曲开始播放")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(10)
                    }
                }
                
                // 音乐列表
                VStack(alignment: .leading, spacing: 5) {
                    Text("推荐音乐")
                        .font(.headline)
                        .foregroundColor(SolarColors.textColor(for: colorScheme))
                        .padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(Array(musicList.enumerated()), id: \.element.id) { index, music in
                                musicRow(music: music, index: index)
                                
                                if index != musicList.count - 1 {
                                    Divider()
                                        .padding(.leading, 70)
                                }
                            }
                        }
                        .background(SolarColors.cardBackground(for: colorScheme))
                        .cornerRadius(15)
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
            .padding(.bottom, 80) // 为底部导航留出空间
            .alert(isPresented: $showErrorAlert) {
                Alert(
                    title: Text("播放错误"),
                    message: Text(errorMessage),
                    dismissButton: .default(Text("确定"))
                )
            }
        }
    }
    
    private func musicRow(music: MusicData, index: Int) -> some View {
        HStack(spacing: 15) {
            // 音乐封面 - 使用实际图片
            ImageAssets.getBundleImage(named: music.imageName)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 5) {
                Text(music.title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(SolarColors.textColor(for: colorScheme))
                
                Text(music.artist)
                    .font(.system(size: 14))
                    .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
            }
            
            Spacer()
            
            Text(music.duration)
                .font(.system(size: 14))
                .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
            
            Button(action: {
                playMusic(music: music, index: index)
            }) {
                Image(systemName: (musicPlayer.currentTrack?.title == music.title && musicPlayer.isPlaying) ? "pause.circle" : "play.circle")
                    .font(.system(size: 24))
                    .foregroundColor(SolarColors.getSeasonColor(for: solarTerm))
            }
        }
        .padding()
        .contentShape(Rectangle())
        .onTapGesture {
            playMusic(music: music, index: index)
        }
    }
    
    private func playMusic(music: MusicData, index: Int) {
        if musicPlayer.currentTrack?.title == music.title {
            musicPlayer.togglePlayPause()
        } else {
            currentIndex = index
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback)
                try AVAudioSession.sharedInstance().setActive(true)
                musicPlayer.play(track: music)
            } catch {
                errorMessage = "无法播放音频: \(error.localizedDescription)"
                showErrorAlert = true
            }
        }
    }
    
    private func playerView(track: MusicData) -> some View {
        VStack(spacing: 20) {
            // 顶部返回按钮
            HStack {
                Button(action: {
                    withAnimation(.easeInOut) {
                        musicPlayer.stop()
                    }
                }) {
                    HStack(spacing: 5) {
                        Image(systemName: "chevron.left")
                        Text("返回列表")
                    }
                    .font(.system(size: 14))
                    .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                }
                
                Spacer()
            }
            .padding(.horizontal)
            
            // 使用实际专辑封面图
            ImageAssets.getBundleImage(named: track.imageName)
                .frame(width: 180, height: 180)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(SolarColors.getSeasonColor(for: solarTerm), lineWidth: 2)
                )
                .padding(.top)
                .rotationEffect(Angle(degrees: musicPlayer.isPlaying ? 360 : 0))
                .animation(musicPlayer.isPlaying ? 
                          Animation.linear(duration: 20).repeatForever(autoreverses: false) : 
                          .default, 
                          value: musicPlayer.isPlaying)
            
            // 歌曲信息
            VStack(spacing: 8) {
                Text(track.title)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(SolarColors.textColor(for: colorScheme))
                
                Text(track.artist)
                    .font(.system(size: 16))
                    .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
            }
            
            // 进度条
            VStack(spacing: 8) {
                Slider(value: .constant(musicPlayer.progress))
                    .accentColor(SolarColors.getSeasonColor(for: solarTerm))
                    .disabled(true)
                
                HStack {
                    Text(formattedTime(time: musicPlayer.progress * getDuration(track.duration)))
                        .font(.system(size: 12))
                        .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                    
                    Spacer()
                    
                    Text(track.duration)
                        .font(.system(size: 12))
                        .foregroundColor(SolarColors.secondaryTextColor(for: colorScheme))
                }
            }
            .padding(.horizontal)
            
            // 播放控制
            HStack(spacing: 40) {
                Button(action: {
                    // 上一曲
                    if currentIndex > 0 {
                        currentIndex -= 1
                        playMusic(music: musicList[currentIndex], index: currentIndex)
                    }
                }) {
                    Image(systemName: "backward.fill")
                        .font(.system(size: 24))
                        .foregroundColor(currentIndex > 0 ? SolarColors.textColor(for: colorScheme) : Color.gray)
                }
                .disabled(currentIndex <= 0)
                
                Button(action: {
                    musicPlayer.togglePlayPause()
                }) {
                    Image(systemName: musicPlayer.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(SolarColors.getSeasonColor(for: solarTerm))
                }
                
                Button(action: {
                    // 下一曲
                    if currentIndex < musicList.count - 1 {
                        currentIndex += 1
                        playMusic(music: musicList[currentIndex], index: currentIndex)
                    }
                }) {
                    Image(systemName: "forward.fill")
                        .font(.system(size: 24))
                        .foregroundColor(currentIndex < musicList.count - 1 ? SolarColors.textColor(for: colorScheme) : Color.gray)
                }
                .disabled(currentIndex >= musicList.count - 1)
            }
        }
        .padding()
        .background(SolarColors.cardBackground(for: colorScheme))
        .cornerRadius(20)
        .padding(.horizontal)
    }
    
    // 将时间戳格式转换为秒数
    private func getDuration(_ timeString: String) -> Double {
        let components = timeString.split(separator: ":")
        if components.count == 2, let minutes = Double(components[0]), let seconds = Double(components[1]) {
            return minutes * 60.0 + seconds
        }
        return 0
    }
    
    // 将秒数格式化为时分秒
    private func formattedTime(time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
} 