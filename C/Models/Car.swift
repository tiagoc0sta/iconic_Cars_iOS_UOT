//
//  Car.swift
//  C
//
//  Created by Tiago de Freitas Costa on 2024-07-13.
//

import Foundation

struct Car {
    let id: Int
    let title: String
    let image: String
    let description: String
    let rate: String
    let releaseDate: String
}


let cars: [Car] = [
    Car(id: 1, title: "Ford Mustang", image: "ford_mustang", description: "The Ford Mustang is an American car manufactured by Ford. It was originally conceived by Lee Iacocca. The Mustang made its debut in 1964 and created a new class of automobile known as the pony car.", rate: "4.7", releaseDate: "1964"),
    Car(id: 2, title: "Chevrolet Corvette", image: "chevrolet_corvette", description: "The Chevrolet Corvette, colloquially known as the 'Vette, is a two-door, two-passenger luxury sports car manufactured and marketed by Chevrolet across more than 60 years of production and eight design generations.", rate: "4.8", releaseDate: "1953"),
    Car(id: 3, title: "Porsche 911", image: "porsche_911", description: "The Porsche 911 is a high-performance rear-engined sports car introduced by Porsche AG of Stuttgart, Germany in 1964. It has a distinctive design, rear-engine, and a reputation for high performance.", rate: "4.9", releaseDate: "1964"),
    Car(id: 4, title: "Ferrari F40", image: "ferrari_f40", description: "The Ferrari F40 is a mid-engine, rear-wheel drive sports car built from 1987 to 1992. It was designed to celebrate Ferrari's 40th anniversary and is considered one of the greatest supercars ever made.", rate: "4.9", releaseDate: "1987"),
    Car(id: 5, title: "Lamborghini Miura", image: "lamborghini_miura", description: "The Lamborghini Miura is a sports car produced by Italian automaker Lamborghini between 1966 and 1973. It is widely considered to be the first supercar with a mid-engined, two-seat layout.", rate: "4.8", releaseDate: "1966"),
    Car(id: 6, title: "Aston Martin DB5", image: "aston_martin_db5", description: "The Aston Martin DB5 is a British luxury grand tourer (GT) made by Aston Martin. It is famous for being the most recognized cinematic James Bond car, first appearing in Goldfinger (1964).", rate: "4.7", releaseDate: "1963"),
    Car(id: 7, title: "Jaguar E-Type", image: "jaguar_etype", description: "The Jaguar E-Type, or the XK-E in the United States, is a British sports car that was manufactured by Jaguar Cars Ltd between 1961 and 1975. It is widely considered one of the most beautiful cars ever made.", rate: "4.8", releaseDate: "1961"),
    Car(id: 8, title: "BMW M3", image: "bmw_m3", description: "The BMW M3 is a high-performance version of the BMW 3 Series, developed by BMW's in-house motorsport division, BMW M GmbH. The M3 models have been derived from the E30, E36, E46, E90/E92/E93, and F80 3 Series.", rate: "4.7", releaseDate: "1985"),
    Car(id: 9, title: "Nissan GT-R", image: "nissan_gtr", description: "The Nissan GT-R is a high-performance sports car and grand tourer produced by Nissan, unveiled in 2007. It is the successor to the Nissan Skyline GT-R, although no longer part of the Skyline range itself.", rate: "4.8", releaseDate: "2007"),
    Car(id: 10, title: "Tesla Model S", image: "tesla_model_s", description: "The Tesla Model S is an all-electric five-door liftback sedan, produced by Tesla, Inc., and introduced on June 22, 2012. It is notable for its high performance, long range, and advanced technology.", rate: "4.9", releaseDate: "2012")
]
