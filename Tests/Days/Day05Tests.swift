import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.

final class Day05Tests: XCTestCase {
    private func assert(
        seed: Int,
        soilValue: Int,
        fertilizerValue: Int,
        waterValue: Int,
        lightValue: Int,
        temperatureValue: Int,
        humidityValue: Int,
        locationValue: Int,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        var challenge = Day05(
            data: .init(
                seeds: .init(data: "\(seed)"),
                seedToSoilMap: .sampleData,
                soilToFertilizerMap: .empty,
                fertilizerToWaterMap: .empty,
                waterToLightMap: .empty,
                lightToTemperatureMap: .empty,
                temperatureToHumidityMap: .empty,
                humidityToLocationMap: .empty
            )
        )
        XCTAssertEqual(String(describing: challenge.part1()), "\(soilValue)", file: file, line: line)
        
        challenge = Day05(
            data: .init(
                seeds: .init(data: "\(seed)"),
                seedToSoilMap: .sampleData,
                soilToFertilizerMap: .sampleData,
                fertilizerToWaterMap: .empty,
                waterToLightMap: .empty,
                lightToTemperatureMap: .empty,
                temperatureToHumidityMap: .empty,
                humidityToLocationMap: .empty
            )
        )
        XCTAssertEqual(String(describing: challenge.part1()), "\(fertilizerValue)", file: file, line: line)
        
        challenge = Day05(
            data: .init(
                seeds: .init(data: "\(seed)"),
                seedToSoilMap: .sampleData,
                soilToFertilizerMap: .sampleData,
                fertilizerToWaterMap: .sampleData,
                waterToLightMap: .empty,
                lightToTemperatureMap: .empty,
                temperatureToHumidityMap: .empty,
                humidityToLocationMap: .empty
            )
        )
        XCTAssertEqual(String(describing: challenge.part1()), "\(waterValue)", file: file, line: line)
        
        challenge = Day05(
            data: .init(
                seeds: .init(data: "\(seed)"),
                seedToSoilMap: .sampleData,
                soilToFertilizerMap: .sampleData,
                fertilizerToWaterMap: .sampleData,
                waterToLightMap: .sampleData,
                lightToTemperatureMap: .empty,
                temperatureToHumidityMap: .empty,
                humidityToLocationMap: .empty
            )
        )
        XCTAssertEqual(String(describing: challenge.part1()), "\(lightValue)", file: file, line: line)
        
        challenge = Day05(
            data: .init(
                seeds: .init(data: "\(seed)"),
                seedToSoilMap: .sampleData,
                soilToFertilizerMap: .sampleData,
                fertilizerToWaterMap: .sampleData,
                waterToLightMap: .sampleData,
                lightToTemperatureMap: .sampleData,
                temperatureToHumidityMap: .empty,
                humidityToLocationMap: .empty
            )
        )
        XCTAssertEqual(String(describing: challenge.part1()), "\(temperatureValue)", file: file, line: line)
        
        challenge = Day05(
            data: .init(
                seeds: .init(data: "\(seed)"),
                seedToSoilMap: .sampleData,
                soilToFertilizerMap: .sampleData,
                fertilizerToWaterMap: .sampleData,
                waterToLightMap: .sampleData,
                lightToTemperatureMap: .sampleData,
                temperatureToHumidityMap: .sampleData,
                humidityToLocationMap: .empty
            )
        )
        XCTAssertEqual(String(describing: challenge.part1()), "\(humidityValue)", file: file, line: line)
        
        challenge = Day05(
            data: .init(
                seeds: .init(data: "\(seed)"),
                seedToSoilMap: .sampleData,
                soilToFertilizerMap: .sampleData,
                fertilizerToWaterMap: .sampleData,
                waterToLightMap: .sampleData,
                lightToTemperatureMap: .sampleData,
                temperatureToHumidityMap: .sampleData,
                humidityToLocationMap: .sampleData
            )
        )
        XCTAssertEqual(String(describing: challenge.part1()), "\(locationValue)", file: file, line: line)
    }
}

// MARK: - Part 1 Test(s)
extension Day05Tests {
    func test_part1_inputData_1() throws {
        let challenge = Day05(data: .inputData)
        XCTAssertEqual(String(describing: challenge.part1()), "825516882")
    }
    
    func test_part1_inputData_2() throws {
        let challenge = Day05(data: .inputData2)
        XCTAssertEqual(String(describing: challenge.part1()), "240320250")
    }
    
    func test_part1_testData() throws {
        let challenge = Day05(data: .sampleData)
        XCTAssertEqual(String(describing: challenge.part1()), "35")
    }
    
    func test_part1_seed14() throws {
        let challenge = Day05(data: .sampleData(seeds: .sampleSeed14))
        XCTAssertEqual(String(describing: challenge.part1()), "43")
    }
    
    func test_part1_seed55() throws {
        let challenge = Day05(data: .sampleData(seeds: .sampleSeed55))
        XCTAssertEqual(String(describing: challenge.part1()), "86")
    }
    
    func test_part1_seed13() throws {
        let challenge = Day05(data: .sampleData(seeds: .sampleSeed13))
        XCTAssertEqual(String(describing: challenge.part1()), "35")
    }
    
    func test_part1_IntMin() throws {
        let seedValue = "\(Int.min)"
        let challenge = Day05(data: .sampleData(seeds: .init(data: seedValue)))
        XCTAssertEqual(String(describing: challenge.part1()), seedValue)
    }
    
    func test_part1_IntMax() throws {
        let seedValue = "\(1_000_000)"
        let challenge = Day05(data: .sampleData(seeds: .init(data: seedValue)))
        XCTAssertEqual(String(describing: challenge.part1()), seedValue)
    }
    
    func test_part1_sampleSeeds_withEmptyMap() throws {
        let challenge = Day05(data: .emptyMap(seeds: .sampleData))
        XCTAssertEqual(String(describing: challenge.part1()), "13")
    }
    
    func test_part1_inputSeds_withEmptyMap() throws {
        let challenge = Day05(data: .emptyMap(seeds: .inputData))
        XCTAssertEqual(String(describing: challenge.part1()), "5844012")
    }
    
    func test_part1_sampleSeeds_withIdentityMap() throws {
        let challenge = Day05(data: .identity(seeds: .sampleData))
        XCTAssertEqual(String(describing: challenge.part1()), "13")
    }
    
    func test_part1_inputSeds_withIdentityMap() throws {
        let challenge = Day05(data: .identity(seeds: .inputData))
        XCTAssertEqual(String(describing: challenge.part1()), "5844012")
    }
    
    func test_part1_WithIdentityMap() throws {
        let seedValue = "\(1_000_000)"
        let challenge = Day05(data: .identity(seeds: .init(data: seedValue)))
        XCTAssertEqual(String(describing: challenge.part1()), seedValue)
    }
    
    func test_part1_WithEmptyMap() throws {
        let seedValue = "\(1_000_000)"
        let challenge = Day05(data: .identity(seeds: .init(data: seedValue)))
        XCTAssertEqual(String(describing: challenge.part1()), seedValue)
    }
    
    func test_part1_AdHoc() throws {
        var mapData = "1 25 3"
        var challenge = Day05(data: .init(seeds: .init(data: "27"), seedToSoilMap: .init(data: mapData)))
        XCTAssertEqual(String(describing: challenge.part1()), "3")
        
        challenge = Day05(data: .init(seeds: .init(data: "27"), seedToSoilMap: .init(data: mapData)))
        XCTAssertEqual(String(describing: challenge.part1()), "3")
        
        challenge = Day05(data: .init(seeds: .init(data: "27"), seedToSoilMap: .init(data: mapData)))
        XCTAssertEqual(String(describing: challenge.part1()), "3")
        
        mapData = "52 50 48"
        challenge = Day05(data: .init(seeds: .init(data: "79"), seedToSoilMap: .init(data: mapData)))
        XCTAssertEqual(String(describing: challenge.part1()), "81")
        
        challenge = Day05(data: .init(seeds: .init(data: "14"), seedToSoilMap: .init(data: mapData)))
        XCTAssertEqual(String(describing: challenge.part1()), "14")
        
        challenge = Day05(data: .init(seeds: .init(data: "55"), seedToSoilMap: .init(data: mapData)))
        XCTAssertEqual(String(describing: challenge.part1()), "57")
    }
    
    func test_part1_Seed79() {
        assert(seed: 79,
               soilValue: 81,
               fertilizerValue: 81,
               waterValue: 81,
               lightValue: 74,
               temperatureValue: 78,
               humidityValue: 78,
               locationValue: 82)
    }
    
    func test_part1_Seed14() {
        assert(seed: 14,
               soilValue: 14,
               fertilizerValue: 53,
               waterValue: 49,
               lightValue: 42,
               temperatureValue: 42,
               humidityValue: 43,
               locationValue: 43)
    }
    
    func test_part1_Seed55() {
        assert(seed: 55,
               soilValue: 57,
               fertilizerValue: 57,
               waterValue: 53,
               lightValue: 46,
               temperatureValue: 82,
               humidityValue: 82,
               locationValue: 86)
    }
    
    func test_part1_Seed13() {
        assert(seed: 13,
               soilValue: 13,
               fertilizerValue: 52,
               waterValue: 41,
               lightValue: 34,
               temperatureValue: 34,
               humidityValue: 35,
               locationValue: 35)
    }
}

// MARK: - Part 2 Test(s)
extension Day05Tests {
    func test_part2() throws {
        let challenge = Day05(data: .sampleData)
        XCTAssertEqual(String(describing: challenge.part2()), "TODO")
    }
}

extension Day05 {
    init(data almanac: Almanac) {
        self.init(data: almanac.data)
    }
}

struct Almanac: TestDataRepresentation {
    let seeds: Seeds
    let seedToSoilMap: SeedToSoilMap
    let soilToFertilizerMap: SoilToFertilizerMap
    let fertilizerToWaterMap: FertilizerToWaterMap
    let waterToLightMap: WaterToLightMap
    let lightToTemperatureMap: LightToTemperatureMap
    let temperatureToHumidityMap: TemperatureToHumidityMap
    let humidityToLocationMap: HumidityToLocationMap
    
    init(
        seeds: Seeds,
        seedToSoilMap: SeedToSoilMap = .empty,
        soilToFertilizerMap: SoilToFertilizerMap = .empty,
        fertilizerToWaterMap: FertilizerToWaterMap = .empty,
        waterToLightMap: WaterToLightMap = .empty,
        lightToTemperatureMap: LightToTemperatureMap = .empty,
        temperatureToHumidityMap: TemperatureToHumidityMap = .empty,
        humidityToLocationMap: HumidityToLocationMap = .empty
    ) {
        self.seeds = seeds
        self.seedToSoilMap = seedToSoilMap
        self.soilToFertilizerMap = soilToFertilizerMap
        self.fertilizerToWaterMap = fertilizerToWaterMap
        self.waterToLightMap = waterToLightMap
        self.lightToTemperatureMap = lightToTemperatureMap
        self.temperatureToHumidityMap = temperatureToHumidityMap
        self.humidityToLocationMap = humidityToLocationMap
    }
    
    
    
    var data: String {
        """
        seeds: \(seeds.data)
        
        seed-to-soil map:
        \(seedToSoilMap.data)

        soil-to-fertilizer map:
        \(soilToFertilizerMap.data)

        fertilizer-to-water map:
        \(fertilizerToWaterMap.data)

        water-to-light map:
        \(waterToLightMap.data)
        
        light-to-temperature map:
        \(lightToTemperatureMap.data)

        temperature-to-humidity map:
        \(temperatureToHumidityMap.data)

        humidity-to-location map:
        \(humidityToLocationMap.data)
        """
    }
    
    static var sampleData: Self {
        sampleData(seeds: .sampleData)
    }
    
    static func sampleData(seeds: Seeds) -> Self {
        .init(
            seeds: seeds,
            seedToSoilMap: .sampleData,
            soilToFertilizerMap: .sampleData,
            fertilizerToWaterMap: .sampleData,
            waterToLightMap: .sampleData,
            lightToTemperatureMap: .sampleData,
            temperatureToHumidityMap: .sampleData,
            humidityToLocationMap: .sampleData
        )
    }
    
    static var inputData: Self {
        .init(
            seeds: .inputData,
            seedToSoilMap: .inputData,
            soilToFertilizerMap: .inputData,
            fertilizerToWaterMap: .inputData,
            waterToLightMap: .inputData,
            lightToTemperatureMap: .inputData,
            temperatureToHumidityMap: .inputData,
            humidityToLocationMap: .inputData
        )
    }
    
    static var inputData2: Self {
        .init(
            seeds: .inputData2,
            seedToSoilMap: .inputData2,
            soilToFertilizerMap: .inputData2,
            fertilizerToWaterMap: .inputData2,
            waterToLightMap: .inputData2,
            lightToTemperatureMap: .inputData2,
            temperatureToHumidityMap: .inputData2,
            humidityToLocationMap: .inputData2
        )
    }
    
    static func emptyMap(seeds: Seeds) -> Self {
        .init(
            seeds: seeds,
            seedToSoilMap: .empty,
            soilToFertilizerMap: .empty,
            fertilizerToWaterMap: .empty,
            waterToLightMap: .empty,
            lightToTemperatureMap: .empty,
            temperatureToHumidityMap: .empty,
            humidityToLocationMap: .empty
        )
    }
    
    static func identity(seeds: Seeds) -> Self {
        .init(
            seeds: seeds,
            seedToSoilMap: .identity,
            soilToFertilizerMap: .identity,
            fertilizerToWaterMap: .identity,
            waterToLightMap: .identity,
            lightToTemperatureMap: .identity,
            temperatureToHumidityMap: .identity,
            humidityToLocationMap: .identity
        )
    }
}

protocol TestDataRepresentation {
    var data: String { get }
}

protocol TestDataRepresentable: TestDataRepresentation {
    static var sampleData: Self { get }
    static var inputData: Self { get }
}

struct Seeds: TestDataRepresentable {
    let data: String
    
    static var sampleSeed79: Self { .init(data: "79") }
    static var sampleSeed14: Self { .init(data: "14") }
    static var sampleSeed55: Self { .init(data: "55") }
    static var sampleSeed13: Self { .init(data: "13") }
    
    static var sampleData: Self {
        .init(data: "\(sampleSeed79.data) \(sampleSeed14.data) \(sampleSeed55.data) \(sampleSeed13.data)")
    }
    
    static var inputData: Self {
        .init(data: "5844012 110899473 1132285750 58870036 986162929 109080640 3089574276 100113624 2693179996 275745330 2090752257 201704169 502075018 396653347 1540050181 277513792 1921754120 26668991 3836386950 66795009")
    }
    
    static var inputData2: Self {
        .init(data: "3429320627 235304036 1147330745 114559245 1684000747 468955901 677937579 96599505 1436970021 26560102 3886049334 159534901 936845926 25265009 3247146679 95841652 3696363517 45808572 2319065313 125950148")
    }
}

struct SeedToSoilMap: TestDataRepresentable {
    let data: String
    
    static var sampleData: Self {
        .init(data:
            """
            50 98 2
            52 50 48
            """
        )
    }
    
    static var inputData: Self {
        .init(data:
            """
            3547471595 1239929038 174680800
            3052451552 758183681 481745357
            0 1427884524 1775655006
            2844087171 549819300 208364381
            3767989253 4004864866 5194940
            3534196909 1414609838 13274686
            1775655006 114264781 435554519
            4148908402 4010059806 146058894
            2729822390 0 114264781
            3773184193 4156118700 138848596
            2211209525 3203539530 518612865
            3912032789 3767989253 236875613
            """
        )
    }
    
    static var inputData2: Self {
        .init(data:
            """
            583826644 2288418886 120919689
            2666741396 3172314277 160907737
            416244021 605500997 167582623
            779666561 2280573809 7845077
            704746333 908146497 74920228
            845411123 2565941729 61831565
            1527751557 3025978089 146336188
            2827649133 2012274036 268299773
            259640867 2409338575 156603154
            0 2766337222 259640867
            787511638 983066725 57899485
            907242688 1526828044 485445992
            1674087745 237273108 368227889
            2180879562 1040966210 485861834
            1392688680 773083620 135062877
            3095948906 0 237273108
            2042315634 2627773294 138563928
            """
        )
    }
    
    static var empty: Self {
        .init(data: "")
    }
    
    static var identity: Self {
        .init(data: "0 0 \(Int.max)")
    }
}

struct SoilToFertilizerMap: TestDataRepresentable {
    let data: String
    
    static var sampleData: Self {
        .init(data:
            """
            0 15 37
            37 52 2
            39 0 15
            """
        )
    }
    
    static var inputData: Self {
        .init(data:
            """
            912405184 1056091028 152837752
            194471272 1208928780 200072008
            136115250 240819204 58356022
            3502815281 3536983174 299994001
            2321814552 2458149869 18748048
            3173949445 2623931701 9591555
            394543280 888648379 167442649
            1990258415 3891640206 212931291
            1068754270 54862533 153774684
            1222528954 660792432 186471834
            3340878967 3405750148 131233026
            3472111993 3836977175 30703288
            561985929 299175226 225501956
            2942828492 4104571497 88527954
            874532405 850775600 37872779
            3031356446 3867680463 23959743
            842350418 208637217 32181987
            0 524677182 136115250
            1065242936 847264266 3511334
            2203189706 2339525023 118624846
            1929736108 2563409394 60522307
            3802809282 1847367009 492158014
            1847367009 2790861223 82369099
            2442430445 2873230322 500398047
            3183541000 2633523256 157337967
            3141827666 3373628369 32121779
            787487885 0 54862533
            3055316189 2476897917 86511477
            2340562600 4193099451 101867845
            """
        )
    }
    
    static var inputData2: Self {
        .init(data:
            """
            3793729374 3825015981 63222599
            1438266078 0 258943930
            1292079166 1479426911 146186912
            2816531945 2822520060 385496901
            1078023340 1741334425 98335224
            3856951973 3668871521 111838140
            4180611137 3904426682 114356159
            0 1958275780 804927654
            3968790113 3380257222 80572704
            843553208 2801828988 20691072
            1724422279 286156201 594958638
            3616894031 4018782841 39547646
            1697210008 258943930 27212271
            3700747997 3472761445 92981377
            4101643138 3565742822 50848378
            4152491516 3460829926 11931519
            976862296 1378265867 101161044
            2319380917 881114839 497151028
            3380257222 4058330487 236636809
            3656441677 3780709661 44306320
            864244280 1845657764 112618016
            1176358564 1625613823 115720602
            4164423035 3888238580 16188102
            3202028846 1839669649 5988115
            804927654 2763203434 38625554
            4049362817 3616591200 52280321
            """
        )
    }
    
    static var empty: Self {
        .init(data: "")
    }
    
    static var identity: Self {
        .init(data: "0 0 \(Int.max)")
    }
}

struct FertilizerToWaterMap: TestDataRepresentable {
    let data: String
    
    static var sampleData: Self {
        .init(data:
            """
            49 53 8
            0 11 42
            42 0 7
            57 7 4
            """
        )
    }
    
    static var inputData: Self {
        .init(data:
            """
            798315344 439687669 1930292
            1174979421 2966258900 475289790
            439687669 778614573 55925503
            3743699694 3453541232 155280637
            2989334775 1659556189 96021468
            1650269211 3441548690 11992542
            3898980331 3608821869 395986965
            1705125292 2123762646 842496254
            3375514705 1755577657 368184989
            646363825 441617961 94777173
            1662261753 1616692650 42863539
            495613172 627863920 150750653
            2777061135 1174979421 212273640
            741140998 834540076 57174346
            800245636 536395134 91468786
            2547621546 1387253061 229439589
            3085356243 4004808834 290158462
            """
        )
    }
    
    static var inputData2: Self {
        .init(data:
            """
            3734704645 4081344261 116089008
            474703780 198917265 194664963
            1879970783 393582228 36617128
            1197375949 1845422975 8989824
            466658346 430199356 8045434
            2310800010 2638298964 424967672
            919557740 1398638397 135905600
            3687134144 3790001806 1934146
            3470663058 2339708475 216471086
            1759740912 1126580170 64763562
            896009775 1048686270 23547965
            3348634097 3711378096 32073660
            3091810489 2234799361 92321214
            889058738 1119629133 6951037
            2784472328 3743451756 46550050
            2843610278 3063266636 231881310
            1532834459 674183164 226906453
            3273953517 2183514026 51285335
            3075491588 4197433269 16318901
            3325238852 3791935952 23395245
            3689068290 3665741741 45636355
            3384455721 3861402055 22006111
            3406461832 3295147946 64201226
            1412808810 438244790 32132927
            3380707757 2556179561 3747964
            3850793653 4001077593 80266668
            1450046808 470377717 82787651
            669368743 1626190154 219232821
            1365871086 1072234235 46937724
            3184131703 3969255894 11450375
            1824504474 553165368 55466309
            1206365773 1854412799 159505313
            1055463340 906773661 141912609
            3931060321 3359349172 306392569
            2756139006 3883408166 28333322
            193812194 608631677 65551487
            2229584884 4213752170 81215126
            3195582078 2559927525 78371439
            259363681 1191343732 207294665
            2183514026 3815331197 46070858
            2735767682 3980706269 20371324
            888601564 1119171959 457174
            1916587911 901089617 5684044
            1922271955 1534543997 91646157
            4237452890 3911741488 57514406
            2831022378 2327120575 12587900
            1444941737 193812194 5105071
            """
        )
    }
    
    static var empty: Self {
        .init(data: "")
    }
    
    static var identity: Self {
        .init(data: "0 0 \(Int.max)")
    }
}

struct WaterToLightMap: TestDataRepresentable {
    let data: String
    
    static var sampleData: Self {
        .init(data:
            """
            88 18 7
            18 25 70
            """
        )
    }
    
    static var inputData: Self {
        .init(data:
            """
            541719462 212840988 165903288
            3437755571 1615831015 672632835
            1051033542 2678450187 510773217
            243353905 378744276 104057369
            1561806759 3801474127 134575711
            707622750 677109833 258560892
            2580483557 1051033542 195631857
            0 935670725 30512917
            347411274 482801645 194308188
            30512917 0 127836567
            2190497220 2288463850 389986337
            3068589955 1246665399 369165616
            1754579039 3936049838 66442917
            4110388406 3616895237 184578890
            158349484 127836567 85004421
            2776115414 4002492755 292474541
            1821021956 3247419973 369475264
            1696382470 3189223404 58196569
            """
        )
    }
    
    static var inputData2: Self {
        .init(data:
            """
            3241790649 0 474458786
            1987249042 1535533387 1254541607
            289948525 715361304 527138528
            3716249435 1242499832 58349573
            1051771035 3080023519 694575489
            817087053 1300849405 234683982
            1746346524 474458786 240902518
            0 2790074994 289948525
            """
        )
    }
    
    static var empty: Self {
        .init(data: "")
    }
    
    static var identity: Self {
        .init(data: "0 0 \(Int.max)")
    }
}

struct LightToTemperatureMap: TestDataRepresentable {
    let data: String
    
    static var sampleData: Self {
        .init(data:
            """
            45 77 23
            81 45 19
            68 64 13
            """
        )
    }
    
    static var inputData: Self {
        .init(data:
            """
            338228166 2812162941 77503977
            3123877206 693964345 40932068
            3939438903 614787731 633466
            3301169239 2299402886 215156012
            3516325251 499164007 115623724
            3852145506 3365439095 87293397
            875755064 3565078024 729889272
            2849390436 734896413 11914872
            2861305308 215265512 77518872
            4220385528 2056242491 68417151
            2221674563 3167682469 34693717
            2765973467 292784384 83416969
            3198884011 1699097031 22283517
            3164809274 2889666918 34074737
            809366712 746811285 52314986
            4096970661 1633036395 58945085
            3221167528 2699611924 80001711
            697021180 3452732492 112345532
            2059345064 799126271 162329499
            4155915746 629494563 64469782
            2431111524 1721380548 334861943
            684283267 2779613635 12737913
            440342453 2923741655 243940814
            3634265609 961455770 217879897
            4288802679 3202376186 6164617
            415732143 1691981480 4798917
            1605644336 1179335667 453700728
            420531060 2792351548 19811393
            3631948975 1696780397 2316634
            2938824180 2514558898 185053026
            215265512 376201353 122962654
            2256368280 2124659642 174743244
            3940072369 3208540803 156898292
            861681698 615421197 14073366
            """
        )
    }
    
    static var inputData2: Self {
        .init(data:
            """
            2243197897 1858683458 54522139
            694397455 637497541 323467072
            3781060233 3489670799 513907063
            2297720036 960964613 400594644
            3448397921 3305645149 184025650
            1096611912 137478840 356155107
            2159128717 1774614278 84069180
            1769470938 1913205597 389657779
            1017864527 2302863376 78747385
            3632423571 4003577862 148636662
            281342434 1361559257 413055021
            3393398302 4239967677 54999619
            137478840 493633947 143863594
            3305645149 4152214524 87753153
            1452767019 2381610761 316703919
            """
        )
    }
    
    static var empty: Self {
        .init(data: "")
    }
    
    static var identity: Self {
        .init(data: "0 0 \(Int.max)")
    }
}

struct TemperatureToHumidityMap: TestDataRepresentable {
    let data: String
    
    static var sampleData: Self {
        .init(data:
            """
            0 69 1
            1 0 69
            """
        )
    }
    
    static var inputData: Self {
        .init(data:
            """
            841576398 2731200418 60836938
            1860695540 395011682 292982985
            1518037021 3432774193 53954373
            1786573987 2461900019 55353430
            2940303448 1995108352 6974538
            3014069287 1664464874 53916789
            753139746 2190061656 88436652
            2351822957 2925825589 209990361
            3079884326 3498626816 37609115
            4067060121 4186346579 108620717
            4175680838 4102322798 3778367
            1571991394 2415899186 46000833
            2841627583 1157034722 22534242
            1841927417 2517253449 18768123
            2153678525 47765849 108568164
            3251281674 1179568964 226737882
            3067986076 3486728566 11898250
            1308101633 1785172964 209935388
            2262246689 1406306846 89576268
            902413336 2278498308 137400878
            1039814214 3765380846 268287419
            45422022 156334013 238677669
            3617672799 2612163195 119037223
            2947277986 1718381663 66791301
            1617992227 1495883114 168581760
            284099691 687994667 469040055
            4214721882 4106101165 80245414
            2839283756 45422022 2343827
            3117493441 2792037356 133788233
            2864161825 2536021572 76141623
            4179459205 4067060121 35262677
            3736710022 3135815950 296958243
            3478019556 2002082890 139653243
            2610138841 3536235931 229144915
            2561813318 2141736133 48325523
            """
        )
    }
    
    static var inputData2: Self {
        .init(data:
            """
            36297311 0 6725362
            2219701249 4240213747 25288799
            3578106372 1498215295 38253390
            1356053404 1610598521 173674950
            446166190 530183876 120299205
            813026177 2579337380 225593633
            133147960 367690092 61449909
            223651565 500781338 29402538
            253054103 174578005 193112087
            194597869 6725362 29053696
            566465395 85143164 1372917
            799049686 3045085309 13976491
            1529728354 3595799720 487441441
            2420467399 2406340018 172679747
            2593147146 1784273471 622066547
            2244990048 3198005099 143889028
            3437740738 4233433470 6780277
            43022673 650483081 18483950
            2407809136 1485557032 12658263
            3215213693 1060498533 222527045
            580905107 86516081 88061924
            2017169795 1283025578 202531454
            3710504883 2579019765 317615
            61506623 429140001 71641337
            3716287969 769584936 114202886
            1328506806 3066097836 27546598
            3703468847 3059061800 7036036
            769584936 4265502546 29464750
            1292525403 883787822 35981403
            3710822498 919769225 5465471
            3830490855 4083241161 150192309
            3616359762 925234696 87109085
            2388879076 3093644434 18930060
            3529951620 1012343781 48154752
            4220837460 1536468685 74129836
            3444521015 3112574494 85430605
            567838312 35779058 13066795
            1038619810 3341894127 253905593
            3980683164 2804931013 240154296
            0 48845853 36297311
            """
        )
    }
    
    static var empty: Self {
        .init(data: "")
    }
    
    static var identity: Self {
        .init(data: "0 0 \(Int.max)")
    }
}

struct HumidityToLocationMap: TestDataRepresentable {
    let data: String
    
    static var sampleData: Self {
        .init(data:
            """
            60 56 37
            56 93 4
            """
        )
    }
    
    static var inputData: Self {
        .init(data:
            """
            608325534 0 231346900
            222429954 453776854 385895580
            3710263359 3540956206 563631409
            1193511298 1116937854 38719102
            1702450793 1176729484 153572024
            1694669826 1109156887 7780967
            0 231346900 222429954
            1856022817 1686715664 1854240542
            1588644556 4104587615 106025270
            1109156887 4210612885 84354411
            4273894768 1155656956 21072528
            1232230400 1330301508 356414156
            """
        )
    }
    
    static var inputData2: Self {
        .init(data:
            """
            2609743610 4133079426 108193613
            1608826026 1793129808 148682069
            3749483646 1957417643 61460641
            3216466252 4241273039 49689894
            2717937223 1941811877 15605766
            3810944287 1225630249 233181949
            2124315534 3020458025 302014415
            264620169 272336891 68907407
            861861645 2458132363 209077985
            4044126236 1458812198 250841060
            3134115707 2375781818 82350545
            1070939630 4290962933 4004363
            2733542989 4089410242 43669184
            1074943993 3479498485 533882033
            2777212173 2018878284 356903534
            2426329949 4013380518 76029724
            333527576 0 7716722
            3266156146 3346379827 130079823
            2526267060 1709653258 83476550
            1757508095 3476459650 3038835
            0 7716722 264620169
            1760546930 861861645 363768604
            3396235969 2667210348 353247677
            2502359673 3322472440 23907387
            """
        )
    }
    
    static var empty: Self {
        .init(data: "")
    }
    
    static var identity: Self {
        .init(data: "0 0 \(Int.max)")
    }
}



//struct MapsTestData: TestDataRepresentation {

//    init(data: String) {
//        self.data = data
//    }
////
//    static var sampleSoilMap: Self {
//        .init(data:
//            """
//            seed-to-soil map:
//            50 98 2
//            52 50 48
//
//            soil-to-fertilizer map:
//
//            fertilizer-to-water map:
//
//            water-to-light map:
//
//            light-to-temperature map:
//
//            temperature-to-humidity map:
//
//            humidity-to-location map:
//            """
//        )
//    }
//
//
    
//
//    static var identityMap: Self {
//        .init(data:
//            """
//            seed-to-soil map:
//            0 0 \(Int.max)
//
//            soil-to-fertilizer map:
//            0 0 \(Int.max)
//
//            fertilizer-to-water map:
//            0 0 \(Int.max)
//
//            water-to-light map:
//            0 0 \(Int.max)
//
//            light-to-temperature map:
//            0 0 \(Int.max)
//
//            temperature-to-humidity map:
//            0 0 \(Int.max)
//
//            humidity-to-location map:
//            0 0 \(Int.max)
//            """
//        )
//    }
//}

