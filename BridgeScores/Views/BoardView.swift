//
//  BoardView.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/17/22.
//

import SwiftUI

struct BoardView: View {
    @EnvironmentObject var match: Match
    var body: some View {
        VStack{
            ContractRow(rowNo: 0)
            ContractRow(rowNo: 1)
            ContractRow(rowNo: 2)
            ContractRow(rowNo: 3)
            ContractRow(rowNo: 4)
            ContractRow(rowNo: 5)
//            ContractRow(contract: match.Boards[0].contracts[0])
//            ContractRow(contract: match.Boards[0].contracts[1])
//            ContractRow(contract: match.Boards[0].contracts[2])
//            ContractRow(contract: match.Boards[0].contracts[3])
//            ContractRow(contract: match.Boards[0].contracts[4])
//            ContractRow(contract: match.Boards[0].contracts[5])
        }
    }

}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView().environmentObject(Match())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
