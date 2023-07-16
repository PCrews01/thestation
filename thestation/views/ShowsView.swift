//
//  ShowsView.swift
//  thestation
//
//  Created by Paul Crews on 7/7/23.
//

import SwiftUI

struct ShowsView: View {
    @State var shows : [Show] = [dummy_show_3, dummy_show, dummy_show_2]
    @State var episodes: [Episode] = [dummy_episode, dummy_episode_2, dummy_episode_3, dummy_episode_4]
    @State var f_episodes : [Episode] = []
    @State var search = ""
    @State var show_search_btn = false
    @State var search_btn_width = 0
    var body: some View {
        NavigationView {
            VStack{
                ScrollView {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, content: {
                            ForEach(shows.indices, id:\.self) { index in
                                NavigationLink {
                                    ShowDetailsView(show: shows[index])
                                } label: {
                                    MediaCard(show: shows[index])
                                }
                            }
                        })
                    }
                    VStack{
                        Text("Latest Episodes")
                            .font(.largeTitle)
                            .fontWeight(.black)
                        HStack{
                            TextField("Search", text: $search)
                                .padding(10.0)
                                .clipped()
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                                .onChange(of: search) {
                                    
                                    withAnimation(.easeInOut(duration: 0.85)) {
                                        show_search_btn = search.count > 3 ? true : false
                                        f_episodes = episodes.filter({ ep in
                                            ep.title
                                                .replacingOccurrences(of: "'", with: "")
                                                .replacingOccurrences(of: " ", with: "--")
                                                .lowercased()
                                                .contains(search
                                                    .lowercased()
                                                    .replacingOccurrences(of: "'", with: "")
                                                    .replacingOccurrences(of: " ", with: "--")
                                                ) ||
                                            ep.show.title
                                                .replacingOccurrences(of: "'", with: "")
                                                .replacingOccurrences(of: " ", with: "--")
                                                .lowercased()
                                                .contains(search
                                                    .lowercased()
                                                    .replacingOccurrences(of: "'", with: "")
                                                    .replacingOccurrences(of: " ", with: "--")
                                                ) ||
                                            ep.description
                                                .replacingOccurrences(of: "'", with: "")
                                                .replacingOccurrences(of: " ", with: "--")
                                                .lowercased()
                                                .contains(search
                                                    .lowercased()
                                                    .replacingOccurrences(of: "'", with: "")
                                                    .replacingOccurrences(of: " ", with: "--")
                                                )
                                        })
                                    }
                                }
                            
                            if show_search_btn {
                                Button(action: {
                                    print("pressed")
                                }, label: {
                                    Text("Search")
                                        .font(.caption)
                                })
                            }
                        }
                        .padding(.horizontal)
                    }
                    ScrollView{
                        VStack{
                            let grouper = show_search_btn ? f_episodes : episodes
                            ForEach(grouper.indices, id:\.self) { index in
                                NavigationLink(destination: EpisodeDetailsView(episode: grouper[index])) {
                                    ListElement(episode: grouper[index])
                                        .padding(.horizontal)
                                }
                                Divider()
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ShowsView()
}
