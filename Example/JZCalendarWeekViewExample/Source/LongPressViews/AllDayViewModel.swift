//
//  AllDayViewModel.swift
//  JZCalendarWeekViewExample
//
//  Created by Jeff Zhang on 30/5/18.
//  Copyright © 2018 Jeff Zhang. All rights reserved.
//

import Foundation
import JZCalendarWeekView

class AllDayViewModel: NSObject {
    
    private let firstDate = Date().add(component: .hour, value: 1)
    private let secondDate = Date().add(component: .day, value: 1)
    private let thirdDate = Date().add(component: .day, value: 2)
    
    var eventsBefore = try! JSONDecoder().decode([SXSWData].self, from: jsonData.data(using: .utf8)!)
    
    lazy var events = [AllDayEvent(id: "0", title: "One", startDate: firstDate, endDate: firstDate.add(component: .hour, value: 1), location: "Melbourne", isAllDay: false),
                       AllDayEvent(id: "1", title: "Two", startDate: secondDate, endDate: secondDate.add(component: .hour, value: 4), location: "Sydney", isAllDay: false),
                       AllDayEvent(id: "2", title: "Three", startDate: thirdDate, endDate: thirdDate.add(component: .hour, value: 2), location: "Tasmania", isAllDay: false),
                       AllDayEvent(id: "3", title: "Four", startDate: thirdDate, endDate: thirdDate.add(component: .hour, value: 26), location: "Canberra", isAllDay: false),
                       AllDayEvent(id: "4", title: "AllDay1", startDate: firstDate.startOfDay, endDate: firstDate.startOfDay, location: "Gold Coast", isAllDay: true),
                       AllDayEvent(id: "5", title: "AllDay2", startDate: firstDate.startOfDay, endDate: firstDate.startOfDay, location: "Adelaide", isAllDay: true),
                       AllDayEvent(id: "6", title: "AllDay3", startDate: firstDate.startOfDay, endDate: firstDate.startOfDay, location: "Cairns", isAllDay: true),
                       AllDayEvent(id: "7", title: "AllDay4", startDate: thirdDate.startOfDay, endDate: thirdDate.startOfDay, location: "Brisbane", isAllDay: true)]
    
//    lazy var events = eventsBefore.map { $0.toAllDayEvent() }
    lazy var eventsByDate = JZWeekViewHelper.getIntraEventsByDate(originalEvents: events)
    
    var currentSelectedData: OptionsSelectedData!
}


struct SXSWData: Codable {
    var title: String!
    var startDate: TimeInterval!
    var endDate: TimeInterval!
    var location: String!
    
    func toAllDayEvent() -> AllDayEvent {
        let startDate = Date(timeIntervalSince1970: self.startDate)
        let endDate = Date(timeIntervalSince1970: self.endDate)
        let calendar = Calendar.current
        
        let date1 = calendar.startOfDay(for: startDate)
        let date2 = calendar.startOfDay(for: endDate)
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        
        return AllDayEvent(id: UUID().uuidString, title: self.title, startDate: startDate, endDate: endDate, location: self.location, isAllDay: components.day! > 1)
    }
}

let jsonData =
"""
[
{
"title" : "Daylight Saving Time",
"startDate" : 1552172400.0,
"endDate" : 1552258799.0,
"location" : ""
},
{
"title" : "St. Patrick’s Day",
"startDate" : 1552777200.0,
"endDate" : 1552863599.0,
"location" : ""
},
{
"title" : "Valentine’s Day",
"startDate" : 1550098800.0,
"endDate" : 1550185199.0,
"location" : ""
},
{
"title" : "President's Day",
"startDate" : 1550444400.0,
"endDate" : 1550530799.0,
"location" : ""
},
{
"title" : "Test",
"startDate" : 1550062800.0,
"endDate" : 1550066400.0,
"location" : ""
},
{
"title" : "Fast Company Grill Day 1",
"startDate" : 1552071600.0,
"endDate" : 1552091400.0,
"location" : "Cedar Door Patio and Grill"
},
{
"title" : "The Bad Crypto Meetup",
"startDate" : 1552172400.0,
"endDate" : 1552179600.0,
"location" : ""
},
{
"title" : "The Deep End by Fox Media Day 3",
"startDate" : 1552237200.0,
"endDate" : 1552258800.0,
"location" : "The Belmont"
},
{
"title" : "Refresh At SXSW",
"startDate" : 1552402800.0,
"endDate" : 1552428000.0,
"location" : "Google Fiber Space"
},
{
"title" : "Interactive Closing Party (TBA)",
"startDate" : 1552366800.0,
"endDate" : 1552453199.0,
"location" : ""
},
{
"title" : "Fort Worth on Rainey",
"startDate" : 1552060800.0,
"endDate" : 1552109400.0,
"location" : "Bungalow"
},
{
"title" : "Accenture Fjord Studio Immersions Day 3",
"startDate" : 1552197600.0,
"endDate" : 1552280399.0,
"location" : ""
},
{
"title" : "Austin CEO Diaries",
"startDate" : 1552080600.0,
"endDate" : 1552084200.0,
"location" : "Hilton Austin Downtown - Salon C"
},
{
"title" : "Accenture Experience Cantina Day 2",
"startDate" : 1552111200.0,
"endDate" : 1552197599.0,
"location" : "Micheladas Cafe y Cantina"
},
{
"title" : "Berlin Interactive Night",
"startDate" : 1552269600.0,
"endDate" : 1552284000.0,
"location" : "Buffalo Billiards"
},
{
"title" : "Patreon House",
"startDate" : 1552496400.0,
"endDate" : 1552518000.0,
"location" : "Augustine"
},
{
"title" : "SXSW Hackathon Presentations",
"startDate" : 1552415400.0,
"endDate" : 1552424400.0,
"location" : "Omni - Capital Ballroom A"
},
{
"title" : "Midcoast Takeover Day 2",
"startDate" : 1552582800.0,
"endDate" : 1552611600.0,
"location" : "Shangri-La"
},
{
"title" : "Food + City Startup Showcase",
"startDate" : 1552336200.0,
"endDate" : 1552347000.0,
"location" : "Gather Venues"
},
{
"title" : "The Bumble Hive",
"startDate" : 1552305600.0,
"endDate" : 1552345200.0,
"location" : "Jo's"
},
{
"title" : "The Bumble Hive",
"startDate" : 1552651200.0,
"endDate" : 1552690800.0,
"location" : "Jo's"
},
{
"title" : "Fast Company Grill Day 4",
"startDate" : 1552327200.0,
"endDate" : 1552347000.0,
"location" : "Cedar Door Patio and Grill"
},
{
"title" : "Energizing Health House Day 1",
"startDate" : 1552060800.0,
"endDate" : 1552104000.0,
"location" : "Cooper's Old Time Bar-B-Que"
},
{
"title" : "Random Coffee Day 2",
"startDate" : 1552237200.0,
"endDate" : 1552266000.0,
"location" : "Brush Square Park"
},
{
"title" : "BBQ Austin",
"startDate" : 1552082400.0,
"endDate" : 1552109400.0,
"location" : "Rodeo Austin - Outside city center"
},
{
"title" : "Lafayette Live Crawfish Boil",
"startDate" : 1552516200.0,
"endDate" : 1552528800.0,
"location" : "C-Boy's Heart & Soul"
},
{
"title" : "Accenture Fjord Studio Immersions Day 4",
"startDate" : 1552280400.0,
"endDate" : 1552366799.0,
"location" : ""
},
{
"title" : "Peligrosa House Day 3",
"startDate" : 1552698000.0,
"endDate" : 1552719600.0,
"location" : "The North Door"
},
{
"title" : "Random Coffee Day 1",
"startDate" : 1552150800.0,
"endDate" : 1552179600.0,
"location" : "Brush Square Park"
},
{
"title" : "Blockchain House",
"startDate" : 1552233600.0,
"endDate" : 1552273200.0,
"location" : "606 E. 3rd Street"
},
{
"title" : "Accenture Fjord Studio Immersions Day 1",
"startDate" : 1552024800.0,
"endDate" : 1552111199.0,
"location" : ""
},
{
"title" : "PitchTexas Party",
"startDate" : 1552091400.0,
"endDate" : 1552098600.0,
"location" : "HandleBar"
},
{
"title" : "Accenture Experience Cantina Day 1",
"startDate" : 1552024800.0,
"endDate" : 1552111199.0,
"location" : "Micheladas Cafe y Cantina"
},
{
"title" : "International Welcome Breakfast",
"startDate" : 1552055400.0,
"endDate" : 1552064400.0,
"location" : "Omni - Capital Ballroom"
},
{
"title" : "WWE Lounge",
"startDate" : 1552064400.0,
"endDate" : 1552089600.0,
"location" : "JW Marriot - 4th Floor"
},
{
"title" : "Rising Fundamentalisms And Women's Rights",
"startDate" : 1552064400.0,
"endDate" : 1552068000.0,
"location" : "The Line - ONYX - Ballroom 1 (Floor 2)"
},
{
"title" : "Entrepreneurs Lounge #MeatUp",
"startDate" : 1552172400.0,
"endDate" : 1552186800.0,
"location" : "Fogo de Chão"
},
{
"title" : "Accenture Main Stage Sessions Day 2",
"startDate" : 1552111200.0,
"endDate" : 1552197599.0,
"location" : ""
},
{
"title" : "Startup Saturday with SendGrid & GAN",
"startDate" : 1552150800.0,
"endDate" : 1552172400.0,
"location" : "Key Bar"
},
{
"title" : "Urbantech Innovators BBQ",
"startDate" : 1552345200.0,
"endDate" : 1552356000.0,
"location" : "Stubb's Bar-B-Q"
},
{
"title" : "The Bumble Hive",
"startDate" : 1552050000.0,
"endDate" : 1552089600.0,
"location" : "Jo's"
},
{
"title" : "PluggedIn at SXSW",
"startDate" : 1552237200.0,
"endDate" : 1552258800.0,
"location" : "Fjord Austin"
},
{
"title" : "AI Community Mixer and Showcase",
"startDate" : 1552176000.0,
"endDate" : 1552186800.0,
"location" : "Capital Factory"
},
{
"title" : "Energizing Health House Day 4",
"startDate" : 1552316400.0,
"endDate" : 1552359600.0,
"location" : "Cooper's Old Time Bar-B-Que"
},
{
"title" : "The Bumble Hive",
"startDate" : 1552392000.0,
"endDate" : 1552431600.0,
"location" : "Jo's"
},
{
"title" : "Peligrosa House Day 2",
"startDate" : 1552611600.0,
"endDate" : 1552633200.0,
"location" : "The North Door"
},
{
"title" : "Midcoast Takeover Day 4",
"startDate" : 1552755600.0,
"endDate" : 1552784400.0,
"location" : "Shangri-La"
},
{
"title" : "ATX Crawfish Festival",
"startDate" : 1552064400.0,
"endDate" : 1552104000.0,
"location" : "Barton Creek Square"
},
{
"title" : "Pitch & Flow: Showtime",
"startDate" : 1552514400.0,
"endDate" : 1552528800.0,
"location" : "The Line - ONYX"
},
{
"title" : "The Bumble Hive",
"startDate" : 1552222800.0,
"endDate" : 1552262400.0,
"location" : "Jo's"
},
{
"title" : "How Data Helps to Unleash Creativity in Media",
"startDate" : 1552314600.0,
"endDate" : 1552318200.0,
"location" : "JW Marriot - Salon E (Floor 3)"
},
{
"title" : "FINAL Altercation Punk Rock BBQ!",
"startDate" : 1552755600.0,
"endDate" : 1552784400.0,
"location" : "Kick Butt Café"
},
{
"title" : "Innovation Policy Day",
"startDate" : 1552143600.0,
"endDate" : 1552170600.0,
"location" : "La Condesa"
},
{
"title" : "Blockchain House",
"startDate" : 1552316400.0,
"endDate" : 1552345200.0,
"location" : "606 E. 3rd Street"
},
{
"title" : "Inc. Founders House",
"startDate" : 1552064400.0,
"endDate" : 1552096800.0,
"location" : "La Volpe"
},
{
"title" : "Accenture Main Stage Sessions Day 1",
"startDate" : 1552024800.0,
"endDate" : 1552111199.0,
"location" : ""
},
{
"title" : "The Deep End by Fox Media Day 2",
"startDate" : 1552150800.0,
"endDate" : 1552172400.0,
"location" : "The Belmont"
},
{
"title" : "Night Crawler After Party 💵",
"startDate" : 1552096800.0,
"endDate" : 1552118400.0,
"location" : "The Venue ATX"
},
{
"title" : "Accenture Main Stage Sessions Day 5",
"startDate" : 1552366800.0,
"endDate" : 1552453199.0,
"location" : ""
},
{
"title" : "The Bumble Hive",
"startDate" : 1552564800.0,
"endDate" : 1552604400.0,
"location" : "Jo's"
},
{
"title" : "BYOBitcoin Presents SXSW Just HODL It 2019",
"startDate" : 1552348800.0,
"endDate" : 1552374000.0,
"location" : "RIO"
},
{
"title" : "openShabbat",
"startDate" : 1552095000.0,
"endDate" : 1552096800.0,
"location" : "Hilton Austin Downtown"
},
{
"title" : "NAKID House",
"startDate" : 1552280400.0,
"endDate" : 1552366799.0,
"location" : ""
},
{
"title" : "Berlin Saloon",
"startDate" : 1552068000.0,
"endDate" : 1552109400.0,
"location" : "Buffalo Billiards"
},
{
"title" : "#BigGayKickoff Party",
"startDate" : 1552089600.0,
"endDate" : 1552104000.0,
"location" : "Oilcan Harry's"
},
{
"title" : "Inclusive Innovation House Day 1",
"startDate" : 1552064400.0,
"endDate" : 1552086000.0,
"location" : "OLA"
},
{
"title" : "Blockchain House",
"startDate" : 1552503600.0,
"endDate" : 1552528800.0,
"location" : "606 E. 3rd Street"
},
{
"title" : "Create & Cultivate Pop Up",
"startDate" : 1552197600.0,
"endDate" : 1552280399.0,
"location" : "The Allan House"
},
{
"title" : "SoDA Happy Hour",
"startDate" : 1552341600.0,
"endDate" : 1552352400.0,
"location" : "The Dogwood"
},
{
"title" : "Peligrosa House Day 4",
"startDate" : 1552784400.0,
"endDate" : 1552806000.0,
"location" : "The North Door"
},
{
"title" : "Comcast NBCUniversal LIFT Labs & Techstars",
"startDate" : 1552089600.0,
"endDate" : 1552095000.0,
"location" : "Moonshine Grill"
},
{
"title" : "Berlin Saloon Opening Party",
"startDate" : 1552010400.0,
"endDate" : 1552035600.0,
"location" : "Buffalo Billiards"
},
{
"title" : "The Bumble Hive",
"startDate" : 1552737600.0,
"endDate" : 1552777200.0,
"location" : "Jo's"
},
{
"title" : "TEXAS A&M AT SXSW POWERED BY GAME FUEL",
"startDate" : 1552197600.0,
"endDate" : 1552280399.0,
"location" : ""
},
{
"title" : "Lee Abbamonte: Travel Meet-up",
"startDate" : 1552087800.0,
"endDate" : 1552091400.0,
"location" : "Bungalow"
},
{
"title" : "Fast Company Grill Day 3",
"startDate" : 1552244400.0,
"endDate" : 1552264200.0,
"location" : "Cedar Door Patio and Grill"
},
{
"title" : "Rally House",
"startDate" : 1552320000.0,
"endDate" : 1552345200.0,
"location" : "Waller Creek Boathouse"
},
{
"title" : "Rodeo Austin Cowboy Breakfast",
"startDate" : 1552046400.0,
"endDate" : 1552053600.0,
"location" : "Long Center"
},
{
"title" : "Belgian Cafe",
"startDate" : 1552266000.0,
"endDate" : 1552280400.0,
"location" : "Uncle Billy's Brewery & Smokehouse"
},
{
"title" : "Inclusive Innovation House Day 2",
"startDate" : 1552150800.0,
"endDate" : 1552172400.0,
"location" : "OLA"
},
{
"title" : "Women in Digital Rally",
"startDate" : 1552339800.0,
"endDate" : 1552350600.0,
"location" : "Google Fiber Space"
},
{
"title" : "Accenture Fjord Studio Immersions Day 2",
"startDate" : 1552111200.0,
"endDate" : 1552197599.0,
"location" : ""
},
{
"title" : "ChooseATL",
"startDate" : 1552197600.0,
"endDate" : 1552280399.0,
"location" : "RIO"
},
{
"title" : "WeDC House",
"startDate" : 1552280400.0,
"endDate" : 1552366799.0,
"location" : "Banger's"
},
{
"title" : "Inc. Founders House",
"startDate" : 1552320000.0,
"endDate" : 1552352400.0,
"location" : "La Volpe"
},
{
"title" : "Blockchain House",
"startDate" : 1552572900.0,
"endDate" : 1552591800.0,
"location" : "606 E. 3rd Street"
},
{
"title" : "Energizing Health House Day 3",
"startDate" : 1552233600.0,
"endDate" : 1552276800.0,
"location" : "Cooper's Old Time Bar-B-Que"
},
{
"title" : "Peligrosa House Day 1",
"startDate" : 1552525200.0,
"endDate" : 1552546800.0,
"location" : "The North Door"
},
{
"title" : "Accenture Experience Cantina Day 4",
"startDate" : 1552280400.0,
"endDate" : 1552366799.0,
"location" : "Micheladas Cafe y Cantina"
},
{
"title" : "Midcoast Takeover Day 1",
"startDate" : 1552496400.0,
"endDate" : 1552525200.0,
"location" : "Shangri-La"
},
{
"title" : "Fort Worth on Rainy",
"startDate" : 1552147200.0,
"endDate" : 1552176000.0,
"location" : "Bungalow"
},
{
"title" : "SXSW Chill & Chat",
"startDate" : 1552237200.0,
"endDate" : 1552269600.0,
"location" : "Key Bar"
},
{
"title" : "Exclusive Expert Happy Hour",
"startDate" : 1552255200.0,
"endDate" : 1552262400.0,
"location" : "Upstairs at Caroline"
},
{
"title" : "Midcoast Takeover Day 3",
"startDate" : 1552669200.0,
"endDate" : 1552698000.0,
"location" : "Shangri-La"
},
{
"title" : "SXSW Startup Crawl",
"startDate" : 1552082400.0,
"endDate" : 1552096800.0,
"location" : "Capital Factory"
},
{
"title" : "Smart Home VIP Cocktail Party",
"startDate" : 1552086000.0,
"endDate" : 1552096800.0,
"location" : "Yonomi Austin HQ"
},
{
"title" : "SXSW Super Connector Meetup",
"startDate" : 1552086000.0,
"endDate" : 1552089600.0,
"location" : "Fairmont Hotel - Verbena Room"
},
{
"title" : "Accenture Main Stage Sessions Day 4",
"startDate" : 1552280400.0,
"endDate" : 1552366799.0,
"location" : ""
},
{
"title" : "Startup of the Year Pitch & BBQ",
"startDate" : 1552239000.0,
"endDate" : 1552240800.0,
"location" : "Maggie Mae's"
},
{
"title" : "Women Who Travel Live Podcast and Meetup",
"startDate" : 1552320000.0,
"endDate" : 1552327200.0,
"location" : "Holy Roller"
},
{
"title" : "Entrepreneurs Lounge #MeatUp",
"startDate" : 1552341600.0,
"endDate" : 1552356000.0,
"location" : "Fogo de Chão"
},
{
"title" : "Inc. Founders House",
"startDate" : 1552237200.0,
"endDate" : 1552269600.0,
"location" : "La Volpe"
},
{
"title" : "Energizing Health House Day 2",
"startDate" : 1552147200.0,
"endDate" : 1552190400.0,
"location" : "Cooper's Old Time Bar-B-Que"
},
{
"title" : "Social Siesta Happy Hour",
"startDate" : 1552158000.0,
"endDate" : 1552167000.0,
"location" : "Max's Wine Dive"
},
{
"title" : "SXSW Pitch: Enterprise and Smart Data Technolog",
"startDate" : 1552156200.0,
"endDate" : 1552159800.0,
"location" : "Hilton Austin Downtown - Salon DE (Floor 4)"
},
{
"title" : "2 from apple",
"startDate" : 1549888200.0,
"endDate" : 1549890000.0,
"location" : ""
}
]
"""
