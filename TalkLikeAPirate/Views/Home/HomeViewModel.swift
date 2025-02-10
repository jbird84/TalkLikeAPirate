//
//  HomeViewModel.swift
//  TalkLikeAPirate
//
//  Created by Kinney Kare on 2/9/25.
//

import SwiftUI


class HomeViewModel: ObservableObject {
    
   
    struct CharacterOption {
        let destination: BaseView
        let imageName: String
        let textBelowImage: String
    }
    
     let characterOptions: [CharacterOption] = [
        CharacterOption(
            destination:
                BaseView(
                    spinnerViewImageName: "pirateShip",
                    spinnerViewText: "Translating to Pirate Speak...",
                    characterName: CharacterName.pirate.rawValue,
                    inputViewGenerateButtonColor: .piratePink),
            imageName: "whitePirate",
            textBelowImage: "Pirate"),
        CharacterOption(
                    destination:
                        BaseView(
                            spinnerViewImageName: "greenLightSabre",
                            spinnerViewText: "Translating to Yoda Speak...",
                            characterName: CharacterName.yoda.rawValue,
                            inputViewGenerateButtonColor: .yodaGreen),
                    imageName: "whiteYoda",
                    textBelowImage: "Yoda"
                ),
                CharacterOption(
                    destination:
                        BaseView(
                            spinnerViewImageName: "pigNose",
                            spinnerViewText: "Translating to Pig Latin...",
                            characterName: CharacterName.pig.rawValue,
                            inputViewGenerateButtonColor: .pigPink),
                    imageName: "whitePig",
                    textBelowImage: "Pig Latin"
                )
    ]
    
}
