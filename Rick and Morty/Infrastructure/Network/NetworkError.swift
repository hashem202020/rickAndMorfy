//
//  NetworkError.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import Foundation
enum NetworkError: Error {
    case invalidResponse
    case requestFailed(Error)
    case decodingFailed(Error)
}
