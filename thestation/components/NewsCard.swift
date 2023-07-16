//
//  NewsCard.swift
//  thestation
//
//  Created by Paul Crews on 7/7/23.
//

import SwiftUI

struct NewsCard: View {
    @State var article: Article
    var body: some View {
//        GeometryReader{ geo in
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                VStack(alignment:.leading){
                    Image(article.images[0])
                        .resizable()
                        .scaledToFill()
                    Spacer()
                    VStack(alignment:.leading){
                        Text(article.headline)
                            .font(.largeTitle)
                            .fontWeight(.black)
                        Text("By: \(article.author)")
                        
                        ScrollView{
                            VStack(alignment: .leading){
                                Text(article.story)
                            }
                        }
                    }
                    .padding()
                }
            }
            .frame(width: 400, height: 450)
            //
        }
//    }
}

#Preview {
    NewsCard(article: dummy_article_2)
}
