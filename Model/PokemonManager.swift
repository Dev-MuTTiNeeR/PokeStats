//
//  PokemonManager.swift
//  PokeStats
//
//  Created by Cem Akkaya on 04/02/26.
//

import Foundation

// Defining the radio protocol.
protocol PokemonManagerDelegate {
    func didUpdatePokemon(pokemon: PokemonData)
    func didFailWithError(error: Error)
}

struct PokemonManager {
    let pokemonURL = "https://pokeapi.co/api/v2/pokemon/"
    
    // We assign an intern (delegate) to the manager.
    var delegate: PokemonManagerDelegate?
    
    // 1. The function to be called from the Controller
    func fetchPokemon(pokemonName: String) {
        // The name should be in lowercase, that's what the API requires (Pikachu -> pikachu)
        let urlString = "\(pokemonURL)\(pokemonName.lowercased())"
        performRequest(with: urlString)
    }
    
    // 2. The function that makes the main internet request.
    func performRequest(with urlString: String) {
        
        // A. Create a URL (Securely)
        if let url = URL(string: urlString) {
            // Create a Session
            let session = URLSession(configuration: .default)
            
            // C. Assign Task
            // completionHandler: What should I do when I get a response from the internet?
            let task = session.dataTask(with: url) {(data, response, error) in
                
                // Check for errors (e.g., if there is no internet connection)
                if error != nil {
                    print(error!)
                    return
                }
                
                // Has the data arrived?
                if let safeData = data {
                    // We are calling the function that will process the data.
                    parseJSON(pokemonData: safeData)
                }
            }
            
            // D. Start Task (This part is often forgotten!)
            task.resume()
        }
    }
    
    // JSON Decoder
    func parseJSON(pokemonData: Data) {
        let decoder = JSONDecoder()
        
        // There might be an error (e.g., corrupted data), that's why we use do-catch.
        do {
            // decode(WhichFormat.self, from: WhichData)
            let decodedData = try decoder.decode(PokemonData.self, from: pokemonData)
            
            // "I've processed the data, here, use it," we say.
            delegate?.didUpdatePokemon(pokemon: decodedData)
            
        } catch {
            delegate?.didFailWithError(error: error)
        }
    }
}
