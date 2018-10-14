//
//  MockDataBucketListItems.swift
//  BuckIt
//
//  Created by Kelly Johnson on 10/10/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

struct MockDataBucketListItems {
    
    // Bucket List Items
    
    static let item1 = BucketListItem(uid: "01", user: MockDataUsers.luisa, timestamp: Date(), title: "Arrive By Seaplane", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "seaplane")!], experienceDescription: "Não sei onde eu vou, mas quero ir mesmo.")
    static let item2 = BucketListItem(uid: "02", user: MockDataUsers.luisa, timestamp: Date(), title: "Eat Fire", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "fireEat")!], experienceDescription: "O calor não vai me para não!")
    static let item3 = BucketListItem(uid: "03", user: MockDataUsers.luisa, timestamp: Date(), title: "Hang Glide", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "hangglide")!], experienceDescription: "Voar na Asa Delta sempre me fascinou.")
    static let item4 = BucketListItem(uid: "04", user: MockDataUsers.luisa, timestamp: Date(), title: "Snowboard", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "snowboard")!], experienceDescription: "Quero conhecer a terra branca!")
    static let item5 = BucketListItem(uid: "05", user: MockDataUsers.dylon, timestamp: Date(), title: "Milk a Cow", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "milkcow")!], experienceDescription: "I have been near an animal that big and been able to touch it!")
    static let item6 = BucketListItem(uid: "06", user: MockDataUsers.dylon, timestamp: Date(), title: "Sleep in a Yurt", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "sleepyurt")!], experienceDescription: "If it was good enough for Ghengis Khan, then...")
    static let item7 = BucketListItem(uid: "07", user: MockDataUsers.dylon, timestamp: Date(), title: "Witness a Solar Eclipse", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "seeeclipse")!], experienceDescription: "NOw i gotta get those funny glasses, and a plane ticket?")
    static let item8 = BucketListItem(uid: "08", user: MockDataUsers.dylon, timestamp: Date(), title: "Meet a World Leader", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "meetleader")!], experienceDescription: "Even if it's like the president of Fiji of something!")
    static let item9 = BucketListItem(uid: "09", user: MockDataUsers.sangita, timestamp: Date(), title: "Go to an Indy Car Race", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "seeindycar")!], experienceDescription: "I love the smell of burnt rubber, so what better place!")
    static let item10 = BucketListItem(uid: "10", user: MockDataUsers.sangita, timestamp: Date(), title: "Fly on a Trapeze", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "trapeze")!], experienceDescription: "I am such a control freak, that i can't even imagine doing this. But, do something that scares you!")
    static let item11 = BucketListItem(uid: "11", user: MockDataUsers.sangita, timestamp: Date(), title: "See an Opera", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "opera")!], experienceDescription: "And get all dressed to kill!")
    static let item12 = BucketListItem(uid: "12", user: MockDataUsers.sangita, timestamp: Date(), title: "Make My Own Perfume", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "makeperfume")!], experienceDescription: "I bet there are just so many amazing scents out there that I haven't even thought of or heard of!")
    static let item13 = BucketListItem(uid: "13", user: MockDataUsers.rodrigo, timestamp: Date(), title: "Charter a yacht", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "charter_yacht")!], experienceDescription: "Yo no puedo nadar muy bien, pero com un yacht grande, no es necesario!")
    static let item14 = BucketListItem(uid: "14", user: MockDataUsers.rodrigo, timestamp: Date(), title: "Have my Palm Read", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "palm_read")!], experienceDescription: "Los Ciganos siempre fasciname.")
    static let item15 = BucketListItem(uid: "15", user: MockDataUsers.rodrigo, timestamp: Date(), title: "Own a Food Cart", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "food_cart")!], experienceDescription: "La comida de mi abuelita seria un grande sucesso!")
    static let item16 = BucketListItem(uid: "16", user: MockDataUsers.rodrigo, timestamp: Date(), title: "Send a Message in a Bottle", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "message_bottle")!], experienceDescription: "La idea que mis palabras van a llegar en una playa estranjeira encantame.")
    static let item17 = BucketListItem(uid: "17", user: MockDataUsers.park, timestamp: Date(), title: "Walk on a Nude Beach… Naked", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "nude_beach")!], experienceDescription: "I think my parents would die if they knew I did this.")
    static let item18 = BucketListItem(uid: "18", user: MockDataUsers.park, timestamp: Date(), title: "Feed a Homeless Person", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "feed_homeless")!], experienceDescription: "I have always wanted to volunteer more for a worthy cause.")
    static let item19 = BucketListItem(uid: "19", user: MockDataUsers.park, timestamp: Date(), title: "Give a Ted Talk", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "ted_talk")!], experienceDescription: "I think it would mean the world to my mother to see me up there doing something like this.")
    static let item20 = BucketListItem(uid: "20", user: MockDataUsers.park, timestamp: Date(), title: "Meet the Dalai Lama", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "dalai_lama")!], experienceDescription: "I have always been curious about Buddhism, and his story.  He seems like such a cute old man!")
    static let item21 = BucketListItem(uid: "21", user: MockDataUsers.maggie, timestamp: Date(), title: "Do a Color Run", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "color_run")!], experienceDescription: "It looks aboslutley amazing.  All the people having fun and doing a healthy thing!")
    static let item22 = BucketListItem(uid: "22", user: MockDataUsers.maggie, timestamp: Date(), title: "Write a Children’s Book", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "kids_book")!], experienceDescription: "I used to babysit my younger brother and sister, and they remember my stories to this day!")
    static let item23 = BucketListItem(uid: "23", user: MockDataUsers.maggie, timestamp: Date(), title: "Do the Polar Bear Plunge", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "polar_plunge")!], experienceDescription: "These people seem crazy, but if they can do then so can I!")
    static let item24 = BucketListItem(uid: "24", user: MockDataUsers.maggie, timestamp: Date(), title: "Eat a Molecular Gastronomy Dinner", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "molecular_gastronomy")!], experienceDescription: "The crazier the better!")
    static let item25 = BucketListItem(uid: "25", user: MockDataUsers.maggie, timestamp: Date(), title: "Take an Improv Class", isComplete: false, mockPhoto: [UIImage(contentsOfFile: "improv_class")!], experienceDescription: "I have always wanted to see what it was like to be an actor.")
}

