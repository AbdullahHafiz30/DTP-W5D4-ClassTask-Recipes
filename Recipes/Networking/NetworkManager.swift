//
//  NetworkManager.swift
//  Recipes
//
//  Created by Abdullah Hafiz on 20/09/1446 AH.
//


//
//  NetworkManager.swift
//  YourBurgerApp
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    // MARK: - GET Request
    func fetchRecipes(
        query: String,                // user typed text
        cuisine: String,             // user-chosen cuisine
        completion: @escaping (Result<[RecipeData], Error>) -> Void
    ) {
        let baseURL = "https://api.spoonacular.com/recipes/complexSearch"
        
        // Provide your actual Spoonacular key:
        let parameters: [String: Any] = [
            "apiKey": "aaa72630aee243578cac51fc5720f874",
            "query": query,
            "cuisine": cuisine,
            "instructionsRequired": true,
            "fillIngredients": true,
            "addRecipeInformation": true
        ]

        AF.request(baseURL, method: .get, parameters: parameters)
            .validate()
            .responseDecodable(of: RecipeResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    // MARK: - POST Request (Example placeholder)
    func postSampleData(
        title: String,
        body: String,
        userId: Int,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        let url = "https://jsonplaceholder.typicode.com/posts"
        let parameters: [String: Any] = [
            "title": title,
            "body": body,
            "userId": userId
        ]

        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .response { response in
                switch response.result {
                case .success(let data):
                    if let data = data {
                        completion(.success(data))
                    } else {
                        let noDataError = AFError.responseValidationFailed(reason: .dataFileNil)
                        completion(.failure(noDataError))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
