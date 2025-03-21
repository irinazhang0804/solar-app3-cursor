import Foundation

class SolarTermsData {
    static let shared = SolarTermsData()
    
    func getAllSolarTerms() -> [SolarTerm] {
        return [
            // 春季节气 - 正确顺序：立春、雨水、惊蛰、春分、清明、谷雨
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
            
            // 夏季节气 - 正确顺序：立夏、小满、芒种、夏至、小暑、大暑
            SolarTerm(
                name: "立夏", 
                englishName: "Beginning of Summer", 
                date: createDate(month: 5, day: 5, year: 2024), 
                termDescription: "立夏，二十四节气之第七个节气，夏季的第一个节气。每年5月5日至7日之间，太阳到达黄经45度时为立夏。", 
                farmingActivities: "管理麦田，防治病虫害。", 
                climaticFeatures: "气温明显升高，降水增多，雷雨天气增多。", 
                folkCustoms: "称人、菖蒲酒、吃五色饭。", 
                poetry: "立夏日，天气新，农家梦里湿衣巾。", 
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
            SolarTerm(
                name: "芒种", 
                englishName: "Grain in Ear", 
                date: createDate(month: 6, day: 5, year: 2024), 
                termDescription: "芒种，二十四节气之第九个节气，夏季的第三个节气。每年6月5日至7日之间，太阳到达黄经75度时为芒种。", 
                farmingActivities: "收割冬小麦，种植晚稻。", 
                climaticFeatures: "气温继续升高，雨量增加，农作物进入抽穗期。", 
                folkCustoms: "尝麦、尝枣、端午节习俗。", 
                poetry: "芒种时节雨纷纷，田家喜获麦熟金。", 
                backgroundImageName: "summer_background", 
                seasonColor: "#1CA0E3"
            ),
            SolarTerm(
                name: "夏至", 
                englishName: "Summer Solstice", 
                date: createDate(month: 6, day: 21, year: 2024), 
                termDescription: "夏至，是二十四节气之第十个节气，夏季的第四个节气。每年6月21日至22日之间，太阳到达黄经90度时为夏至。", 
                farmingActivities: "管理夏收作物，抢收抢种。", 
                climaticFeatures: "北半球一年中白昼最长的一天，气温最高，雷雨频繁。", 
                folkCustoms: "晒书、吃凉面、饮绿豆汤。", 
                poetry: "夏至到，暑气高，农家麦收不敢懈。", 
                backgroundImageName: "summer_background", 
                seasonColor: "#1CA0E3"
            ),
            SolarTerm(
                name: "小暑", 
                englishName: "Lesser Heat", 
                date: createDate(month: 7, day: 7, year: 2024), 
                termDescription: "小暑，二十四节气之第十一个节气，夏季的第五个节气。每年7月6日至8日之间，太阳到达黄经105度时为小暑。", 
                farmingActivities: "防旱抗旱，田间管理。", 
                climaticFeatures: "气温继续升高，酷暑开始，雷阵雨增多。", 
                folkCustoms: "晒伏姜、晒伏鸭、煮羊肉。", 
                poetry: "小暑大暑不外出，贪凉避暑防中暑。", 
                backgroundImageName: "summer_background", 
                seasonColor: "#1CA0E3"
            ),
            SolarTerm(
                name: "大暑", 
                englishName: "Greater Heat", 
                date: createDate(month: 7, day: 23, year: 2024), 
                termDescription: "大暑，二十四节气之第十二个节气，夏季的最后一个节气。每年7月22日至24日之间，太阳到达黄经120度时为大暑。", 
                farmingActivities: "加强农田管理，保护作物安全度夏。", 
                climaticFeatures: "一年中最热的时期，高温酷暑，雷暴雨频繁。", 
                folkCustoms: "吃西瓜、喝绿豆汤、吃羊肉泡馍。", 
                poetry: "大暑气温高，池塘水温热又烫。", 
                backgroundImageName: "summer_background", 
                seasonColor: "#1CA0E3"
            ),
            
            // 秋季节气 - 正确顺序：立秋、处暑、白露、秋分、寒露、霜降
            SolarTerm(
                name: "立秋", 
                englishName: "Beginning of Autumn", 
                date: createDate(month: 8, day: 7, year: 2024), 
                termDescription: "立秋，二十四节气之第十三个节气，秋季的第一个节气。每年8月7日至9日之间，太阳到达黄经135度时为立秋。", 
                farmingActivities: "收获早稻，播种秋季作物。", 
                climaticFeatures: "暑热开始减退，早晚较凉爽，降雨减少。", 
                folkCustoms: "贴秋膘、啃秋、吃西瓜。", 
                poetry: "立秋之日凉风起，白露勤收夏熟禾。", 
                backgroundImageName: "autumn_background", 
                seasonColor: "#F78C35"
            ),
            SolarTerm(
                name: "处暑", 
                englishName: "End of Heat", 
                date: createDate(month: 8, day: 23, year: 2024), 
                termDescription: "处暑，二十四节气之第十四个节气，秋季的第二个节气。每年8月22日至24日之间，太阳到达黄经150度时为处暑。", 
                farmingActivities: "收获作物，晚稻管理。", 
                climaticFeatures: "暑热逐渐消退，天气变得凉爽，降雨减少。", 
                folkCustoms: "泡药酒、吃鸭子、饮酸梅汤。", 
                poetry: "处暑天气凉，早晚添衣裳。", 
                backgroundImageName: "autumn_background", 
                seasonColor: "#F78C35"
            ),
            SolarTerm(
                name: "白露", 
                englishName: "White Dew", 
                date: createDate(month: 9, day: 7, year: 2024), 
                termDescription: "白露，二十四节气之第十五个节气，秋季的第三个节气。每年9月7日至9日之间，太阳到达黄经165度时为白露。", 
                farmingActivities: "收获作物，准备秋收。", 
                climaticFeatures: "气温进一步下降，晨露增多，天高气爽。", 
                folkCustoms: "祭月、吃芋头、品秋茶。", 
                poetry: "白露秋分夜，一夜凉一夜。", 
                backgroundImageName: "autumn_background", 
                seasonColor: "#F78C35"
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
                name: "寒露", 
                englishName: "Cold Dew", 
                date: createDate(month: 10, day: 8, year: 2024), 
                termDescription: "寒露，二十四节气之第十七个节气，秋季的第五个节气。每年10月8日至9日之间，太阳到达黄经195度时为寒露。", 
                farmingActivities: "抢收秋粮，播种冬小麦。", 
                climaticFeatures: "气温显著下降，露水增多且带有寒意。", 
                folkCustoms: "吃柿子、饮菊花酒、品秋茶。", 
                poetry: "寒露时节一场霜，树叶黄黄满地黄。", 
                backgroundImageName: "autumn_background", 
                seasonColor: "#F78C35"
            ),
            SolarTerm(
                name: "霜降", 
                englishName: "Frost's Descent", 
                date: createDate(month: 10, day: 23, year: 2024), 
                termDescription: "霜降，二十四节气之第十八个节气，秋季的最后一个节气。每年10月23日至24日之间，太阳到达黄经210度时为霜降。", 
                farmingActivities: "收获晚熟作物，做好冬季准备。", 
                climaticFeatures: "气温进一步下降，开始降霜，北方地区初雪可能出现。", 
                folkCustoms: "吃柿子、喝姜茶、赏菊。", 
                poetry: "霜降千山叶落时，游人何处觅芳菲。", 
                backgroundImageName: "autumn_background", 
                seasonColor: "#F78C35"
            ),
            
            // 冬季节气 - 正确顺序：立冬、小雪、大雪、冬至、小寒、大寒
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
            SolarTerm(
                name: "小雪", 
                englishName: "Lesser Snow", 
                date: createDate(month: 11, day: 22, year: 2024), 
                termDescription: "小雪，二十四节气之第二十个节气，冬季的第二个节气。每年11月22日至23日之间，太阳到达黄经240度时为小雪。", 
                farmingActivities: "加固温室，整理农具。", 
                climaticFeatures: "气温显著下降，开始降雪，但雪量较小。", 
                folkCustoms: "吃萝卜、储藏蔬菜、冬补进补。", 
                poetry: "小雪纷纷下，寒意正浓时。", 
                backgroundImageName: "winter_background", 
                seasonColor: "#2E618A"
            ),
            SolarTerm(
                name: "大雪", 
                englishName: "Greater Snow", 
                date: createDate(month: 12, day: 7, year: 2024), 
                termDescription: "大雪，二十四节气之第二十一个节气，冬季的第三个节气。每年12月6日至8日之间，太阳到达黄经255度时为大雪。", 
                farmingActivities: "加强防寒，保护农作物和牲畜。", 
                climaticFeatures: "气温继续下降，降雪量大，雪量增多。", 
                folkCustoms: "熬羊肉汤、炖猪蹄、饮酒驱寒。", 
                poetry: "大雪封门不出门，围炉煮茗度朝昏。", 
                backgroundImageName: "winter_background", 
                seasonColor: "#2E618A"
            ),
            SolarTerm(
                name: "冬至", 
                englishName: "Winter Solstice", 
                date: createDate(month: 12, day: 21, year: 2024), 
                termDescription: "冬至，二十四节气之第二十二个节气，冬季的第四个节气。每年12月21日至23日之间，太阳到达黄经270度时为冬至。", 
                farmingActivities: "准备来年春耕，修整农具。", 
                climaticFeatures: "北半球一年中白昼最短的一天，气温寒冷。", 
                folkCustoms: "吃饺子、饮屠苏酒、贴九九消寒图。", 
                poetry: "冬至一阳生，万物始复苏。", 
                backgroundImageName: "winter_background", 
                seasonColor: "#2E618A"
            ),
            SolarTerm(
                name: "小寒", 
                englishName: "Lesser Cold", 
                date: createDate(month: 1, day: 5, year: 2024), 
                termDescription: "小寒，二十四节气之第二十三个节气，冬季的第五个节气。每年1月5日至7日之间，太阳到达黄经285度时为小寒。", 
                farmingActivities: "室内农事，准备春耕用具。", 
                climaticFeatures: "气温进一步下降，进入一年中最寒冷的时期。", 
                folkCustoms: "吃糯米饭、腊八粥、饮黄酒。", 
                poetry: "小寒时节天更寒，农家备耕犹未闲。", 
                backgroundImageName: "winter_background", 
                seasonColor: "#2E618A"
            ),
            SolarTerm(
                name: "大寒", 
                englishName: "Greater Cold", 
                date: createDate(month: 1, day: 20, year: 2024), 
                termDescription: "大寒，二十四节气之第二十四个节气，冬季的最后一个节气。每年1月20日至21日之间，太阳到达黄经300度时为大寒。", 
                farmingActivities: "室内农事，制作农具。", 
                climaticFeatures: "一年中最寒冷的节气，寒潮频繁，滴水成冰。", 
                folkCustoms: "祭灶、送灶、腌制腊肉。", 
                poetry: "大寒节气天气寒，三九四九冷断肝。", 
                backgroundImageName: "winter_background", 
                seasonColor: "#2E618A"
            )
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