import Foundation

class SolarTermsData {
    static let shared = SolarTermsData()
    
    func getAllSolarTerms() -> [SolarTerm] {
        return [
            SolarTerm(
                name: "立春", 
                englishName: "Beginning of Spring", 
                date: createDate(month: 2, day: 4, year: 2024), 
                termDescription: "立春，是一年二十四节气中的第一个节气，春季的第一个节气。每年2月3日至5日之间，太阳到达黄经315度时为立春。", 
                farmingActivities: "春耕备耕，检修农具，准备种子。", 
                climaticFeatures: "乍暖还寒，气温开始回升，雨水增多。", 
                folkCustoms: "迎春、放风筝、踏青、吃春饼。", 
                poetry: "一年之计在于春，立春之日竞新雨。", 
                backgroundImageName: "spring_background", 
                seasonColor: "#B4E134"
            ),
            SolarTerm(
                name: "雨水", 
                englishName: "Rain Water", 
                date: createDate(month: 2, day: 19, year: 2024), 
                termDescription: "雨水，是二十四节气中的第二个节气，春季的第二个节气。每年2月18日至20日之间，太阳到达黄经330度时为雨水。", 
                farmingActivities: "早稻育秧，准备耕种。", 
                climaticFeatures: "降雨开始增多，气温逐渐回升。", 
                folkCustoms: "祭龙王、求雨、吃龙鳞饼。", 
                poetry: "雨水沾衣湿，春风著意吹。", 
                backgroundImageName: "rain_background", 
                seasonColor: "#B4E134"
            ),
            SolarTerm(
                name: "惊蛰", 
                englishName: "Awakening of Insects", 
                date: createDate(month: 3, day: 5, year: 2024), 
                termDescription: "惊蛰，二十四节气之第三个节气，春季的第三个节气。每年3月5日至6日之间，太阳到达黄经345度时为惊蛰。", 
                farmingActivities: "春播开始，播种早熟作物。", 
                climaticFeatures: "气温显著回升，雷雨增多，蛰伏的昆虫开始活动。", 
                folkCustoms: "祭白虎、打小人、吃梨。", 
                poetry: "惊蛰雷声隐隐传，花开草长春光妍。", 
                backgroundImageName: "spring_background", 
                seasonColor: "#B4E134"
            ),
            SolarTerm(
                name: "春分", 
                englishName: "Spring Equinox", 
                date: createDate(month: 3, day: 20, year: 2024), 
                termDescription: "春分，二十四节气之第四个节气，春季的第四个节气。每年3月20日至21日之间，太阳到达黄经0度时为春分。", 
                farmingActivities: "种植粮食作物，管理果树。", 
                climaticFeatures: "昼夜平分，阳光充足，春意盎然。", 
                folkCustoms: "祭祖、立蛋、吃春菜。", 
                poetry: "春分天气好，农事不可抛。", 
                backgroundImageName: "spring_background", 
                seasonColor: "#B4E134"
            ),
            SolarTerm(
                name: "清明", 
                englishName: "Pure Brightness", 
                date: createDate(month: 4, day: 4, year: 2024), 
                termDescription: "清明，二十四节气之第五个节气，春季的第五个节气。每年4月4日至6日之间，太阳到达黄经15度时为清明。", 
                farmingActivities: "春耕加紧，种植油料作物。", 
                climaticFeatures: "气温升高，雨量增多，天气清爽明朗。", 
                folkCustoms: "扫墓、踏青、放风筝、荡秋千。", 
                poetry: "清明时节雨纷纷，路上行人欲断魂。", 
                backgroundImageName: "spring_background", 
                seasonColor: "#B4E134"
            ),
            SolarTerm(
                name: "谷雨", 
                englishName: "Grain Rain", 
                date: createDate(month: 4, day: 19, year: 2024), 
                termDescription: "谷雨，二十四节气之第六个节气，春季的最后一个节气。每年4月19日至21日之间，太阳到达黄经30度时为谷雨。", 
                farmingActivities: "适时播种，移栽秧苗。", 
                climaticFeatures: "降雨量增多，有利于谷类农作物生长。", 
                folkCustoms: "尝鲜、祭雨神、制茶。", 
                poetry: "谷雨前后，种瓜种豆。", 
                backgroundImageName: "spring_background", 
                seasonColor: "#B4E134"
            ),
            SolarTerm(
                name: "立夏", 
                englishName: "Beginning of Summer", 
                date: createDate(month: 5, day: 5, year: 2024), 
                termDescription: "立夏，二十四节气之第七个节气，夏季的第一个节气。每年5月5日至7日之间，太阳到达黄经45度时为立夏。", 
                farmingActivities: "管理麦田，防治病虫害。", 
                climaticFeatures: "气温明显升高，降水增多，雷雨天气增多。", 
                folkCustoms: "称人、菖蒲酒、吃五色饭。", 
                poetry: "小满将至夏渐长，农家好趁晴和忙。", 
                backgroundImageName: "summer_background", 
                seasonColor: "#1CA0E3"
            ),
            SolarTerm(
                name: "小满", 
                englishName: "Lesser Fullness of Grain", 
                date: createDate(month: 5, day: 20, year: 2024), 
                termDescription: "小满，二十四节气之第八个节气，夏季的第二个节气。每年5月20日至22日之间，太阳到达黄经60度时为小满。", 
                farmingActivities: "管理水田，灌溉农作物。", 
                climaticFeatures: "全国大部分地区进入夏季，气温升高，降水增多。", 
                folkCustoms: "祭龙王、避五毒、吃野菜。", 
                poetry: "小满田家好种谷，麦穗初齐稻始分。", 
                backgroundImageName: "summer_background", 
                seasonColor: "#1CA0E3"
            ),
            // 后续节气数据可以继续添加...
            SolarTerm(
                name: "夏至", 
                englishName: "Summer Solstice", 
                date: createDate(month: 6, day: 21, year: 2024), 
                termDescription: "夏至，是二十四节气之第十个节气，夏季的第三个节气。每年6月21日至22日之间，太阳到达黄经90度时为夏至。", 
                farmingActivities: "管理夏收作物，抢收抢种。", 
                climaticFeatures: "北半球一年中白昼最长的一天，气温最高，雷雨频繁。", 
                folkCustoms: "晒书、吃凉面、饮绿豆汤。", 
                poetry: "夏至到，暑气高，农家麦收不敢懈。", 
                backgroundImageName: "summer_background", 
                seasonColor: "#1CA0E3"
            ),
            SolarTerm(
                name: "秋分", 
                englishName: "Autumn Equinox", 
                date: createDate(month: 9, day: 22, year: 2024), 
                termDescription: "秋分，是二十四节气之第十六个节气，秋季的第四个节气。每年9月22日至24日之间，太阳到达黄经180度时为秋分。", 
                farmingActivities: "收获秋季作物，准备冬小麦播种。", 
                climaticFeatures: "昼夜平分，气温由热转凉，秋高气爽。", 
                folkCustoms: "拜月、吃秋果、团圆饭。", 
                poetry: "秋分天气凉，早晚要添衣裳。", 
                backgroundImageName: "autumn_background", 
                seasonColor: "#F78C35"
            ),
            SolarTerm(
                name: "立冬", 
                englishName: "Beginning of Winter", 
                date: createDate(month: 11, day: 7, year: 2024), 
                termDescription: "立冬，是二十四节气之第十九个节气，冬季的第一个节气。每年11月7日至8日之间，太阳到达黄经225度时为立冬。", 
                farmingActivities: "准备冬耕，处理农作物。", 
                climaticFeatures: "气温下降，北风增强，天气寒冷。", 
                folkCustoms: "贴窗花、吃冬至饭、冬补。", 
                poetry: "今日立冬冬至到，日短夜长三九寒。", 
                backgroundImageName: "winter_background", 
                seasonColor: "#2E618A"
            ),
        ]
    }
    
    func getCurrentSolarTerm() -> SolarTerm {
        let allTerms = getAllSolarTerms()
        let today = Date()
        
        // 默认返回立春，实际应用中应根据当前日期计算最近的节气
        // 这里为简化，仅根据月份粗略判断
        let month = Calendar.current.component(.month, from: today)
        
        switch month {
        case 2, 3: // 春季节气
            return allTerms.filter { $0.name == "立春" }.first!
        case 4, 5: // 春末夏初
            return allTerms.filter { $0.name == "立夏" }.first!
        case 6, 7, 8: // 夏季
            return allTerms.filter { $0.name == "夏至" }.first!
        case 9, 10: // 秋季
            return allTerms.filter { $0.name == "秋分" }.first!
        case 11, 12, 1: // 冬季
            return allTerms.filter { $0.name == "立冬" }.first!
        default:
            return allTerms[0]
        }
    }
    
    private func createDate(month: Int, day: Int, year: Int) -> Date {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        return Calendar.current.date(from: components)!
    }
} 