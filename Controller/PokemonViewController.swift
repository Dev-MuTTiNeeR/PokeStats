//
//  ViewController.swift
//  PokeStats
//
//  Created by Cem Akkaya on 04/02/26.
//

import UIKit

class PokemonViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statLabel: UILabel!
    
    
    // Defined Manager
    var manager = PokemonManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        searchTextField.delegate = self
        
        pokemonImage.contentMode = .scaleAspectFit
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func updatePlaceholder(text: String, color: UIColor) {
        searchTextField.attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [NSAttributedString.Key.foregroundColor: color]
        )
    }
    
}

// MARK: - PokemonManagerDelegate

extension PokemonViewController: PokemonManagerDelegate {
    func didUpdatePokemon(pokemon: PokemonData) {
        
        // THIS IS VERY CRITICAL!
        // Internet operations are performed in the background (Background Thread).
        // However, changing the text (label) on the screen must be done in the main thread.
        
        DispatchQueue.main.async {            
            self.nameLabel.text = pokemon.name.capitalized // Capitalizes the first letter of the name
            self.statLabel.text = String(pokemon.stats[1].base_stat)
            self.searchTextField.text = ""
            self.updatePlaceholder(text: "Search Pokemon...", color: .lightGray)
        }
        
        // 2. Now it's the IMAGE's turn (String -> URL -> Data -> Image)
        // Convert the link to a secure URL
        if let url = URL(string: pokemon.sprites.front_default) {
            
            // Downloading the image requires internet access, so we're doing it in the BACKGROUND (global).
            DispatchQueue.global().async {
                
                // Try downloading the data (image) from the link
                if let data = try? Data(contentsOf: url) {
                    
                    // Displaying the downloaded data is a VISUAL task, so we're returning to the MAIN LINE.
                    DispatchQueue.main.async {
                        self.pokemonImage.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    func didFailWithError(error: any Error) {
        print("Error: \(error)")
        
        DispatchQueue.main.async {
            self.searchTextField.text = ""
            self.updatePlaceholder(text: "Pokemon not found!", color: .systemRed)
        }
    }
}

extension PokemonViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let name = searchTextField.text {
            manager.fetchPokemon(pokemonName: name)
        }
        searchTextField.text = ""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something..."
            return false
        }
    }
}

