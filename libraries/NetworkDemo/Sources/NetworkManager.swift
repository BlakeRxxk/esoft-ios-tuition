//
//  NetworkManager.swift
//  Network
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import RxSwift
public struct NetworkManager {
  public init() {}

  static let environment: NetworkEnvironment = .production
  static let MovieAPIKey = ""
  
  let router = Router<MovieApi>()
  public func getMovies(page: Int) -> Observable<Result<Movie, Error>> {
    router.request(.newMovies(page: 1))
  }

}

public struct MovieApiResponse {
  let page: Int
  let numberOfResults: Int
  let numberOfPages: Int
  let movies: [Movie]
}

extension MovieApiResponse: Decodable {
  
  private enum MovieApiResponseCodingKeys: String, CodingKey {
    case page
    case numberOfResults = "total_results"
    case numberOfPages = "total_pages"
    case movies = "results"
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: MovieApiResponseCodingKeys.self)
    
    page = try container.decode(Int.self, forKey: .page)
    numberOfResults = try container.decode(Int.self, forKey: .numberOfResults)
    numberOfPages = try container.decode(Int.self, forKey: .numberOfPages)
    movies = try container.decode([Movie].self, forKey: .movies)
    
  }
}

public struct Movie {
  let id: Int
  let posterPath: String
  let backdrop: String
  let title: String
  let releaseDate: String
  let rating: Double
  let overview: String
}

extension Movie: Codable {
  
  enum MovieCodingKeys: String, CodingKey {
    case id
    case posterPath = "poster_path"
    case backdrop = "backdrop_path"
    case title
    case releaseDate = "release_date"
    case rating = "vote_average"
    case overview
  }
  
  public init(from decoder: Decoder) throws {
    let movieContainer = try decoder.container(keyedBy: MovieCodingKeys.self)
    
    id = try movieContainer.decode(Int.self, forKey: .id)
    posterPath = try movieContainer.decode(String.self, forKey: .posterPath)
    backdrop = try movieContainer.decode(String.self, forKey: .backdrop)
    title = try movieContainer.decode(String.self, forKey: .title)
    releaseDate = try movieContainer.decode(String.self, forKey: .releaseDate)
    rating = try movieContainer.decode(Double.self, forKey: .rating)
    overview = try movieContainer.decode(String.self, forKey: .overview)
  }
}
