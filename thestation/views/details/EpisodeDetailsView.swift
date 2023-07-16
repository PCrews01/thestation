//
//  EpisodeDetailsView.swift
//  thestation
//
//  Created by Paul Crews on 7/7/23.
//

import SwiftUI

struct EpisodeDetailsView: View {
    @State var episode:Episode
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image(episode.thumb)
                    .resizable()
                    .ignoresSafeArea(.all)
                    .scaledToFill()
                VStack{
                    Spacer()
                    VStack(alignment:.leading){
                        Image(episode.thumb)
                            .resizable()
                            .scaledToFit()
                        Text(episode.title)
                            .font(.title)
                            .fontWeight(.black)
                        Text(episode.show.title)
                            .font(.title3)
                        Text("S:\(episode.season) || E: \(episode.number)")
                        Text(episode.air_date)
                        Divider()
                        ScrollView{
                            Text(episode.description)
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                }
                .frame(width: (geo.size.width - 50.0))
            }.frame(width: geo.size.width)
        }
    }
}

#Preview {
    EpisodeDetailsView(episode: dummy_episode_2)
}
