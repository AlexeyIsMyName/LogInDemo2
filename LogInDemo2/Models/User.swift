//
//  User.swift
//  LogInDemo2
//
//  Created by ALEKSEY SUSLOV on 21.07.2022.
//

struct User {
    let name: String
    let password: String
    let person: Person
}

struct Person {
    let name: String
    let surname: String
    let job: Job
    let hobby: Hobby
}

struct Job {
    let name: String
    let info: String
}

struct Hobby {
    let name: String
    let info: String
}

extension User {
    static func getUser() -> User {
        User(name: "Alex",
             password: "PassW",
             person: Person(
                name: "Aleksey",
                surname: "Suslov",
                job: Job(name: "iOS Developer", info: "Designing and building applications for mobile devices running Apple's iOS operating software."),
                hobby: Hobby(name: "Bicycling", info: "Cycling provides a variety of health benefits and reduces the risk of cancers, heart disease, and diabetes that are prevalent in sedentary lifestyles.")
             ))
    }
}
