//
//  storySlide.swift
//  Breathing
//
//  Created by Jackie Leonardy on 30/04/21.
//

import UIKit

struct StorySlide{
    let title: String
    let subTitle: String
    let image: UIImage
    let description: NSAttributedString
    
    static func getStory() -> [StorySlide]{
        let firstName = UserDefaults.standard.string(forKey: "FirstName")
        
        var storyArray : [StorySlide] = []
        storyArray.append(StorySlide(title: "Welcome!", subTitle: "Hallo, " + firstName! + " !", image: #imageLiteral(resourceName: "ManMeditation"), description:
                                     NSMutableAttributedString()
                                        .normal("My name is ")
                                         .bold("BreathO")
                                         .normal(" and I will be your guide throughout this journey!\n\n")
                                        .normal("I hope you enjoy and be able to ")
                                        .bold("relief your stress with me!")))
        
        storyArray.append(StorySlide(title: "Stress Management", subTitle: "What is a Stress?", image: #imageLiteral(resourceName: "WomanMeditating"), description:
                                     NSMutableAttributedString()
                                         .bold("Stress ")
                                         .normal("is a feeling of emotional or physical tension. It can come from any event or thought that makes you feel")
                                        .bold(" frustrated, angry, or nervous.\n\n")
                                        .normal("Stress is your body's reaction to a ")
                                        .bold("challenge or demand.")))
        
        storyArray.append(StorySlide(title: "About our Senses", subTitle: "Bring your senses to the rescue", image: #imageLiteral(resourceName: "Senses"), description:
                                     NSMutableAttributedString()
                                         .normal("To use ")
                                        .bold("your senses")
                                        .normal(" to quickly relieve stress, you first need to identify ")
                                        .bold("the sensory experiences")
                                        .normal(" that work best for you. \n\n")
                                        .normal("We can explore variety of senses, such as ")
                                        .bold("Sight, Movement, Sound, Touch, Smell, and Taste!")))
        
        
        storyArray.append(StorySlide(title: "Breathing", subTitle: "The 4-7-8", image: #imageLiteral(resourceName: "MeditatingMan"), description:
                                     NSMutableAttributedString()
                                        .normal("One of senses we can practice is")
                                         .bold(" Breathing. ")
                                         .normal("It helps us to calm our mind, and one of the most")
                                        .bold(" well-known ")
                                        .normal("method is the")
                                        .bold(" 4-7-8 method.\n\n")
                                        .normal("We ")
                                        .bold("inhale")
                                        .normal(" for ")
                                        .bold("4 seconds, hold ")
                                        .normal(" for ")
                                        .bold("7 seconds, and release for 8 seconds.")))
        //https://www.cordem.org/globalassets/files/academic-assembly/2017-aa/handouts/day-three/biofeedback-exercises-for-stress-2---fernances-j.pdf
        return storyArray
    }
}
