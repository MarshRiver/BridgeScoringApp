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
    @EnvironmentObject var matchPoints: MatchPointRow
    @EnvironmentObject var matchPlayers: MatchPlayers
    
    var body: some View {
      
        VStack{
            Text("Match Results").font(.title)
            
            HStack{
                Text("pairNo")
                Spacer()
                Text("Players")
                Spacer()
                Text("Score")
                Spacer()
                Text("Percentage")

            }.frame(width:800,alignment: .topLeading)

            ForEach(0..<event.noPairs,id: \.self){ i in
                HStack{
                    TextField("pairNo", value: $results.results[i].pairNo,formatter: NumberFormatter())
                    TextField("Players", text: $results.results[i].PlayerNames)
                    TextField("Score", value: $results.results[i].masterPoints, formatter: matchPoints.mpFormatter)
                    TextField("0.0", value: $results.results[i].percent,formatter:NumberFormatter())
                }.frame(width:800,alignment: .center)
            }
            
        }
        .onAppear(){
            results.fillPlayerNames(matchResults: results, matchPlayers: matchPlayers)
            match.toteMasterPoints(matchResults: results)
        }

            
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
            .environmentObject(Event())
            .environmentObject(Match())
            .environmentObject(MatchPlayers())
            .environmentObject(Results())
    }
}
