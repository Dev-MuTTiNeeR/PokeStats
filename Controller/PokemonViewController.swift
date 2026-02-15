//
//  ViewController.swift
//  PokeStats
//
//  Created by Cem Akkaya on 04/02/26.
//

import UIKit

class PokemonViewController: UIViewController {

    
    
    // Defined Manager
    var manager = PokemonManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //manager.delegate = self
        
    }
    
}

// MARK: - PokemonManagerDelegate

//extension PokemonViewController: PokemonManagerDelegate {
//    func didUpdatePokemon(pokemon: PokemonData) {
//        
//        // THIS IS VERY CRITICAL!
//        // Internet operations are performed in the background (Background Thread).
//        // However, changing the text (label) on the screen must be done in the main thread.
//        
//        DispatchQueue.main.async {            
//            self.nameLabel.text = pokemon.name.capitalized // Capitalizes the first letter of the name
//        }
//        
//        DispatchQueue.main.async {
//            self.statLabel.text = String(pokemon.stats[1].base_stat)
//        }
//        
//        // 2. Now it's the IMAGE's turn (String -> URL -> Data -> Image)
//        // Convert the link to a secure URL
//        if let url = URL(string: pokemon.sprites.front_default) {
//            
//            // Downloading the image requires internet access, so we're doing it in the BACKGROUND (global).
//            DispatchQueue.global().async {
//                
//                // Try downloading the data (image) from the link
//                if let data = try? Data(contentsOf: url) {
//                    
//                    // Displaying the downloaded data is a VISUAL task, so we're returning to the MAIN LINE.
//                    DispatchQueue.main.async {
//                        self.pokemonImage.image = UIImage(data: data)
//                    }
//                }
//            }
//        }
//    }
//    
//    func didFailWithError(error: any Error) {
//        print("Error: \(error)")
//    }
//}
//
