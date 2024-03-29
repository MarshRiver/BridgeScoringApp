//
//  ContractRow.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/16/22.
//

import SwiftUI


//struct IntField: View {
//    @Binding var int: Int
//    @State private var intString: String  = ""
//    var body: some View {
//        return TextField("", text: $intString)
//        .onReceive(Just(intString)) { value in
//            if let i = Int(value) { int = i }
//            else { intString = "\(int)" }
//        }
//        .onAppear(perform: {
//            intString = "\(int)"
//        })
//    }
//}

struct ContractRow: View {
    var rowNo:Int
    var boardNo:Int
    @EnvironmentObject var match: Match
    @EnvironmentObject var matchPoint:MatchPointRow
    
    var body: some View {
        VStack {
            if (boardNo < match.Boards.count) && (rowNo < match.Boards[boardNo].contracts.count) {
                HStack{
                    TextField("NSMP",value: $match.Boards[boardNo].contracts[rowNo].nsMP,format:.number)
                        .font(.title2)
                        .frame(width:80)
                    TextField("NSPair",text: $match.Boards[boardNo].contracts[rowNo].nsPair)
                        .font(.title2)
                        .frame(width:80)
                    TextField("Bid",text: $match.Boards[boardNo].contracts[rowNo].bid)
                        .font(.title2)
                        .frame(width:80)
                    TextField("Made",text: $match.Boards[boardNo].contracts[rowNo].made)
                        .font(.title2)
                        .frame(width:80)
                    TextField("Down",text: $match.Boards[boardNo].contracts[rowNo].down)
                        .font(.title2)
                        .frame(width:80)
                    TextField("NSScore",text: $match.Boards[boardNo].contracts[rowNo].nsScore)
                        .font(.title2)
                        .frame(width:80)
                        .autocorrectionDisabled(true)
                        .disableAutocorrection(true)
                        .onSubmit{
                            match.Boards[boardNo].contracts[rowNo].setEWScore(score: match.Boards[boardNo].contracts[rowNo].nsScore)
                            matchPoint.fillMatchTable(match: match, boardNo: boardNo)
                        }
                    TextField("EWScore",text: $match.Boards[boardNo].contracts[rowNo].ewScore)
                        
                        .font(.title2)
                        .frame(width:80)
                        .autocorrectionDisabled(true)
                        .disableAutocorrection(true)
                        .onSubmit{
                            match.Boards[boardNo].contracts[rowNo].setNSScore(score: match.Boards[boardNo].contracts[rowNo].ewScore)
                            matchPoint.fillMatchTable(match: match, boardNo: boardNo)
                        }
                    TextField("EWPair",text: $match.Boards[boardNo].contracts[rowNo].ewPair)
                        .frame(width:80)
                        .font(.title2)
                    TextField("EWMP",value:
                        $match.Boards[boardNo].contracts[rowNo].ewMP,format:.number)
                        .frame(width:80)
                        .font(.title2)
                }
            }
            
        }
        .padding(.bottom, 2.0)
    }
        

}

struct ContractRow_Previews: PreviewProvider {
    static var previews: some View {
        ContractRow(rowNo: 0,boardNo: 0)
            .environmentObject(Event())
            .environmentObject(Match(event:Event()))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
