//
//  dummydata.swift
//  thestation
//
//  Created by Paul Crews on 7/7/23.
//

import Foundation
import SwiftUI
import SwiftData

// SHOWS
//Hip Hop Sagas
//Where are they now
//Battle Arena
//Top Ten
//Heroes, Legends and Warriors

struct Show{
    let id = UUID().uuidString
    var title: String
    var description: String
    var hosts: [String]
    var splash: String
    var day: String
    var time: String
    var air_date: String
    var tags: [String]
    var genre: [String]
    var restriction: String
    var category: String
    var rating: Float
//    var seasons: [[Episode]]
}

struct Episode{
    let id = UUID().uuidString
    var number: Int
    var title: String
    var description: String
    var air_date: String
    var restriction: String
    var rating: Float
    var show: Show
    var season: Int
    var thumb: String
}

struct Article{
    let id = UUID().uuidString
    var main_story: Bool
    var breaking: Bool
    var headline: String
    var author: String
    var tags: [String]
    var story: String
    var date: String
    var publish_date: String
    var category: String
    var views: Int
    var likes: Int
    var shares: Int
    var images: [String]
}
@Model
class User{
    let id = UUID().uuidString
    @Attribute(.unique) var username: String
    var first:String
    var last:String
    var email: String
    var password: String
    var password_confirmed: Bool
    var last_login: Date?
    var favorites : [String]
    var dislikes: [String]
    var likes: [String]
    var avatar: String
    var light_mode: Bool
    var host: Bool
    var shows: [String]?
    var comments: [String]
    var is_private: Bool
    
    init(username: String, first: String, last: String, email: String, password: String, password_confirmed: Bool, last_login: Date? = nil, favorites: [String], dislikes: [String], likes: [String], avatar: String, light_mode: Bool, host: Bool, shows: [String]? = nil, comments: [String], is_private: Bool) {
        self.username = username
        self.first = first
        self.last = last
        self.email = email
        self.password = password
        self.password_confirmed = password_confirmed
        self.last_login = last_login
        self.favorites = favorites
        self.dislikes = dislikes
        self.likes = likes
        self.avatar = avatar
        self.light_mode = light_mode
        self.host = host
        self.shows = shows
        self.comments = comments
        self.is_private = is_private
    }
}
extension User: Identifiable { }

extension User: Hashable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(username)
        hasher.combine(first)
        hasher.combine(last)
        hasher.combine(email)
        hasher.combine(password)
        hasher.combine(password_confirmed)
        hasher.combine(last_login)
        hasher.combine(avatar)
        hasher.combine(light_mode)
        hasher.combine(host)
        hasher.combine(shows)
        hasher.combine(is_private)
    }
    
}
// DUMMY ITEMS

let dummy_show = Show(title: "Show 1", description: "This is a test show item.", hosts: ["Paulie"], splash: "singer_on_stage", day: "Tuesday", time: "15:00", air_date: "January 1, 2000", tags: ["test", "dummy", "shows", "video"], genre: ["Tests"], restriction: "PG", category: "Shows", rating: 3.0)

let dummy_show_2 = Show(title: "Show 2", description: "This is another test show item.", hosts: ["Paul"], splash: "dj_with_crowd", day: "Monday", time: "12:00", air_date: "January 1, 2000", tags: ["test", "dummy", "shows", "video"], genre: ["Tests"], restriction: "PG-13", category: "Shows", rating: 4.8)

let dummy_show_3 = Show(title: "Show 3", description: "This is yet another test show item.", hosts: ["Paulz"], splash: "blurred_crowd", day: "Wednesday", time: "17:00", air_date: "January 1, 2000", tags: ["test", "dummy", "shows", "video"], genre: ["Tests"], restriction: "R", category: "Shows", rating: 2.9)

let dummy_shows = [dummy_show, dummy_show_2, dummy_show_3]
// DUMMY EPISODES

let dummy_episode = Episode(number: 1, title: "Pilot", description: "Pilot episode for show 1", air_date: "January 2, 2024", restriction: "PG", rating: 3.8, show: dummy_show, season: 1, thumb: "artist_with_fro")

let dummy_episode_2 = Episode(number: 1, title: "Pilot", description: "Pilot episode for show 2", air_date: "January 3, 2024", restriction: "PG", rating: 3.48, show: dummy_show_2, season: 1, thumb: "artist_with_fro")

let dummy_episode_3 = Episode(number: 1, title: "Pilot", description: "Pilot episode for show 3", air_date: "January 3, 2024", restriction: "PG", rating: 2.8, show: dummy_show_3, season: 1, thumb: "artist_with_fro")

let dummy_episode_4 = Episode(number: 2, title: "What's Next", description: "Second episode for show 1", air_date: "January 2, 2024", restriction: "PG", rating: 4.8, show: dummy_show, season: 1, thumb: "artist_with_fro")

let dummy_episodes = [dummy_episode, dummy_episode_2, dummy_episode_3, dummy_episode_4]

// DUMMY NEWS ARTICLES

let dummy_article = Article(main_story: true, breaking: false, headline: "Karen is upset once again...", author: "Paulie", tags: ["test", "dummy", "data", "news", "articles", "stories", "main", "headline"], story: "This is the first article. I am testing the articles to make sure everything works.", date: "July 7, 2023", publish_date: "July 10, 2023", category: "news", views: 0, likes: 0, shares: 0, images: ["lady"])

let dummy_article_2 = Article(main_story: false, breaking: false, headline: "Second Story", author: "Paulie", tags: ["test", "dummy", "data", "news", "articles", "stories", "main", "headline"], story: "This is the first article. I am testing the articles to make sure everything works.", date: "July 7, 2023", publish_date: "July 10, 2023", category: "news", views: 0, likes: 0, shares: 0, images: ["hipphopp"])

let dummy_article_3 = Article(main_story: false, breaking: false, headline: "First Story", author: "Paulie", tags: ["test", "dummy", "data", "news", "articles", "stories", "main", "headline"], story: "This is the first article. I am testing the articles to make sure everything works.", date: "July 7, 2023", publish_date: "July 10, 2023", category: "news", views: 0, likes: 0, shares: 0, images: ["hiphopper"])

let dummy_article_4 = Article(main_story: true, breaking: false, headline: "First Story", author: "Paulie", tags: ["test", "dummy", "data", "news", "articles", "stories", "main", "headline"], story: "This is the first article. I am testing the articles to make sure everything works.", date: "July 7, 2023", publish_date: "July 10, 2023", category: "news", views: 0, likes: 0, shares: 0, images: ["rapper"])

let dummy_article_5 = Article(main_story: false, breaking: false, headline: "First Story", author: "Paulie", tags: ["test", "dummy", "data", "news", "articles", "stories", "main", "headline"], story: "This is the first article. I am testing the articles to make sure everything works.", date: "July 7, 2023", publish_date: "July 10, 2023", category: "news", views: 0, likes: 0, shares: 0, images: ["lady"])

let dummy_article_6 = Article(main_story: true, breaking: false, headline: "First Story", author: "Paulie", tags: ["test", "dummy", "data", "news", "articles", "stories", "main", "headline"], story: "This is the seventh article. I am testing the articles to make sure everything works.", date: "July 2, 2023", publish_date: "July 10, 2023", category: "news", views: 0, likes: 0, shares: 0, images: ["guy"])

let dummy_articles = [dummy_article, dummy_article_2, dummy_article_3, dummy_article_4, dummy_article_5, dummy_article_6]

// DUMMY USERS
class FDL {
    var topic: String
    var topic_id: String
    var comments: [String]?
    
    init(topic: String, topic_id: String, comments: [String]? = nil) {
        self.topic = topic
        self.topic_id = topic_id
        self.comments = comments
    }
}
let dummy_user = User(
    username: "Pauli",
    first: "Paul",
    last: "Anthony",
    email: "panthony@here.com",
    password: "9999",
    password_confirmed: true,
    favorites: ["Artist: Jay Z"],
    dislikes: ["Shows: Show 3"],
    likes: ["Articles: Karen"],
    avatar: "rapper",
    light_mode: false,
    host: true,
    comments: ["Articles: 'Karen', Comments: ['I liked it']"],
    is_private: false)
