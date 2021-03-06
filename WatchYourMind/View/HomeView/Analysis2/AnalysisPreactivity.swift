//
//  AnalysisPreactivity.swift
//  WatchYourMind
//
//  Created by Gatang on 21/3/2564 BE.
//

import SwiftUI

struct AnalysisPreactivity: View {
    public var stylepresent: ChartStyle2
    public var dropShadowpresent: Bool
    
//    var contentdate: LocalizedStringKey

    
    public init(style: ChartStyle2 = Styles.pieChartStyleOne, dropShadow: Bool? = true){
        self.stylepresent = style
        self.dropShadowpresent = dropShadow!
//        self.startdate =
    }
    var body: some View {

            VStack{
//                 let startdate: Date

            Text("Previous activities:")
                .font(.system(size:40))
                .foregroundColor(.black)
                
                ZStack {
                    Rectangle()
                        .fill(self.stylepresent.backgroundColor)
                        .cornerRadius(10)
                        .shadow(color: self.stylepresent.dropShadowColor, radius: self.dropShadowpresent ? 12 : 0)
                        .frame(width: 380, height:220)
                    TextEdit()
                        .cornerRadius(10)
                        .frame(width: 380, height:220)

                }
                
                
            }
            
//        }//:ZSTACK
    
        }
}

struct AnalysisPreactivity_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisPreactivity()
    }
}
