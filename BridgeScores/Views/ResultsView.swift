//
//  ResultsView.swift
//  BridgeScores
//
//  Created by Chris Percival on 11/12/22.
//

import SwiftUI

struct ResultsView: View {
    
    @EnvironmentObject var results: Results
    @EnvironmentObject var event: Event
    @EnvironmentObject var match: Match
    @EnvironmentObject var matchPlayers: MatchPlayers
    @EnvironmentObject var entryNames:EntryNames

    var body: some View {
      
        VStack{
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.cyan)
                    .opacity(0.4)
                    .frame(width: 800,height: 40)
                    .shadow(radius: 15.0,x:-5,y:10)
                HStack{
                    Spacer()
                    Text(event.eventName).font(.title)
                    Spacer()//Text("  ")
                    Text(event.stringDate())
                    Spacer()
                }
            }
            HStack{
                Text("Pair Number")
                Spacer()
                Text("Players")
                Spacer()
                Text("Rank")
                Spacer()
                Text("Score")
                Spacer()
                Text("Percentage")

            }.frame(width:800,alignment: .topLeading)

            
            ForEach(0..<(event.noPairs ?? 6),id: \.self){ i in
                HStack{
                    TextField("Pair Number", value: $results.results[i].pairNo,formatter: NumberFormatter())
                        .frame(width:80)
                    Spacer()
                    TextField("Players", text: $results.results[i].PlayerNames).frame(width:200)
                    Spacer()
                    Text(String(i+1)).frame(width:80)
                    Spacer()
                    TextField("Score", value: $results.results[i].masterPoints, format:.number).frame(width: 80)
                    Spacer()
                    TextField("0.0", value: $results.results[i].percent,formatter:NumberFormatter()).frame(width:80)
                 }.frame(width:800,alignment: .center)
            }
            
        }
        .onAppear(){
//            results.fillPlayerNames(matchResults: results, matchPlayers: matchPlayers)
            results.fillPlayerNames(matchResults: results, entryNames: entryNames)

            results.toteMasterPoints(match: match)
            results.results.sort()
        }
        .frame(width:800)
        .padding()
        .border(.cyan, width: /*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)

            
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
            .environmentObject(Event())
            .environmentObject(Match(event:Event()))
            .environmentObject(MatchPlayers(event:Event()))
            .environmentObject(Results(event: Event()))
            .environmentObject(MatchPointRow())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
