//
//  HomeView.swift
//  thestation
//
//  Created by Paul Crews on 7/7/23.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Query public var a_user:[User]
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
            VStack{
                ZStack{
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                        .fill()
                    Image("empty_stage")
                        .resizable()
                        .overlay(.foreground.opacity(0.3))
                    VStack(alignment: .leading){
                        Text("Now Playing")
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.white)
                            .padding(.top, 5)
                            .padding(.leading, 25)
                            .shadow(color: .black, radius: 5)
                        Spacer()
                        VStack(alignment: .leading, content: {
                            Text("My Shit")
                                .fontWeight(.bold)
                            Text("Hosted by: The Host")
                                .font(.caption)
                        })
                        .padding(.leading, 10)
                        .frame(width: 350, alignment: .leading)
                        .foregroundStyle(.secondary)
                        .padding()
                        .background(.ultraThickMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 10.5))
                    }
                    .frame(width: 350, alignment: .center)
                    .background(.ultraThinMaterial.opacity(0.35))
                    
                }
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .frame(width: 350, height: 400)
                Spacer()
                VStack(alignment: .leading){
                        Text("Upcoming")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(dummy_shows, id:\.id){
                                    d_show in
                                    MediaCard(show: d_show)
                                }
                            }
                        }
                    }
                
                VStack(alignment: .leading){
                        Text("Latest Episodes")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(dummy_episodes, id:\.id){
                                    d_episode in
                                    MediaCard(episode: d_episode)
                                }
                            }
                        }
                    }
                VStack(alignment:.leading){
                        Text("News")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                            ForEach(dummy_articles, id:\.id){
                                article in
                                NavigationLink {
                                    NewsView(article: article)
                                } label: {

                                    NewsCard(article: article)
                                }

                                }
                                
                            }
                        }
                    }
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Text("The Station").fontWeight(.black).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        MyActivityView()
                    } label: {
                        Image(systemName: "person.circle")
                    }
                }
            })
        }
    }
}

#Preview {
    HomeView()
}
