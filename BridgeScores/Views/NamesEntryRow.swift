//
//  NamesEntryRow.swift
//  BridgeScores
//
//  Created by Chris Percival on 12/4/22.
//

import SwiftUI

struct NamesEntryRow: View {
    var id = 0
    @EnvironmentObject var entryNames:EntryNames
    @FocusState private var isFocused: Bool
//    @EnvironmentObject var focusedStates:FocusStates
    
    var body: some View {
        
        HStack{
            Spacer()
            Text(String(id + 1))
            Spacer()
            TextField("Name", text: $entryNames.players[id])
                .focused($isFocused)
                .onSubmit {
                    //print(String(.tag(self)))
//                    print(entryNames.players)
//                    print(isFocused)
//                    print(String(id))
//                    viewWithTag(id + 1).focused(true)
                }
                .onAppear(){
//                    print(entryNames.players)
//                    print(id)
//                    print(isFocused)
                    
                }
                
            .tag(id)
            Spacer()
        }
            
     }
}

struct NamesEntryRow_Previews: PreviewProvider {
    static var previews: some View {
        NamesEntryRow(id: 1)
            .environmentObject(EntryNames(event: Event()))
    }
}
