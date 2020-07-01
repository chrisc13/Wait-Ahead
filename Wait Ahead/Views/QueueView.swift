//
//  QueueView.swift
//  Wait Ahead
//
//  Created by Chris Carbajal on 6/27/20.
//  Copyright © 2020 Chris Carbajal. All rights reserved.
//

import SwiftUI

struct QueueView: View {
    
    @State var queueReponse: [QueueStruct] = [QueueStruct(id: 1, storeName: "Walmart", queueCount: 4, position: 2)]
    
    
    var body: some View {
        VStack{
            
            List (queueReponse) { q in
                CardView(queueReponse: q)
            }
            
        }

    }
}



struct QueueView_Previews: PreviewProvider {
    static var previews: some View {
        QueueView()
    }
}

struct CardView: View {
    
    var queueReponse: QueueStruct
    
    
    func leaveQueue(){
        print("leave queue")
    }
    
    var body: some View{
        VStack{
            Spacer()
            Text(queueReponse.storeName)
            .font(Font.system(size:30))
            Spacer()
            HStack{
                Spacer()
        
        Text("Position:"+String(queueReponse.position))
                  .font(Font.system(size:20))
        Text("Total:"+String(queueReponse.queueCount))
                 .font(Font.system(size:20))
                Spacer()
        }.frame(alignment: .center)
            
            Button(action: leaveQueue) {
                Text("Leave Queue").frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 40).foregroundColor(.white)
                    .background(Color.red )
                    .cornerRadius(5)
            }.cornerRadius(25)
            .clipped()
            .shadow(color: .gray, radius: 10, x: 0, y: 5)
                .padding()
                .padding(.horizontal, 50)
        }
    }
}
