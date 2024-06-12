struct Car {
    let model: String
    let year: Int
    let seats: Int
     var currentGear = 1

    mutating  func upGear() {
        currentGear += 1
    }

    mutating func downGear () {
        if currentGear == 0 {
            print("you cannot go down a gear!")
        }  else {
            currentGear -= 1
        }
    }

        func gearState() {
            print(currentGear)
        }
    
    // end car struct
}

var myCar = Car(model: "ferrari", year: 2020, seats: 2)

myCar.upGear()
print(myCar.currentGear)
myCar.gearState()

