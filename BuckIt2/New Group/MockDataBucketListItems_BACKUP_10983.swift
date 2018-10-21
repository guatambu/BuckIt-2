//
//  MockDataBucketListItems.swift
//  BuckIt
//
//  Created by Kelly Johnson on 10/10/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class MockDataBucketListItems {
    
    static let shared = MockDataBucketListItems()
<<<<<<< HEAD
    var bucketListItems: [BucketListItem] = []
    
    init() {
        bucketListItems = MockDataBucketListItems.mockItems
    }
=======
>>>>>>> 053e9010cb475cdfb04dc3424fec72612d477883
    
    
    // Bucket List Items
    
    let item1 = BucketListItem(uid: "01", user: MockDataUsers.shared.luisa, timestamp: Date(), title: "Arrive By Seaplane", isComplete: false, mockPhoto: [UIImage(named: "seaplane")!, UIImage(named: "defaultPhoto")!], experienceDescription: "Não sei onde eu vou, mas quero ir mesmo.")
    let item2 = BucketListItem(uid: "02", user: MockDataUsers.shared.luisa, timestamp: Date(), title: "Eat Fire", isComplete: false, mockPhoto: [UIImage(named: "fire_eat")!], experienceDescription: "O calor não vai me para não!")
    let item3 = BucketListItem(uid: "03", user: MockDataUsers.shared.luisa, timestamp: Date(), title: "Hang Glide", isComplete: false, mockPhoto: [UIImage(named: "hang_glide")!], experienceDescription: "Voar na Asa Delta sempre me fascinou.")
    let item4 = BucketListItem(uid: "04", user: MockDataUsers.shared.luisa, timestamp: Date(), title: "Snowboard", isComplete: false, mockPhoto: [UIImage(named: "snowboard")!], experienceDescription: "Quero conhecer a terra branca!")
    let item5 = BucketListItem(uid: "05", user: MockDataUsers.shared.dylon, timestamp: Date(), title: "Milk a Cow", isComplete: false, mockPhoto: [UIImage(named: "milk_cow")!], experienceDescription: "I have been near an animal that big and been able to touch it!")
    let item6 = BucketListItem(uid: "06", user: MockDataUsers.shared.dylon, timestamp: Date(), title: "Sleep in a Yurt", isComplete: false, mockPhoto: [UIImage(named: "sleep_yurt")!], experienceDescription: "If it was good enough for Ghengis Khan, then...")
    let item7 = BucketListItem(uid: "07", user: MockDataUsers.shared.dylon, timestamp: Date(), title: "Witness a Solar Eclipse", isComplete: false, mockPhoto: [UIImage(named: "see_eclipse")!], experienceDescription: "NOw i gotta get those funny glasses, and a plane ticket?")
    let item8 = BucketListItem(uid: "08", user: MockDataUsers.shared.dylon, timestamp: Date(), title: "Meet a World Leader", isComplete: false, mockPhoto: [UIImage(named: "meet_leader")!], experienceDescription: "Even if it's like the president of Fiji of something!")
    let item9 = BucketListItem(uid: "09", user: MockDataUsers.shared.sangita, timestamp: Date(), title: "Go to an Indy Car Race", isComplete: false, mockPhoto: [UIImage(named: "see_indycar")!], experienceDescription: "I love the smell of burnt rubber, so what better place!")
    let item10 = BucketListItem(uid: "10", user: MockDataUsers.shared.sangita, timestamp: Date(), title: "Fly on a Trapeze", isComplete: false, mockPhoto: [UIImage(named: "trapeze")!], experienceDescription: "I am such a control freak, that i can't even imagine doing this. But, do something that scares you!")
    let item11 = BucketListItem(uid: "11", user: MockDataUsers.shared.sangita, timestamp: Date(), title: "See an Opera", isComplete: false, mockPhoto: [UIImage(named: "opera")!], experienceDescription: "And get all dressed to kill!")
    let item12 = BucketListItem(uid: "12", user: MockDataUsers.shared.sangita, timestamp: Date(), title: "Make My Own Perfume", isComplete: false, mockPhoto: [UIImage(named: "make_perfume")!], experienceDescription: "I bet there are just so many amazing scents out there that I haven't even thought of or heard of!")
    let item13 = BucketListItem(uid: "13", user: MockDataUsers.shared.rodrigo, timestamp: Date(), title: "Charter a yacht", isComplete: false, mockPhoto: [UIImage(named: "charter_yacht")!], experienceDescription: "Yo no puedo nadar muy bien, pero com un yacht grande, no es necesario!")
    let item14 = BucketListItem(uid: "14", user: MockDataUsers.shared.rodrigo, timestamp: Date(), title: "Have my Palm Read", isComplete: false, mockPhoto: [UIImage(named: "palm_read")!], experienceDescription: "Los Ciganos siempre fasciname.")
    let item15 = BucketListItem(uid: "15", user: MockDataUsers.shared.rodrigo, timestamp: Date(), title: "Own a Food Cart", isComplete: false, mockPhoto: [UIImage(named: "food_cart")!], experienceDescription: "La comida de mi abuelita seria un grande sucesso!")
    let item16 = BucketListItem(uid: "16", user: MockDataUsers.shared.rodrigo, timestamp: Date(), title: "Send a Message in a Bottle", isComplete: false, mockPhoto: [UIImage(named: "message_bottle")!], experienceDescription: "La idea que mis palabras van a llegar en una playa estranjeira encantame.")
    let item17 = BucketListItem(uid: "17", user: MockDataUsers.shared.park, timestamp: Date(), title: "Walk on a Nude Beach… Naked", isComplete: false, mockPhoto: [UIImage(named: "nude_beach")!], experienceDescription: "I think my parents would die if they knew I did this.")
    let item18 = BucketListItem(uid: "18", user: MockDataUsers.shared.park, timestamp: Date(), title: "Feed a Homeless Person", isComplete: false, mockPhoto: [UIImage(named: "feed_homeless")!], experienceDescription: "I have always wanted to volunteer more for a worthy cause.")
    let item19 = BucketListItem(uid: "19", user: MockDataUsers.shared.park, timestamp: Date(), title: "Give a Ted Talk", isComplete: false, mockPhoto: [UIImage(named: "ted_talk")!], experienceDescription: "I think it would mean the world to my mother to see me up there doing something like this.")
    let item20 = BucketListItem(uid: "20", user: MockDataUsers.shared.park, timestamp: Date(), title: "Meet the Dalai Lama", isComplete: false, mockPhoto: [UIImage(named: "dalai_lama")!], experienceDescription: "I have always been curious about Buddhism, and his story.  He seems like such a cute old man!")
    let item21 = BucketListItem(uid: "21", user: MockDataUsers.shared.maggie, timestamp: Date(), title: "Do a Color Run", isComplete: false, mockPhoto: [UIImage(named: "color_run")!], experienceDescription: "It looks aboslutley amazing.  All the people having fun and doing a healthy thing!")
    let item22 = BucketListItem(uid: "22", user: MockDataUsers.shared.maggie, timestamp: Date(), title: "Write a Children’s Book", isComplete: false, mockPhoto: [UIImage(named: "kids_book")!], experienceDescription: "I used to babysit my younger brother and sister, and they remember my stories to this day!")
    let item23 = BucketListItem(uid: "23", user: MockDataUsers.shared.maggie, timestamp: Date(), title: "Do the Polar Bear Plunge", isComplete: false, mockPhoto: [UIImage(named: "polar_plunge")!], experienceDescription: "These people seem crazy, but if they can do then so can I!")
    let item24 = BucketListItem(uid: "24", user: MockDataUsers.shared.maggie, timestamp: Date(), title: "Eat a Molecular Gastronomy Dinner", isComplete: false, mockPhoto: [UIImage(named: "molecular_gastronomy")!], experienceDescription: "The crazier the better!")
    let item25 = BucketListItem(uid: "25", user: MockDataUsers.shared.maggie, timestamp: Date(), title: "Take an Improv Class", isComplete: false, mockPhoto: [UIImage(named: "improv_class")!], experienceDescription: "I have always wanted to see what it was like to be an actor.")
    
    
    func mockDataItems() -> [BucketListItem] {
        let item1 = BucketListItem(uid: "01", user: MockDataUsers.shared.luisa, timestamp: Date(), title: "Arrive By Seaplane", isComplete: false, mockPhoto: [UIImage(named: "seaplane")!, UIImage(named: "defaultPhoto")!], experienceDescription: "Não sei onde eu vou, mas quero ir mesmo.")
        let item2 = BucketListItem(uid: "02", user: MockDataUsers.shared.luisa, timestamp: Date(), title: "Eat Fire", isComplete: false, mockPhoto: [UIImage(named: "fire_eat")!], experienceDescription: "O calor não vai me para não!")
        let item3 = BucketListItem(uid: "03", user: MockDataUsers.shared.luisa, timestamp: Date(), title: "Hang Glide", isComplete: false, mockPhoto: [UIImage(named: "hang_glide")!], experienceDescription: "Voar na Asa Delta sempre me fascinou.")
        let item4 = BucketListItem(uid: "04", user: MockDataUsers.shared.luisa, timestamp: Date(), title: "Snowboard", isComplete: false, mockPhoto: [UIImage(named: "snowboard")!], experienceDescription: "Quero conhecer a terra branca!")
        let item5 = BucketListItem(uid: "05", user: MockDataUsers.shared.dylon, timestamp: Date(), title: "Milk a Cow", isComplete: false, mockPhoto: [UIImage(named: "milk_cow")!], experienceDescription: "I have been near an animal that big and been able to touch it!")
        let item6 = BucketListItem(uid: "06", user: MockDataUsers.shared.dylon, timestamp: Date(), title: "Sleep in a Yurt", isComplete: false, mockPhoto: [UIImage(named: "sleep_yurt")!], experienceDescription: "If it was good enough for Ghengis Khan, then...")
        let item7 = BucketListItem(uid: "07", user: MockDataUsers.shared.dylon, timestamp: Date(), title: "Witness a Solar Eclipse", isComplete: false, mockPhoto: [UIImage(named: "see_eclipse")!], experienceDescription: "NOw i gotta get those funny glasses, and a plane ticket?")
        let item8 = BucketListItem(uid: "08", user: MockDataUsers.shared.dylon, timestamp: Date(), title: "Meet a World Leader", isComplete: false, mockPhoto: [UIImage(named: "meet_leader")!], experienceDescription: "Even if it's like the president of Fiji of something!")
        let item9 = BucketListItem(uid: "09", user: MockDataUsers.shared.sangita, timestamp: Date(), title: "Go to an Indy Car Race", isComplete: false, mockPhoto: [UIImage(named: "see_indycar")!], experienceDescription: "I love the smell of burnt rubber, so what better place!")
        let item10 = BucketListItem(uid: "10", user: MockDataUsers.shared.sangita, timestamp: Date(), title: "Fly on a Trapeze", isComplete: false, mockPhoto: [UIImage(named: "trapeze")!], experienceDescription: "I am such a control freak, that i can't even imagine doing this. But, do something that scares you!")
        let item11 = BucketListItem(uid: "11", user: MockDataUsers.shared.sangita, timestamp: Date(), title: "See an Opera", isComplete: false, mockPhoto: [UIImage(named: "opera")!], experienceDescription: "And get all dressed to kill!")
        let item12 = BucketListItem(uid: "12", user: MockDataUsers.shared.sangita, timestamp: Date(), title: "Make My Own Perfume", isComplete: false, mockPhoto: [UIImage(named: "make_perfume")!], experienceDescription: "I bet there are just so many amazing scents out there that I haven't even thought of or heard of!")
        let item13 = BucketListItem(uid: "13", user: MockDataUsers.shared.rodrigo, timestamp: Date(), title: "Charter a yacht", isComplete: false, mockPhoto: [UIImage(named: "charter_yacht")!], experienceDescription: "Yo no puedo nadar muy bien, pero com un yacht grande, no es necesario!")
        let item14 = BucketListItem(uid: "14", user: MockDataUsers.shared.rodrigo, timestamp: Date(), title: "Have my Palm Read", isComplete: false, mockPhoto: [UIImage(named: "palm_read")!], experienceDescription: "Los Ciganos siempre fasciname.")
        let item15 = BucketListItem(uid: "15", user: MockDataUsers.shared.rodrigo, timestamp: Date(), title: "Own a Food Cart", isComplete: false, mockPhoto: [UIImage(named: "food_cart")!], experienceDescription: "La comida de mi abuelita seria un grande sucesso!")
        let item16 = BucketListItem(uid: "16", user: MockDataUsers.shared.rodrigo, timestamp: Date(), title: "Send a Message in a Bottle", isComplete: false, mockPhoto: [UIImage(named: "message_bottle")!], experienceDescription: "La idea que mis palabras van a llegar en una playa estranjeira encantame.")
        let item17 = BucketListItem(uid: "17", user: MockDataUsers.shared.park, timestamp: Date(), title: "Walk on a Nude Beach… Naked", isComplete: false, mockPhoto: [UIImage(named: "nude_beach")!], experienceDescription: "I think my parents would die if they knew I did this.")
        let item18 = BucketListItem(uid: "18", user: MockDataUsers.shared.park, timestamp: Date(), title: "Feed a Homeless Person", isComplete: false, mockPhoto: [UIImage(named: "feed_homeless")!], experienceDescription: "I have always wanted to volunteer more for a worthy cause.")
        let item19 = BucketListItem(uid: "19", user: MockDataUsers.shared.park, timestamp: Date(), title: "Give a Ted Talk", isComplete: false, mockPhoto: [UIImage(named: "ted_talk")!], experienceDescription: "I think it would mean the world to my mother to see me up there doing something like this.")
        let item20 = BucketListItem(uid: "20", user: MockDataUsers.shared.park, timestamp: Date(), title: "Meet the Dalai Lama", isComplete: false, mockPhoto: [UIImage(named: "dalai_lama")!], experienceDescription: "I have always been curious about Buddhism, and his story.  He seems like such a cute old man!")
        let item21 = BucketListItem(uid: "21", user: MockDataUsers.shared.maggie, timestamp: Date(), title: "Do a Color Run", isComplete: false, mockPhoto: [UIImage(named: "color_run")!], experienceDescription: "It looks aboslutley amazing.  All the people having fun and doing a healthy thing!")
        let item22 = BucketListItem(uid: "22", user: MockDataUsers.shared.maggie, timestamp: Date(), title: "Write a Children’s Book", isComplete: false, mockPhoto: [UIImage(named: "kids_book")!], experienceDescription: "I used to babysit my younger brother and sister, and they remember my stories to this day!")
        let item23 = BucketListItem(uid: "23", user: MockDataUsers.shared.maggie, timestamp: Date(), title: "Do the Polar Bear Plunge", isComplete: false, mockPhoto: [UIImage(named: "polar_plunge")!], experienceDescription: "These people seem crazy, but if they can do then so can I!")
        let item24 = BucketListItem(uid: "24", user: MockDataUsers.shared.maggie, timestamp: Date(), title: "Eat a Molecular Gastronomy Dinner", isComplete: false, mockPhoto: [UIImage(named: "molecular_gastronomy")!], experienceDescription: "The crazier the better!")
        let item25 = BucketListItem(uid: "25", user: MockDataUsers.shared.maggie, timestamp: Date(), title: "Take an Improv Class", isComplete: false, mockPhoto: [UIImage(named: "improv_class")!], experienceDescription: "I have always wanted to see what it was like to be an actor.")
        
        let mockDataItems = [item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11, item12, item13, item14, item15, item16, item17, item18, item19, item20, item21, item22, item23, item24, item25]
        
        return mockDataItems
    }

}



