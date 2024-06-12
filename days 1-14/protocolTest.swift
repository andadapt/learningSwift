protocol Building {
    var rooms: Int {get set}
    var cost: Int {get set}
    var estateAgent: String  {get set}

    func saleSummary()
}


struct  Home: Building {
    var rooms: Int 
    var cost: Int 
    var estateAgent: String
    func saleSummary() {
        print("rooms \(rooms) the cost is \(cost) and the agent is \(estateAgent)")
    }
}

var myHome = Home(rooms: 4, cost: 40, estateAgent: "Simon")
myHome.saleSummary()