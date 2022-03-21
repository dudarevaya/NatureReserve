//: [Previous](@previous)

import Foundation

class Animal {
    var energy: Int
    var weight: Int
    var age: Int = 0
    var maxAge: Int
    var name: String
    
    init(energy: Int, weight: Int, maxAge: Int, name: String) {
        self.energy = energy
        self.weight = weight
        self.maxAge = maxAge
        self.name = name
    }
    
    var isTooOld: Bool {
        age >= maxAge
    }
    
    func tryIncrementAge() {
        if Bool.random() && !isTooOld {
            age += 1
        }
    }

    func sleep() {
        energy += 5
        age += 1
        print("\(name) спит")
    }
    
    func move() {
        energy -= 5
        weight -= 1
        tryIncrementAge()
        print("\(name) передвигается")
    }
    
    func eat() {
        energy += 3
        weight += 1
        tryIncrementAge()
        print("\(name) ест")
    }

    func babyBorn() -> Animal {
        let babyAnimal: Animal = Animal(energy: Int.random(in: 1..<10), weight: Int.random(in: 1..<5), maxAge: self.maxAge, name: self.name)
        print("Родился \(babyAnimal.name), возраст: \(babyAnimal.age), вес: \(babyAnimal.weight), энергия: \(babyAnimal.energy)")
        return babyAnimal
    }
}

class Bird: Animal {
    override func move() {
        energy -= 5
        weight -= 1
        tryIncrementAge()
        print("\(name) летит")
    }
    override func babyBorn() -> Bird {
        let babyBird: Bird = Bird(energy: Int.random(in: 1..<10), weight: Int.random(in: 1..<5), maxAge: self.maxAge, name: self.name)
        print("Родился \(babyBird.name), возраст: \(babyBird.age), вес: \(babyBird.weight), энергия: \(babyBird.energy)")
        return babyBird
    }
}

class Fish: Animal {
    override func move() {
        energy -= 5
        weight -= 1
        tryIncrementAge()
        print("\(name) плывет")
    }
    override func babyBorn() -> Fish {
        let babyFish: Fish = Fish(energy: Int.random(in: 1..<10), weight: Int.random(in: 1..<5), maxAge: self.maxAge, name: self.name)
        print("Родился \(babyFish.name), возраст: \(babyFish.age), вес: \(babyFish.weight), энергия: \(babyFish.energy)")
        return babyFish
    }
}

class Dog: Animal {
    override func move() {
        energy -= 5
        weight -= 1
        tryIncrementAge()
        print("\(name) бежит")
    }
    override func babyBorn() -> Dog {
        let babyDog: Dog = Dog(energy: Int.random(in: 1..<10), weight: Int.random(in: 1..<5), maxAge: self.maxAge, name: self.name)
        print("Родился \(babyDog.name), возраст: \(babyDog.age), вес: \(babyDog.weight), энергия: \(babyDog.energy)")
        return babyDog
    }
}

class NatureReserve {
    var reserve = [Bird(energy: 4, weight: 4, maxAge: 5, name: "Фламинго"),
                   Bird(energy: 5, weight: 1, maxAge: 5, name: "Колибри"),
                   Bird(energy: 5, weight: 1, maxAge: 3, name: "Воробей"),
                   Bird(energy: 5, weight: 2, maxAge: 5, name: "Ворон"),
                   Bird(energy: 4, weight: 4, maxAge: 5, name: "Павлин"),
                   Fish(energy: 3, weight: 2, maxAge: 4, name: "Рыба-капля"),
                   Fish(energy: 5, weight: 1, maxAge: 1, name: "Рыба-клоун"),
                   Fish(energy: 4, weight: 4, maxAge: 1, name: "Удильщик"),
                   Dog(energy: 5, weight: 3, maxAge: 3, name: "Далматин"),
                   Dog(energy: 5, weight: 2, maxAge: 1, name: "Чихуахуа"),
                   Animal(energy: 5, weight: 2, maxAge: 5, name: "Кот"),
                   Animal(energy: 5, weight: 5, maxAge: 1, name: "Лошадь")]
    
    func lifeCycle(_ N: Int) {
        for _ in 1...N {
            var new = [Animal]()
            for animal in reserve {
                let random = Int.random(in: 1...4)
                switch random {
                case 1:
                    new.append(animal.babyBorn())
                case 2:
                    animal.sleep()
                case 3:
                    animal.eat()
                default:
                    animal.move()
                }
            }
            reserve.append(contentsOf: new)
            let death: (Animal) -> Bool = {$0.isTooOld}
            reserve.removeAll(where: death)
            
            if reserve.count > 0 {
                print("В заповеднике \(reserve.count) животных")
            }
            if reserve.count == 0 {
                print("Все животные умерли")
                break
            }
        }
    }
}
NatureReserve().lifeCycle(30)
