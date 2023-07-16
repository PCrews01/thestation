//
//  ListElement.swift
//  thestation
//
//  Created by Paul Crews on 7/7/23.
//

import SwiftUI

struct ListElement: View {
    @State var episode:Episode
    var body: some View {
        HStack{
            Image(episode.thumb)
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading){
                Text("\(episode.title)")
                Text("\(episode.show.title)")
            Text("E: \(episode.number) S: \(episode.season)")
                Text("\(episode.description)")
            }
            Spacer()
            Button(action: {
                print("Button")
                
            }, label: {
                Image(systemName: "play")
            }).padding()
        }
    }
}

#Preview {
    ListElement(episode: dummy_episode_2)
}
