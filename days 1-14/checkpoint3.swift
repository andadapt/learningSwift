for i in 0 ... 25 {
       if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
print("fizz buzz")
       }
       else if i.isMultiple(of:3) {
        print("fizz")
       }
       else if i.isMultiple(of: 5) {
        print("buzz")
       }  else {
        print(i)
       }
       //below ends loop
}