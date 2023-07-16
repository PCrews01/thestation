//
//  NewsView.swift
//  thestation
//
//  Created by Paul Crews on 7/14/23.
//

import SwiftUI

struct NewsView: View {
    @State var article: Article
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image(article.images.first!)
                    .resizable()
                    .ignoresSafeArea(.all)
                    .scaledToFill()
                VStack{
                    Spacer()
                    VStack(alignment:.leading){
                        Text(article.headline)
                            .font(.title)
                            .fontWeight(.black)
                        Text(article.author)
                        LazyVGrid(columns: gridColumns(cols: 3), alignment: .leading) {
                            ForEach(article.tags.indices, id: \.self){ tag in
                                Text("\(article.tags[tag]) ")
                                    .font(.caption)
                            }
                        }
                        Divider()
                        ScrollView{
                            Text(article.story)
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
    NewsView(article: dummy_article)
}
