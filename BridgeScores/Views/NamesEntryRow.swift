//
//  NamesEntryRow.swift
//  BridgeScores
//
//  Created by Chris Percival on 12/4/22.
//

import SwiftUI

struct NamesEntryRow: View {
    var pairNo = 0
    @EnvironmentObject var entryNames:EntryNames
    
    var body: some View {
            
        TextField("Name", text: $entryNames.players[pairNo]).onSubmit {
                print(entryNames.players)
            }
        
            
     }
}

//struct NamesEntryRow_Previews: PreviewProvider {
//    static var previews: some View {
//        NamesEntryRow(pairNo: 1)
//            .environmentObject(EntryNames)
//    }
//}
